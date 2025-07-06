package com.shinhan.memento.service;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

import org.apache.ibatis.jdbc.Null;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import com.shinhan.memento.common.exception.MypageException;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dao.MyPageDAO;
import com.shinhan.memento.dto.ConfirmCashRequestDTO;
import com.shinhan.memento.dto.ConfirmCashResponseDTO;
import com.shinhan.memento.dto.InterestDTO;
import com.shinhan.memento.dto.MyDashboardResponseDTO;
import com.shinhan.memento.dto.MyJoinMatchupByDashboardResponseDTO;
import com.shinhan.memento.dto.MyJoinMentosByDashboardResponseDTO;
import com.shinhan.memento.dto.MyMatchTypeByDashboardResponseDTO;
import com.shinhan.memento.dto.JoinKeepgoingDTO;
import com.shinhan.memento.dto.JoinMatchupDTO;
import com.shinhan.memento.dto.MyMatchupListResponseDTO;
import com.shinhan.memento.dto.MyMentosListResponseDTO;
import com.shinhan.memento.dto.MyPageSideBarResponseDTO;
import com.shinhan.memento.dto.MyPaymentListResponseDTO;
import com.shinhan.memento.dto.MyProfileDBUpdateDTO;
import com.shinhan.memento.dto.MyProfileInfoResponseDTO;
import com.shinhan.memento.dto.MyProfileUpdateRequestDTO;
import com.shinhan.memento.dto.PaymentDetailResponseDTO;
import com.shinhan.memento.dto.RefundRequestDTO;
import com.shinhan.memento.dto.SparkTestResultRequestDTO;
import com.shinhan.memento.dto.SparkTestResultResponseDTO;
import com.shinhan.memento.dto.ValidateCashRequestDTO;
import com.shinhan.memento.dto.ValidateCashResponseDTO;
import com.shinhan.memento.dto.mentos.JoinMentosDTO;
import com.shinhan.memento.mapper.InterestMapper;
import com.shinhan.memento.mapper.MypageMapper;
import com.shinhan.memento.model.BaseStatus;
import com.shinhan.memento.model.CashProduct;
import com.shinhan.memento.model.MemberMentos;
import com.shinhan.memento.model.PayType;
import com.shinhan.memento.model.Payment;
import com.shinhan.memento.model.Payment_Step;
import com.shinhan.memento.model.SparkTestType;

import org.springframework.beans.factory.annotation.Value;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MyPageService {

	@Autowired
	MyPageDAO myPageDAO;

	@Autowired
	MypageMapper mypageMapper;

	@Autowired
	private InterestMapper interestMapper;

	@Value("${file.upload.dir}")
	private String uploadDir;
	
	@Autowired
	private MemberMentosService memberMentosService;
	
	//킵고잉 탈퇴용
	@Autowired
	SqlSession sqlSession;
	String keepNamespace = "com.shinhan.memento.dao.MemberKeepgoingDAOInterface.";
	//매치업 참여 취소
	String matchupNamespace = "com.shinhan.memento.dao.MemberMatchUpDAO.";
	
	public ValidateCashResponseDTO validateCash(ValidateCashRequestDTO reqDTO, int userId) {
		CashProduct product = myPageDAO.validateCash(reqDTO.getCashProductID());
		String orderId = UUID.randomUUID().toString();
		System.out.println(orderId);
		Payment payment = Payment.builder().memberId(userId).orderId(orderId).amount(product.getAmount())
				.step(Payment_Step.WAIT).payType(PayType.CHARGE).status(BaseStatus.ACTIVE).build();

		int result = myPageDAO.insertPayment(payment);
		if (result != 1)
			throw new MypageException(BaseExceptionResponseStatus.FAILURE);

		return ValidateCashResponseDTO.builder().orderId(orderId).amount(product.getAmount())
				.orderName(product.getOrderName()).bonus(product.getBonus()).cash(product.getCash()).build();
	}

	public ConfirmCashResponseDTO confirmCash(ConfirmCashRequestDTO reqDTO, int userId) {

		// 1) DB에서 orderId로 결제건 조회 (임시건)
		Payment payment = myPageDAO.selectPaymentByOrderId(reqDTO.getOrderId());
		log.info("[payment]" + payment.getOrderId());

		if (payment == null || payment.getMemberId() != userId) {
			throw new MypageException(BaseExceptionResponseStatus.CANNOT_FOUND_MEMBER, "유효하지 않은 주문번호");
		}
		// 2) 결제금액 일치 검증
		if (payment.getAmount() != reqDTO.getAmount()) {
			throw new MypageException(BaseExceptionResponseStatus.FAILURE, "결제금액 불일치");
		}

		// 3) (필요시) Toss 결제 승인 API 호출 (여기서 외부 API 호출)
		// - 예시로, 외부 호출 코드만 구조적으로 삽입
		boolean tossSuccess = callTossPaymentsConfirmApi(reqDTO);
		if (!tossSuccess)
			throw new MypageException(BaseExceptionResponseStatus.FAILURE, "토스 결제 승인 실패");

		// 4) 결제 상태 'SUCCESS'로 변경
		CashProduct cash = CashProduct.fromAmount(payment.getAmount());
		int updatePaymentSuccess = myPageDAO.updatePaymentSuccess(payment.getOrderId(), cash.getCash());
		if (updatePaymentSuccess != 1)
			throw new MypageException(BaseExceptionResponseStatus.FAILURE, "DB 상태 변경 실패");

		// 5) 잔액 상태 업데이트
		int updateUserBalance = myPageDAO.updateUserBalance(userId, cash.getCash());
		if (updateUserBalance != 1)
			throw new MypageException(BaseExceptionResponseStatus.FAILURE, "잔액 변경 실패");

		// 6) 응답 DTO 구성
		return ConfirmCashResponseDTO.builder().orderId(payment.getOrderId()).amount(payment.getAmount())
				.cash(cash.getCash()).status("SUCCESS").message("결제가 성공적으로 완료되었습니다").build();
	}

	/* 실제 Toss API 호출 */
	private boolean callTossPaymentsConfirmApi(ConfirmCashRequestDTO reqDTO) {
		try {
			String tossSecretKey = "test_gsk_docs_OaPz8L5KdmQXkzRz3y47BMw6"; // 너의 시크릿키로 변경
			String apiUrl = "https://api.tosspayments.com/v1/payments/confirm";

			// 1. HTTP Basic Auth 헤더 만들기
			String encodedAuth = Base64.getEncoder()
					.encodeToString((tossSecretKey + ":").getBytes(StandardCharsets.UTF_8));
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			headers.set("Authorization", "Basic " + encodedAuth);

			// 2. 요청 바디 만들기
			Map<String, Object> params = new HashMap<>();
			params.put("paymentKey", reqDTO.getPaymentKey());
			params.put("orderId", reqDTO.getOrderId());
			params.put("amount", reqDTO.getAmount());

			// 3. RestTemplate로 POST 요청
			HttpEntity<Map<String, Object>> request = new HttpEntity<>(params, headers);
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<String> response = restTemplate.postForEntity(apiUrl, request, String.class);

			// 4. 응답 코드 200이면 승인 성공
			if (response.getStatusCode() == HttpStatus.OK) {
				return true;
			} else {
				System.err.println("[Toss 승인 실패] status=" + response.getStatusCode() + ", body=" + response.getBody());
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false; // 승인 실패 처리
		}
	}

	public List<MyMentosListResponseDTO> selectMyMentosListById(Integer memberId) {
		return myPageDAO.selectMyMentosListById(memberId);
	}

	public List<MyMatchupListResponseDTO> selectJoinListByMemberId(Integer memberId) {
		return myPageDAO.selectJoinListByMemberId(memberId);
	}

	public List<MyPaymentListResponseDTO> selectMyPaymentListById(Integer memberId) {
		List<Map<String, Object>> result = mypageMapper.selectMyPaymentListById(memberId);
		List<MyPaymentListResponseDTO> selectMyPaymentList = new ArrayList<MyPaymentListResponseDTO>();

		result.stream().forEach(data -> {
			MyPaymentListResponseDTO dto = MyPaymentListResponseDTO.builder().orderId((String) data.get("ORDERID"))
					.amount(((BigDecimal) data.get("AMOUNT")).intValue()).payType((String) data.get("PAYTYPE"))
					.matchupId(((BigDecimal) data.get("MATCHUPID")).intValue())
					.mentosId(((BigDecimal) data.get("MENTOSID")).intValue())
					.keepgoingId(((BigDecimal) data.get("KEEPGOINGID")).intValue())
					.paymentStatus((String) data.get("PAYMENTSTATUS"))
					.matchupTitle(((BigDecimal) data.get("MATCHUPID")).intValue() == 0 ? null
							: (String) data.get("MATCHUPTITLE"))
					.mentosTitle(((BigDecimal) data.get("MENTOSID")).intValue() == 0 ? null
							: (String) data.get("MENTOSTITLE"))
					.keepgoingName(((BigDecimal) data.get("KEEPGOINGID")).intValue() == 0 ? null
							: (String) data.get("KEEPGOINGNAME"))
					.build();

			selectMyPaymentList.add(dto);
		});

		return selectMyPaymentList;
	}

	public SparkTestResultResponseDTO updateSparkType(SparkTestResultRequestDTO reqDTO, int memberId) {

		log.info("[updateSparkType - service]");
		SparkTestType sparkType = reqDTO.getSparkResultType();
		int metchTypeId = mypageMapper.selectMatchTypebyName(sparkType);
		int updateTypeResult = mypageMapper.updateMyTypeByMemberId(metchTypeId, memberId);

		return SparkTestResultResponseDTO.builder().result(updateTypeResult == 1 ? "success" : "fail").build();
	}

	@Transactional
	public boolean updateProfile(Integer memberId, MyProfileUpdateRequestDTO dto, MultipartFile imgFile) {
		String imageUrl = null;
		if (imgFile != null && !imgFile.isEmpty()) {
			try {
				File dir = new File(uploadDir);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				// 확장자 추출 + 고유 파일명 생성
				String ext = getFileExtension(imgFile.getOriginalFilename());
				String savedFileName = UUID.randomUUID().toString() + (ext != null ? "." + ext : "");
				File destFile = new File(dir, savedFileName);
				Files.copy(imgFile.getInputStream(), destFile.toPath(), StandardCopyOption.REPLACE_EXISTING);

				// 웹에서 접근 가능한 경로로 구성 (리소스 경로 기준)
				imageUrl = "/resources/uploadImage/" + savedFileName;
				log.info("이미지 저장 완료: {}", imageUrl);
			} catch (IOException e) {
				log.error("이미지 업로드 실패", e);
				return false;
			}
		} else {
			imageUrl = dto.getOriginalProfileUrl();
		}

		// 주소, 관심사 쪼개기
		String regeionGroup = "";
		String regionSubGroup = "";
		String regionDetail = "";
		if (dto.getAddress().trim() != "") {
			String[] locationInfo = dto.getAddress().split(" ");
			if (locationInfo.length == 1) {
				regeionGroup = locationInfo[0].trim();
			} else if (locationInfo.length == 2) {
				regeionGroup = locationInfo[0].trim();
				regionSubGroup = locationInfo[1].trim();
			} else {
				regeionGroup = locationInfo[0].trim();
				regionSubGroup = locationInfo[1].trim();
				for (int i = 2; i < locationInfo.length; i++) {
					regionDetail += locationInfo[i];
				}
				regionDetail.trim();
			}
		}

		MyProfileDBUpdateDTO myProfileDBUpdateDTO = MyProfileDBUpdateDTO.builder().memberId(memberId)
				.nickname(dto.getNickname()).phoneNumber(dto.getPhone()).introduce(dto.getIntroduction())
				.regionGroup(regeionGroup == "" ? null : regeionGroup)
				.regionSubGroup(regionSubGroup == "" ? null : regionSubGroup)
				.regionDetail(regionDetail == "" ? null : regionDetail).profileImageUrl(imageUrl).build();

		int result = mypageMapper.updateProfileInfo(myProfileDBUpdateDTO);

		List<String> inputInterestNamesList = new ArrayList<>();
		String interestString = dto.getInterestNames();

		if (interestString != null && !interestString.trim().isEmpty()) {
			String processedNames = interestString.replaceAll("(?i)c#", "C_SHARP"); // 임시 문자로 변경
			String[] tags = processedNames.trim().split("\\s+");

			for (String tag : tags) {
				String cleanTag = tag;

				// 4. 태그가 #으로 시작하면 #을 제거
				if (cleanTag.startsWith("#")) {
					cleanTag = cleanTag.substring(1);
				}

				// 5. C# 복원
				if (cleanTag.equalsIgnoreCase("C_SHARP")) {
					cleanTag = "C#";
				}

				// 6. *** 가장 중요한 부분 ***
				// 정리된 태그가 비어있지 않을 때만 리스트에 추가합니다.
				if (!cleanTag.isEmpty()) {
					inputInterestNamesList.add(cleanTag);
				}
			}
		}

		// 입력받은 관심사 이름을 Set으로 변환
		Set<String> inputInterestNameSet = inputInterestNamesList.stream().map(String::toUpperCase) // <-- 이 부분을 추가하여
																									// 대문자로 통일
				.collect(Collectors.toSet());

		for (String input : inputInterestNameSet) {
			System.out.println("after: " + input);
		}

		// member id로 이전 관심사들 모두 조회
		List<InterestDTO> beforeMyInterestList = interestMapper.getMemberInterestsByMemberId(memberId);

		Set<String> beforeMyInterSet = new HashSet<String>();

		if (beforeMyInterestList != null && !beforeMyInterestList.isEmpty()) {
			for (InterestDTO interest : beforeMyInterestList) {
				if (interest != null && interest.getInterestName() != null) {
					beforeMyInterSet.add(interest.getInterestName().toUpperCase());
				}
			}
		}
		for (String name : beforeMyInterSet) {
			System.out.println("before: " + name);
		}

		if (inputInterestNameSet.isEmpty()) {
			beforeMyInterestList.stream().forEach(interest -> {
				interestMapper.deleteMemberInterest(memberId, interest.getInterestId());
			});
		} else {
			System.out.println(inputInterestNameSet.equals(beforeMyInterSet));
			if (!inputInterestNameSet.equals(beforeMyInterSet)) {
				// 현재 - 과거 (현재에는 있고 과거에는 없는) -> insert
				Set<String> differenceAB = inputInterestNameSet.stream()
						.filter(element -> !beforeMyInterSet.contains(element)).collect(Collectors.toSet());

				// 과거 - 현재 (과거에는 있고 현재에는 없는) -> delete
				Set<String> differenceBA = beforeMyInterSet.stream()
						.filter(element -> !inputInterestNameSet.contains(element)).collect(Collectors.toSet());

				// 삽입로직
				// 삽입로직 (MERGE 구문 사용 시)
				for (String interestName : differenceAB) {
					// 1. MERGE 구문이 알아서 삽입/무시를 처리해줍니다.
					interestMapper.insertInterest(interestName);

					// 2. 이제 interest는 반드시 존재하므로, 바로 조회해서 사용합니다.
					interestMapper.insertMemberInterestByName(memberId, interestName);
				}

				// 삭제로직
				for (String interestName : differenceBA) {
					System.out.println(interestName);
					InterestDTO interest = interestMapper.getInterestByName(interestName);
					System.out.println(interest);
					if (interest != null) {
						interestMapper.deleteMemberInterest(memberId, interest.getInterestId());
					}
				}
			}
		}

		return result == 1;
	}

	public MyProfileInfoResponseDTO selectMyProfileInfo(Integer memberId) {
		List<Map<String, Object>> result = mypageMapper.selectMyProfileInfo(memberId);
		String profileImageUrl = (String) result.get(0).get("PROFILEIMAGEURL");
		String nickName = (String) result.get(0).get("NICKNAME");
		String introduce = (String) result.get(0).get("INTRODUCE");
		String regionGroup = result.get(0).get("REGIONGROUP") == null ? "" : (String) result.get(0).get("REGIONGROUP");
		String regionSubGroup = result.get(0).get("REGIONSUBGROUP") == null ? ""
				: (String) result.get(0).get("REGIONSUBGROUP");
		String regionDetail = result.get(0).get("REGIONDETAIL") == null ? ""
				: (String) result.get(0).get("REGIONDETAIL");
		String locationInfo = regionGroup + " " + regionSubGroup + " " + regionDetail;
		String phoneNumber = result.get(0).get("PHONENUMBER") == null ? "" : (String) result.get(0).get("PHONENUMBER");
		String interestNames = result.stream()
				.map(data -> data.get("INTERESTNAME") == null ? "" : (String) data.get("INTERESTNAME"))
				.collect(Collectors.joining(" "));

		MyProfileInfoResponseDTO dto = MyProfileInfoResponseDTO.builder().profileImgUrl(profileImageUrl)
				.nickName(nickName).introduce(introduce).location(locationInfo).phoneNumber(phoneNumber)
				.interestName(interestNames).build();
		return dto;

	}

	private String getFileExtension(String fileName) {
		if (fileName != null && fileName.contains(".")) {
			return fileName.substring(fileName.lastIndexOf('.') + 1);
		}
		return null;
	}

	public List<PaymentDetailResponseDTO> selectPaymentDetail(String orderId) {
		List<Map<String, Object>> result = mypageMapper.selectPaymentDetail(orderId);
		List<PaymentDetailResponseDTO> selectPaymentDetailList = new ArrayList<>();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // Adjust format as needed

		result.stream().forEach(data -> {
			Timestamp payAtTimestamp = (Timestamp) data.get("PAYAT");
			Timestamp mentosStartDay = (Timestamp) data.get("MENTOSSTARTDAY");
			String payAtFormatted = null;
			String startDayFormatted = null;
			if (payAtTimestamp != null) {
				// Convert Timestamp to Date and then format to String
				payAtFormatted = formatter.format(new Date(payAtTimestamp.getTime()));
			}
			if (mentosStartDay != null) {
				// Convert Timestamp to Date and then format to String
				startDayFormatted = formatter.format(new Date(mentosStartDay.getTime()));
			}

			PaymentDetailResponseDTO dto = PaymentDetailResponseDTO.builder().orderId((String) data.get("ORDERID"))
					.amount(((BigDecimal) data.get("AMOUNT")).intValue())
					.matchupId(((BigDecimal) data.get("MATCHUPID")).intValue())
					.matchupTitle(((BigDecimal) data.get("MATCHUPID")).intValue() == 0 ? null
							: (String) data.get("MATCHUPTITLE"))
					.matchupCount(
							data.get("MATCHUPCOUNT") == null ? 0 : ((BigDecimal) data.get("MATCHUPCOUNT")).intValue())
					.matchupPrice(
							data.get("MATCHUPPRICE") == null ? 0 : ((BigDecimal) data.get("MATCHUPPRICE")).intValue())
					.memberProfileImageUrl((String) data.get("MEMBERPROFILEIMAGEURL"))
					.mentosId(((BigDecimal) data.get("MENTOSID")).intValue())
					.mentosTitle(((BigDecimal) data.get("MENTOSID")).intValue() == 0 ? null
							: (String) data.get("MENTOSTITLE"))
					.mentosImage((String) data.get("MENTOSIMAGE")).mentosStartDay(startDayFormatted)
					.mentosPrice(
							data.get("MENTOSPRICE") == null ? 0 : ((BigDecimal) data.get("MENTOSPRICE")).intValue())
					.keepgoingId(((BigDecimal) data.get("KEEPGOINGID")).intValue())
					.keepgoingName(((BigDecimal) data.get("KEEPGOINGID")).intValue() == 0 ? null
							: (String) data.get("KEEPGOINGNAME"))
					.keepgoingImgLogo((String) data.get("KEEPGOINGIMGLOGO"))
					.keepgoingPrice(data.get("KEEPGOINGPRICE") == null ? 0
							: ((BigDecimal) data.get("KEEPGOINGPRICE")).intValue())
					.payAt(payAtFormatted).payType((String) data.get("PAYTYPE")).status((String) data.get("STATUS"))
					.build();

			selectPaymentDetailList.add(dto);
		});

		return selectPaymentDetailList;
	}
	
	public MyDashboardResponseDTO selectDataByDashboard(Integer memberId) {
		//매치업	
		List<Map<String, Object>> matchUpData = mypageMapper.myJoinMatchupByDashboard(memberId);
		List<MyJoinMatchupByDashboardResponseDTO> myMatchupDTOList = new ArrayList<>();
		
		matchUpData.stream().forEach(data -> {
			String role = ((BigDecimal)data.get("LEADERID")).intValue() == memberId ? "Leader":"follower";
			Boolean hasmento = false;
			Object hasMentoValue = data.get("HASMENTO");

			// 값이 null이 아니고, 숫자(Number) 타입인지 확인합니다.
			if (hasMentoValue instanceof Number) {
			    // Number 타입의 값을 int로 변환하여 1과 같은지 비교합니다.
			    // 1이면 true, 그 외의 숫자(0 등)는 false가 됩니다.
			    hasmento = ((Number) hasMentoValue).intValue() == 1;
			}
			MyJoinMatchupByDashboardResponseDTO dto = MyJoinMatchupByDashboardResponseDTO.builder()
					.leaderProfileImageUrl((String)data.get("LEADERPROFILEIMAGEURL"))
					.title((String)data.get("TITLE"))
					.role(role)
					.totalCount(((BigDecimal)data.get("TOTALCOUNT")).intValue())
					.currentCount(((BigDecimal)data.get("CURRENTCOUNT")).intValue())
					.matchStatus((String)data.get("MATCHSTATUS"))
					.hasMento(hasmento)
					.build();
			
			myMatchupDTOList.add(dto);
		});
		
		//멘토스
		List<Map<String, Object>> mentosData = mypageMapper.myJoinMentosByDashboard(memberId);
		List<MyJoinMentosByDashboardResponseDTO> myMentosDTOList = new ArrayList<>();
		
		mentosData.stream().forEach(data -> {
			String mentoNickname = ((BigDecimal)data.get("MENTOID")).intValue() == memberId ? "Mentor": (String)data.get("MENTONICKNAME");
			MyJoinMentosByDashboardResponseDTO dto = MyJoinMentosByDashboardResponseDTO.builder()
					.mentosTitle((String)data.get("MENTOSTITLE"))
					.mentosImage((String)data.get("MENTOSIMAGE"))
					.mentoNickname(mentoNickname)
					.mentosStatus((String)data.get("MENTOSSTATUS"))
					.build();
			
			myMentosDTOList.add(dto);
		});
		
		//matchType 스파크
		MyMatchTypeByDashboardResponseDTO myMatchTypeData = mypageMapper.myMatchTypeByDashboard(memberId);
	
		MyDashboardResponseDTO dashboardData = MyDashboardResponseDTO.builder()
				.myMatchupDashboardList(myMatchupDTOList)
				.myMentosDashboardList(myMentosDTOList)
				.myMatchTypeData(myMatchTypeData)
				.build();
		
		return dashboardData;
	}
	

	@Transactional
	public boolean refundAction(Integer memberId, String orderId) {
		boolean result = true;
		// 주문 번호로 킵고잉 아이디, 멘토스 아이디, 매치업 아이디, 충전
		List<Map<String, Object>> refundDataMap = mypageMapper.refundSelectData(memberId, orderId);
		List<RefundRequestDTO> refundDataList = new ArrayList<RefundRequestDTO>();

		refundDataMap.stream().forEach(data -> {
			RefundRequestDTO dto = RefundRequestDTO.builder().orderId((String) data.get("ORDERID"))
					.amount(data.get("AMOUNT") == null ? 0 : ((BigDecimal)data.get("AMOUNT")).intValue())
					.payType((String) data.get("PAYTYPE"))
					.matchupId(data.get("MATCHUPID") == null ? 0 : ((BigDecimal) data.get("MATCHUPID")).intValue())
					.matchupPrice(
							data.get("MATCHUPPRICE") == null ? 0 : ((BigDecimal) data.get("MATCHUPPRICE")).intValue())
					.mentosId(data.get("MENTOSID") == null ? 0 : ((BigDecimal) data.get("MENTOSID")).intValue())
					.mentosPrice(
							data.get("MENTOSPRICE") == null ? 0 : ((BigDecimal) data.get("MENTOSPRICE")).intValue())
					.keepgoingId(
							data.get("KEEPGOINGID") == null ? 0 : ((BigDecimal) data.get("KEEPGOINGID")).intValue())
					.keepgoingPrice(data.get("KEEPGOINGPRICE") == null ? 0
							: ((BigDecimal) data.get("KEEPGOINGPRICE")).intValue())
					.userBalance(
							data.get("USERBALANCE") == null ? 0 : ((BigDecimal) data.get("USERBALANCE")).intValue())
					.memberPoint(
							data.get("MEMBERPOINT") == null ? 0 : ((BigDecimal) data.get("MEMBERPOINT")).intValue())
					.build();

			refundDataList.add(dto);
		});
		RefundRequestDTO shareDataDTO = refundDataList.get(0);
		Integer initBalance = shareDataDTO.getUserBalance();
		Integer amount = shareDataDTO.getAmount();
		String payType = shareDataDTO.getPayType();

		//CHARGE or USE or REFUND -> REFUND의 경우 버튼이 존재하지 않음
		System.out.println(payType);

		if(payType.equalsIgnoreCase("REFUND")) {
			return false;
		}else if(payType.equalsIgnoreCase("CHARGE")) {
			System.out.println(initBalance);
			System.out.println(amount);
			if(initBalance < amount) {
				return false;
			}else {
				System.out.println("어");
				initBalance -= amount;
			}
		}else {
			//루프 돌면서 금액 계산 및 탈퇴
			System.out.println("디");
			for (RefundRequestDTO refund : refundDataList) {
				if (refund.getMatchupId() != 0) {
					//매치업 취소
					System.out.println("가");
					JoinMatchupDTO jmatchDto = new JoinMatchupDTO(refund.getMatchupId(), memberId);
					int jmatchCancel = sqlSession.update(matchupNamespace+"cancelJoinMatchupBy2id",jmatchDto);
					System.out.println(jmatchCancel);
					if(jmatchCancel > 0) {
						initBalance += refund.getMatchupPrice();
					}else {
						return false;
					}
					
				}
				if (refund.getMentosId() != 0) {
					// 멘토스 취소
					System.out.println("문");
					JoinMentosDTO jmentosDto = new JoinMentosDTO(refund.getMentosId(), memberId);
					MemberMentos mm =  memberMentosService.checkValidMemberMentos(jmentosDto);
					int jmentosCancel = memberMentosService.cancelJoinMentos(mm.getMemberMentosId());
					System.out.println(jmentosCancel);
					if(jmentosCancel > 0) {
						initBalance += refund.getMentosPrice();
					}else {
						return false;
					}
					
				}
				if (refund.getKeepgoingId() != 0) {
					//킵고잉 탈퇴
					System.out.println("제");
					JoinKeepgoingDTO jkeepDto = new JoinKeepgoingDTO(refund.getKeepgoingId(), memberId);
					int jkeepcancel = sqlSession.update(keepNamespace+"cancelMemberKeepgoingBy2id", jkeepDto);
					System.out.println(jkeepcancel);
					if(jkeepcancel > 0) {
						initBalance += refund.getKeepgoingPrice();
					}else {
						return false;
					}
				}
			}
		}
		
		//user balance update
		System.out.println("야");
		Integer resultBalance = initBalance;
		System.out.println(resultBalance);
		int balanceUpdateResult = mypageMapper.updateUserBalanceByRefund(resultBalance, memberId);
		System.out.println(balanceUpdateResult);
		if(balanceUpdateResult <= 0) {
			return false;
		}
		System.out.println("?");
		// payment update -> 주문번호
		int paymentUpateRefundResult = mypageMapper.updatePaymentByRefund(orderId);
		System.out.println(paymentUpateRefundResult);
		if(paymentUpateRefundResult <= 0) {
			return false;
		}
		
		return result;
	}
	
	public MyPageSideBarResponseDTO selectMySideBarInfo(Integer memberId) {
		MyPageSideBarResponseDTO dto = mypageMapper.selectMySideBarInfo(memberId);
		return dto;
	}

}
