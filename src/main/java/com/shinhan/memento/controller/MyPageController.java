package com.shinhan.memento.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@RequestMapping("/page1")
	public String myPageView() {
		return "mypage/mypage1";
	}
	
	@RequestMapping("/page2")
	public String myPageView2() {
		return "mypage/mypage2";
	}
	
	@RequestMapping("/page3")
	public String myPageView3() {
		return "mypage/mypage3";
	}
	
	@RequestMapping("/page4")
	public String myPageView4() {
		return "mypage/mypage4";
	}
	
	@RequestMapping("/page5")
	public String myPageView5() {
		return "mypage/mypage5";
	}
	
	@RequestMapping("/page6")
	public String myPageView6() {
		return "mypage/mypage6";
	}
	
	@RequestMapping("/page7")
	public String myPageView7() {
		return "mypage/mypage7";
	}
	
	@RequestMapping("/page8")
	public String myPageView8() {
		return "mypage/mypage8";
	}
	
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
	
	@RequestMapping("/dashBoard/calender")
	public String calender(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	        return "mypage/dash-board/attendance-calender"; // ✨ screen 전용 뷰
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/dashBoard/calender"); // 실제 경로 지정
	        return "mypage/mypage-main"; // 전체 레이아웃에서 내부에서 AJAX 호출
	    }
	}
	
	@RequestMapping("/cash-recharge")
	public String cashRecharge(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	        return "mypage/cash-recharge/cash-recharge-main"; // ✨ screen 전용 뷰
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/cash-recharge"); // 실제 경로 지정
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

	@RequestMapping("/mento-test")
	public String metnoTest(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	        return "mypage/mento-test/mento-test-main"; // ✨ screen 전용 뷰
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/mento-test"); // 실제 경로 지정
	        return "mypage/mypage-main"; // 전체 레이아웃에서 내부에서 AJAX 호출
	    }
	}
}
