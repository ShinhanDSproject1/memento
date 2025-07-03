package com.shinhan.memento.api;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.common.exception.MypageException;
import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.ConfirmCashRequestDTO;
import com.shinhan.memento.dto.ConfirmCashResponseDTO;
import com.shinhan.memento.dto.MyMentosListResponseDTO;
import com.shinhan.memento.dto.MyProfileInfoResponseDTO;
import com.shinhan.memento.dto.SparkTestResultRequestDTO;
import com.shinhan.memento.dto.SparkTestResultResponseDTO;
import com.shinhan.memento.dto.ValidateCashRequestDTO;
import com.shinhan.memento.dto.ValidateCashResponseDTO;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.service.MemberKeepgoingService;
import com.shinhan.memento.service.MemberService;
import com.shinhan.memento.service.MyPageService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/api/mypage")
public class MyPageApiController {
	
	private final MyPageService myPageService;
	private final MemberKeepgoingService memberKeepgoingService;
	private final MemberService memberService;
	
	
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

}
