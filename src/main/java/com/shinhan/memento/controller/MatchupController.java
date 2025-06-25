package com.shinhan.memento.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
	
	@GetMapping("/createMatchup")
	public String f3() {
		return "/matchup/createMatchup";
	}
	
	@GetMapping("/updateMatchup")
	public String f4() {
		return "/matchup/updateMatchup";
	}

	@GetMapping("/matchupList")
	public String f5() {
		return "/matchup/matchupList";
	}
}
