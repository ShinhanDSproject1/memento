package com.shinhan.memento.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MatchupController {
	
	@GetMapping("/matchuptest")
	public String f1() {
		return "matchupDetail";
	}

}
