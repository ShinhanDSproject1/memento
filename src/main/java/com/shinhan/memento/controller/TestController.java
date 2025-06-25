package com.shinhan.memento.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.dto.TestDTO;

@RestController
public class TestController {

	@GetMapping("/test")
	public BaseResponse<Void> test() {
		return new BaseResponse<>(null);
	}
	
	@GetMapping("/test2")
	public BaseResponse<TestDTO> test2() {
		TestDTO test = new TestDTO("정은", 20);
		
		return new BaseResponse<>(test);
	}
}
