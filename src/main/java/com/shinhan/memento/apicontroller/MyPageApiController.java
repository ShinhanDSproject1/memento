package com.shinhan.memento.apicontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.shinhan.memento.common.exception.MemberException;
import com.shinhan.memento.common.exception.MypageException;
import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.mypage.ConfirmCashRequestDTO;
import com.shinhan.memento.dto.mypage.ConfirmCashResponseDTO;
import com.shinhan.memento.dto.mypage.MentoTestCheckExpirationResponseDTO;
import com.shinhan.memento.dto.mypage.MentoTestResultRequestDTO;
import com.shinhan.memento.dto.mypage.MentoTestResultResponseDTO;
import com.shinhan.memento.dto.mypage.MentoTestStartResponseDTO;
import com.shinhan.memento.dto.mypage.MyDashboardResponseDTO;
import com.shinhan.memento.dto.mypage.MyMentosListResponseDTO;
import com.shinhan.memento.dto.mypage.MyPageSideBarResponseDTO;
import com.shinhan.memento.dto.mypage.MyPaymentListResponseDTO;
import com.shinhan.memento.dto.mypage.MyProfileInfoResponseDTO;
import com.shinhan.memento.dto.mypage.MyProfileUpdateRequestDTO;
import com.shinhan.memento.dto.mypage.MypageKeepgoingHistoryDTO;
import com.shinhan.memento.dto.mypage.MypageMatchupListDTO;
import com.shinhan.memento.dto.mypage.PaymentDetailResponseDTO;
import com.shinhan.memento.dto.mypage.SparkTestResultRequestDTO;
import com.shinhan.memento.dto.mypage.SparkTestResultResponseDTO;
import com.shinhan.memento.dto.mypage.ValidateCashRequestDTO;
import com.shinhan.memento.dto.mypage.ValidateCashResponseDTO;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.model.UserType;
import com.shinhan.memento.service.MemberKeepgoingService;
import com.shinhan.memento.service.MemberService;
import com.shinhan.memento.service.MyPageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/mypage")
public class MyPageApiController {
	@Autowired
	MyPageService myPageService;
	
	@Autowired
	MemberKeepgoingService memberKeepgoingService;
	
	@Autowired
	MemberService memberService;
	
	@PostMapping("/spark-test-result")
	public BaseResponse<SparkTestResultResponseDTO> sparkTestResult(@RequestBody SparkTestResultRequestDTO reqDTO,HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		int userId = loginCheck(loginUser);
		
		SparkTestResultResponseDTO resDTO = myPageService.updateSparkType(reqDTO, userId);
		return new BaseResponse<>(resDTO);
	}

	@PostMapping("/validate-cash")
    public BaseResponse<ValidateCashResponseDTO> validateCash(@RequestBody ValidateCashRequestDTO reqDTO,HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		int userId = loginCheck(loginUser);

		ValidateCashResponseDTO resDTO = myPageService.validateCash(reqDTO, userId);
        return new BaseResponse<>(resDTO);
    }
	
	@PostMapping("/confirm-cash")
	public BaseResponse<ConfirmCashResponseDTO> confirmCash(@RequestBody ConfirmCashRequestDTO reqDTO, HttpSession session){
		Member loginUser = (Member) session.getAttribute("loginUser");
		int userId = loginCheck(loginUser);
		
		ConfirmCashResponseDTO resDTO = myPageService.confirmCash(reqDTO,userId);
        return new BaseResponse<>(resDTO);
	}

	
	@GetMapping(value="/mymentos-list", produces = "application/json")
	public BaseResponse<List<MyMentosListResponseDTO>> selectMyMentosListById(HttpSession session){
		Member loginUser = (Member) session.getAttribute("loginUser");
		Integer memberId = loginCheck(loginUser);
		List<MyMentosListResponseDTO> myMentosList = myPageService.selectMyMentosListById(memberId);
		
		return new BaseResponse<>(myMentosList);
	}
	
	@GetMapping(value="/profile-info", produces = "application/json")
	public BaseResponse<MyProfileInfoResponseDTO> selectMyProfileInfo(HttpSession session){
		Member loginUser = (Member) session.getAttribute("loginUser");
		Integer memberId = loginCheck(loginUser);
		MyProfileInfoResponseDTO profileInfoDTO = myPageService.selectMyProfileInfo(memberId);
		
		return new BaseResponse<>(profileInfoDTO);
	}
	
	@PutMapping(value = "/profile-update")
	public BaseResponse<Boolean> updateMyProfile(HttpSession session, @RequestParam(value = "imageFile", required = false) MultipartFile imageFile ,@ModelAttribute MyProfileUpdateRequestDTO dto){
		Member loginUser = (Member) session.getAttribute("loginUser");
		Integer memberId = loginCheck(loginUser);
		boolean result = myPageService.updateProfile(memberId,dto,imageFile);

		return new BaseResponse<Boolean>(result);
	}

	@PostMapping("/mento-test-check-expiration")
	public BaseResponse<MentoTestCheckExpirationResponseDTO> checkExpiration(HttpSession session){
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) throw new MypageException(BaseExceptionResponseStatus.NEED_LOGIN);
		int userId = loginUser.getMemberId();
		
		MentoTestCheckExpirationResponseDTO resDTO = myPageService.checkExpiration(userId);
		return new BaseResponse<>(resDTO);
	}
	
	@PostMapping("/mento-test-start")
	public BaseResponse<MentoTestStartResponseDTO> startTest(HttpSession session){
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) throw new MypageException(BaseExceptionResponseStatus.NEED_LOGIN);
		int userId = loginUser.getMemberId();
		
		
		MentoTestStartResponseDTO resDTO = myPageService.testing(userId);
		return new BaseResponse<>(resDTO);
	}
	
	@PostMapping("/mento-test-result")
	public BaseResponse<MentoTestResultResponseDTO> result(@RequestBody MentoTestResultRequestDTO reqDTO, HttpSession session){
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) throw new MypageException(BaseExceptionResponseStatus.NEED_LOGIN);
		int userId = loginUser.getMemberId();
		
		MentoTestResultResponseDTO resDTO = myPageService.gradeMentoTest(userId, reqDTO.getAnswers());
		session.setAttribute("mentoTestResult", resDTO);
		return new BaseResponse<>(resDTO);
	}

	@GetMapping(value="/mymatchup-list", produces = "application/json")
	public BaseResponse<MypageMatchupListDTO> selectJoinListByMemberId(HttpSession session){
		Member loginUser = (Member) session.getAttribute("loginUser");
		Integer memberId = loginCheck(loginUser);
		MypageMatchupListDTO memberMatchUpList = myPageService.selectJoinMatchupListByMemberId(memberId);
		
		if(memberMatchUpList == null) {
			return new BaseResponse<>(null);
		}
		
		return new BaseResponse<>(memberMatchUpList);
	}
	
	/**
	 * 마이페이지(킵고잉 이용내역 조회)
	 */
	@GetMapping("/history/keepgoing")
	public BaseResponse<List<MypageKeepgoingHistoryDTO>> showKeepgoingHistoryByMemberId(@RequestParam int memberId) {
		log.info("[MypageController.showKeepgoingHistory]");
		// mentoId 로 들어온 식별자값이 db에서 유효한 사용자인지 검증
		Map<String, Object> memberCheckParams = new HashMap<>();
		memberCheckParams.put("memberId", memberId);
		memberCheckParams.put("userType", String.valueOf(UserType.MENTO));
		Member member = memberService.findMemberByIdAndUserType(memberCheckParams);
		if (member == null) {
			throw new MemberException(BaseExceptionResponseStatus.CANNOT_FOUND_MEMBER);
		}
		return new BaseResponse<>(memberKeepgoingService.showKeepgoingHistoryByMemberId(memberId));
	}
	
	@GetMapping(value="/paymentlist", produces = "application/json")
	public BaseResponse<List<MyPaymentListResponseDTO>> selectMyPaymentList(HttpSession session){
		Member loginUser = (Member) session.getAttribute("loginUser");
		int userId = loginCheck(loginUser);
		List<MyPaymentListResponseDTO> myPaymentList = myPageService.selectMyPaymentListById(userId);
		
		return new BaseResponse<>(myPaymentList);
	}
  
	@GetMapping(value="/paymentdetail", produces = "application/json")
	public BaseResponse<List<PaymentDetailResponseDTO>> selectPaymentDetail(@RequestParam String orderId, HttpSession session){
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) throw new MypageException(BaseExceptionResponseStatus.NEED_LOGIN);
		List<PaymentDetailResponseDTO> paymentDetailList = myPageService.selectPaymentDetail(orderId);
		
		return new BaseResponse<>(paymentDetailList);
	}
	
	@GetMapping(value="/dashboard-data", produces = "application/json")
	public BaseResponse<MyDashboardResponseDTO> selectMyDashboardData(HttpSession session){
		Member loginUser = (Member) session.getAttribute("loginUser");
		Integer memberId = loginCheck(loginUser);
		
		MyDashboardResponseDTO dashboardResponseDTO = myPageService.selectDataByDashboard(memberId);
		
		return new BaseResponse<MyDashboardResponseDTO>(dashboardResponseDTO);
	}
	
	public Integer loginCheck(Member loginUser) {
		if (loginUser == null) throw new MypageException(BaseExceptionResponseStatus.NEED_LOGIN);
		return loginUser.getMemberId();
	}
	
	@PutMapping(value = "/refund")
	public BaseResponse<Boolean> updateRefund(HttpSession session, @RequestParam String orderId){
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) throw new MypageException(BaseExceptionResponseStatus.NEED_LOGIN);
		Integer memberId = loginUser.getMemberId();
		System.out.println(orderId);
		
		Boolean result = myPageService.refundAction(memberId, orderId);
		
		return new BaseResponse<Boolean>(result);
	}
	
	@GetMapping(value = "/sidebar-info",  produces = "application/json")
	public BaseResponse<MyPageSideBarResponseDTO> selectMySideBarInfo(HttpSession session){
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) throw new MypageException(BaseExceptionResponseStatus.NEED_LOGIN);
		Integer memberId = loginUser.getMemberId();
		MyPageSideBarResponseDTO dto = myPageService.selectMySideBarInfo(memberId);
		return new BaseResponse<MyPageSideBarResponseDTO>(dto);
	}
}
