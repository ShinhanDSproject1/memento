package com.shinhan.memento.api;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.dto.MyMentosListResponseDTO;
import com.shinhan.memento.service.MyPageService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/api/mypage")
public class MyPageApiController {
	
	private final MyPageService myPageService;
	
	@GetMapping("/page7")
	public BaseResponse<List<MyMentosListResponseDTO>> selectMyMentosListById(@RequestParam Integer memberId){
		return new BaseResponse<>(myPageService.selectMyMentosListById(memberId));
	}

}
