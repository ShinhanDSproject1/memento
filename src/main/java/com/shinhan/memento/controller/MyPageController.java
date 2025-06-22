package com.shinhan.memento.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@RequestMapping({"", "/", "/{section}", "/{section}/{sub}"})
	public String mypageEntry() {
	    return "mypage/mypage-main";
	}
	
	@RequestMapping("/dashBoard")
	public String dashBoard(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	        return "mypage/dashBoard"; // ✨ screen 전용 뷰
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/dashBoard"); // 실제 경로 지정
	        return "mypage/mypage-main"; // 전체 레이아웃에서 내부에서 AJAX 호출
	    }
	}
	
	@RequestMapping("/spark-test")
	public String sparkTest(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	        return "mypage/spark-test/spark-test-main"; // ✨ screen 전용 뷰
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/spark-test"); // 실제 경로 지정
	        return "mypage/mypage-main"; // 전체 레이아웃에서 내부에서 AJAX 호출
	    }
	}
}
