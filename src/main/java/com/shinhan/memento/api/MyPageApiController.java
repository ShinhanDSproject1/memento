package com.shinhan.memento.api;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.common.exception.MypageException;
import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.ConfirmCashRequestDTO;
import com.shinhan.memento.dto.ConfirmCashResponseDTO;
import com.shinhan.memento.dto.ValidateCashRequestDTO;
import com.shinhan.memento.dto.ValidateCashResponseDTO;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.service.MyPageService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/api/mypage")
public class MyPageApiController {
	
	private final MyPageService myPageService;

	@PostMapping("/validate-cash")
    public BaseResponse<ValidateCashResponseDTO> validateCash(@RequestBody ValidateCashRequestDTO reqDTO,HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) throw new MypageException(BaseExceptionResponseStatus.NEED_LOGIN);
		int userId = loginUser.getMemberId();
		
		//테스트용
		//int userId = 1;
		ValidateCashResponseDTO resDTO = myPageService.validateCash(reqDTO, userId);
        return new BaseResponse<>(resDTO);
    }
	
	@PostMapping("/confirm-cash")
	public BaseResponse<ConfirmCashResponseDTO> confirmCash(@RequestBody ConfirmCashRequestDTO reqDTO, HttpSession session){
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) throw new MypageException(BaseExceptionResponseStatus.NEED_LOGIN);
		int userId = loginUser.getMemberId();
		
		//테스트용
		//int userId = 1;
		
		ConfirmCashResponseDTO resDTO = myPageService.confirmCash(reqDTO,userId);
        return new BaseResponse<>(resDTO);
	}
}
