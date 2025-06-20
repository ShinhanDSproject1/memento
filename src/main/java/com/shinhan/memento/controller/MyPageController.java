package com.shinhan.memento.controller;

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
}
