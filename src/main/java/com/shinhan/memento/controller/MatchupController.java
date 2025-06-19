package com.shinhan.memento.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MatchupController {
	
	@GetMapping("/matchupDetail")
	public String f1() {
		return "/matchup/matchupDetail";
	}
	
	@GetMapping("/matchupDetailLeader")
	public String f2() {
		return "/matchup/matchupDetailLeader";
	}

}
