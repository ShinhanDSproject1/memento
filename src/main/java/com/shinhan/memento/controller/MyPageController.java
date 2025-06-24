package com.shinhan.memento.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@RequestMapping("/page1")
	public String myPageView1(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	        return "mypage/dash-board/dashboard"; // 화면 컨텐츠만 반환
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/page1");
	        return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
	    }
	}
	
	@RequestMapping("/page2")
	public String myPageView2(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	        return "mypage/profile/profile"; // 화면 컨텐츠만 반환
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/page2");
	        return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
	    }
	}
	
	@RequestMapping("/page3")
	public String myPageView3(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	        return "mypage/pay/pay"; // 화면 컨텐츠만 반환
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/page3");
	        return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
	    }
	}
	
	@RequestMapping("/page4")
	public String myPageView4(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	        return "mypage/pay/paydetail"; // 화면 컨텐츠만 반환
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/page4");
	        return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
	    }
	}
	
	@RequestMapping("/page5")
	public String myPageView5(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	        return "mypage/pay/payback"; // 화면 컨텐츠만 반환
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/page5");
	        return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
	    }
	}

	@RequestMapping("/page6")
	public String myPageView6(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	        return "mypage/dash-board/matchuplist"; // 화면 컨텐츠만 반환
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/page6");
	        return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
	    }
	}
	
	@RequestMapping("/page7")
	public String myPageView7(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	        return "mypage/dash-board/mentoslist"; // 화면 컨텐츠만 반환
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/page7");
	        return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
	    }
	}
	
	@RequestMapping("/page8")
	public String myPageView8(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	        return "mypage/dash-board/keepgoinglist"; // 화면 컨텐츠만 반환
	    } else {
	        request.setAttribute("initialPage", "/memento/mypage/page8");
	        return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
	    }
	}
	
	@RequestMapping({"", "/", "/{section}", "/{section}/{sub}"})
	public String mypageEntry() {
	    return "mypage/mypage-main";

	}
	
	@RequestMapping("/dashBoard")
	public String dashBoard(HttpServletRequest request) {
	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	    if (isAjax) {
	        return "mypage/dash-board/dashBoard"; // ✨ screen 전용 뷰
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
