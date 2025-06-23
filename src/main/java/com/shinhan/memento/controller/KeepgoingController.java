package com.shinhan.memento.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/keepgoing")
public class KeepgoingController {
	
	@GetMapping("keepgoinginsert.do")
	public String keepgoingInsert(){
		return "keepgoing/keepgoing-insert";
	}
	
	@GetMapping("keepgoinglist.do")
	public String keepgoingList(){
		return "keepgoing/keepgoing-list";
	}
	
	@GetMapping("keepgoingupdate.do")
	public String keepgoingUpdate(){
		return "keepgoing/keepgoing-update";
	}
	
	@GetMapping("keepgoingdetail.do")
	public String keepgoingDetail(){
		return "keepgoing/keepgoing-detail";
	}
	
	@GetMapping("keepgoingmember.do")
	public String keepgoingMember(){
		return "keepgoing/keepgoing-member";
	}
}
