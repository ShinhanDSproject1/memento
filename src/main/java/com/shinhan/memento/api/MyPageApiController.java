package com.shinhan.memento.api;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.service.MyPageService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/api/mentos")
public class MyPageApiController {
	
	private final MyPageService myPageService;

}
