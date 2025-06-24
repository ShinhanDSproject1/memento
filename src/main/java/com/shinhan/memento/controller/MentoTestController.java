package com.shinhan.memento.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/mento-test")
public class MentoTestController {

	@RequestMapping("/mento-test-description")
	public  String description(HttpServletRequest request) {
		 boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		    if (isAjax) {
		        return "mypage/mento-test/mento-test-description"; // ✨ screen 전용 뷰
		    } else {
		        request.setAttribute("initialPage", "/memento/mypage/mento-test/mento-test-description"); // 실제 경로 지정
		        return "mypage/mypage-main"; // 전체 레이아웃에서 내부에서 AJAX 호출
		    }
	}
	
	@RequestMapping("/mento-test-start")
	public  String start(HttpServletRequest request) {
		 boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		    if (isAjax) {
		        return "mypage/mento-test/mento-test-start"; // ✨ screen 전용 뷰
		    } else {
		        request.setAttribute("initialPage", "/memento/mypage/mento-test/mento-test-start"); // 실제 경로 지정
		        return "mypage/mypage-main"; // 전체 레이아웃에서 내부에서 AJAX 호출
		    }
	}
}
