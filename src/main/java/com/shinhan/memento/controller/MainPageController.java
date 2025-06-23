package com.shinhan.memento.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("/mainpage")
@Controller
public class MainPageController {

	@RequestMapping("/main1")
	public String mainPageView() {
		return "mainpage/mainpage";
	}
	
	@RequestMapping("/404error")
	public String error() {
		return "mainpage/404error";
	}
	
	@RequestMapping("/500error")
	public String error404() {
	    return "mainpage/500error";
	}

		
	@RequestMapping("/already")
	public String already() {
		return "mainpage/already";
	}
	
	@RequestMapping("/payment")
	public String payment() {
		return "mainpage/payment";
	}

	@RequestMapping("/bye_modal")
	public String bye_modal() {
		return "mainpage/bye_modal";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "mainpage/login";
	}
	@RequestMapping("/mainTest")
	public String mainTest() {
		return "mainpage/mainTest";
	}
	
	@RequestMapping("/")
	public String home() {
		return "mainpage/mainpage";
	}
}
