package com.shinhan.memento.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shinhan.memento.common.exception.MemberException;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchTypeDTO;
import com.shinhan.memento.dto.mentoDetail.MentoDetailClassDTO;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.model.UserType;
import com.shinhan.memento.service.MemberService;
import com.shinhan.memento.service.MentosService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/mentos")
public class MentosController {

	@Autowired
	MentosService mentosService;
	
	@Autowired
	MemberService memberService;

	@RequestMapping("/full")
	public String mentosAllView() {
		return "mentos/mentosFull";
	}

	@RequestMapping("/detail")
	public String mentosDetailView() {
		return "mentos/mentosDetail";
	}

	@RequestMapping("/create")
	public String mentosInsert(Model model) {
		List<LanguageDTO> languages = mentosService.getAllLanguages();
		List<CategoryDTO> categories = mentosService.getAllCategories();
		List<MatchTypeDTO> matchTypes = mentosService.getAllMatchTypes();

		model.addAttribute("languages", languages);
		model.addAttribute("categories", categories);
		model.addAttribute("matchTypes", matchTypes);
		return "mentos/mentosCreate";
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

	@RequestMapping("/mentodetaillist")
	public String showMentoDetailClassListPage(@RequestParam("mentoId") int mentoId, Model model) {
		log.info("[MentoDetailViewController.showMentoDetailClassListPage]");

		model.addAttribute("memberId", mentoId);
		return "mentos/mentosMentoDetailClassList"; // → JSP 페이지 경로
	}

}
