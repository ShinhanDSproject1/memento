package com.shinhan.memento.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.shinhan.memento.common.exception.MemberException;
import com.shinhan.memento.common.exception.MypageException;
import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.ConfirmCashRequestDTO;
import com.shinhan.memento.dto.ConfirmCashResponseDTO;
import com.shinhan.memento.dto.MyMatchupListResponseDTO;
import com.shinhan.memento.dto.MyMentosListResponseDTO;
import com.shinhan.memento.dto.MyProfileInfoResponseDTO;
import com.shinhan.memento.dto.MyProfileUpdateRequestDTO;
import com.shinhan.memento.dto.MyPaymentListResponseDTO;
import com.shinhan.memento.dto.MypageKeepgoingHistoryDTO;
import com.shinhan.memento.dto.PaymentDetailResponseDTO;
import com.shinhan.memento.dto.SparkTestResultRequestDTO;
import com.shinhan.memento.dto.SparkTestResultResponseDTO;
import com.shinhan.memento.dto.ValidateCashRequestDTO;
import com.shinhan.memento.dto.ValidateCashResponseDTO;
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
		if (loginUser == null) throw new MypageException(BaseExceptionResponseStatus.NEED_LOGIN);
		int userId = loginUser.getMemberId();
		
		SparkTestResultResponseDTO resDTO = myPageService.updateSparkType(reqDTO, userId);
		return new BaseResponse<>(resDTO);
	}

	@PostMapping("/validate-cash")
    public BaseResponse<ValidateCashResponseDTO> validateCash(@RequestBody ValidateCashRequestDTO reqDTO,HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) throw new MypageException(BaseExceptionResponseStatus.NEED_LOGIN);
		int userId = loginUser.getMemberId();

		ValidateCashResponseDTO resDTO = myPageService.validateCash(reqDTO, userId);
        return new BaseResponse<>(resDTO);
    }
	
	@PostMapping("/confirm-cash")
	public BaseResponse<ConfirmCashResponseDTO> confirmCash(@RequestBody ConfirmCashRequestDTO reqDTO, HttpSession session){
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) throw new MypageException(BaseExceptionResponseStatus.NEED_LOGIN);
		int userId = loginUser.getMemberId();
		
		ConfirmCashResponseDTO resDTO = myPageService.confirmCash(reqDTO,userId);
        return new BaseResponse<>(resDTO);
	}

	
	@GetMapping("/page7")
	public BaseResponse<List<MyMentosListResponseDTO>> selectMyMentosListById(@RequestParam Integer memberId){
		return new BaseResponse<>(myPageService.selectMyMentosListById(memberId));
	}
	
	@GetMapping(value="/profile-info", produces = "application/json")
	public BaseResponse<MyProfileInfoResponseDTO> selectMyProfileInfo(HttpSession session){
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) throw new MypageException(BaseExceptionResponseStatus.NEED_LOGIN);
		int userId = loginUser.getMemberId();
		MyProfileInfoResponseDTO profileInfoDTO = myPageService.selectMyProfileInfo(userId);
		
		return new BaseResponse<>(profileInfoDTO);
	}
	
	@PostMapping(value = "/profile-update")
	public BaseResponse<Boolean> updateMyProfile(HttpSession session, @RequestParam(value = "imageFile", required = false) MultipartFile imageFile ,@ModelAttribute MyProfileUpdateRequestDTO dto){
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) throw new MypageException(BaseExceptionResponseStatus.NEED_LOGIN);
		int userId = loginUser.getMemberId();
		
		boolean result = myPageService.updateProfile(userId,dto,imageFile);

		return new BaseResponse<Boolean>(result);
	}

	@GetMapping(value="/page6/{memberId}", produces = "application/json")
	public BaseResponse<List<MyMatchupListResponseDTO>> selectJoinListByMemberId(
				@PathVariable Integer memberId
			){
		List<MyMatchupListResponseDTO> memberMatchUpList = myPageService.selectJoinListByMemberId(memberId);
		if(memberMatchUpList.size() == 0) {
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
		if (loginUser == null) throw new MypageException(BaseExceptionResponseStatus.NEED_LOGIN);
		int userId = loginUser.getMemberId();
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
}
