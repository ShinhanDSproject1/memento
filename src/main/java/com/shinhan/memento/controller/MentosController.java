package com.shinhan.memento.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mentos")
public class MentosController {

	@RequestMapping("/full")
	public String mentosAllView() {
		return "mentos/mentosFull";
	}

	@RequestMapping("/detail")
	public String mentosDetailView() {
		return "mentos/mentosDetail";
	}

	@RequestMapping("/insert")
	public String mentosInsert() {
		return "mentos/mentosInsert";
	}

	@RequestMapping("/edit")
	public String mentosEdit() {
		return "mentos/mentosEdit";
	}

	@RequestMapping("/mentodetail")
	public String mentosMentoDetail() {
		return "mentos/mentosMentoDetail";
	}

	@RequestMapping("/mentodetailreview")
	public String mentosMentoDetailReview() {
		return "mentos/mentosMentoDetailReview";
	}

	@RequestMapping("/mentodetailclasslist")
	public String mentosMentoDetailClassList() {
		return "mentos/mentosMentoDetailClassList";
	}

}
