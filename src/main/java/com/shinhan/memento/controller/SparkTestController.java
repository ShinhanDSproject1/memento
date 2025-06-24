package com.shinhan.memento.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/spark-test")
public class SparkTestController {
	
	@RequestMapping("/spark-test-start")
	public String sparkTestStart(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	    	return "mypage/spark-test/spark-test-start"; // ✨ screen 전용 뷰
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/spark-test/spark-test-start"); // 실제 경로 지정
	        return "mypage/mypage-main"; // 전체 레이아웃에서 내부에서 AJAX 호출
	    }
	}
	
	@RequestMapping("/spark-test-type-check")
	public String sparkTestType(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	    	return "mypage/spark-test/spark-test-type-check"; // ✨ screen 전용 뷰
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/spark-test/spark-test-type-check"); // 실제 경로 지정
	        return "mypage/mypage-main"; // 전체 레이아웃에서 내부에서 AJAX 호출
	    }
	}
	
	@RequestMapping("/spark-test-end")
	public String sparkTestEnd(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	    	return "mypage/spark-test/spark-test-end"; // ✨ screen 전용 뷰
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/spark-test/spark-test-end"); // 실제 경로 지정
	        return "mypage/mypage-main"; // 전체 레이아웃에서 내부에서 AJAX 호출
	    }
	}
}	
