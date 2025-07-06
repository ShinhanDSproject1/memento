package com.shinhan.memento.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.shinhan.memento.dto.mentos.GetMentosDetailDTO;
import com.shinhan.memento.model.Mentos;
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

	/*
	 * 멘토스 생성하기
	 */
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
	public String mentosEdit(@RequestParam int mentosId, Model model, HttpSession session) {
		
		List<LanguageDTO> languages = mentosService.getAllLanguages();
		List<CategoryDTO> categories = mentosService.getAllCategories();
		List<MatchTypeDTO> matchTypes = mentosService.getAllMatchTypes();
		
		model.addAttribute("loginUser", session.getAttribute("loginUser"));
		model.addAttribute("mentosId", mentosId);
		model.addAttribute("languages", languages);
		model.addAttribute("categories", categories);
		model.addAttribute("matchTypes", matchTypes);
		return "mentos/mentosEdit";
	}

	@RequestMapping("/mentodetail")
	public String mentosMentoDetail() {
		return "mentos/mentosMentoDetail";
	}

	/*
	 * 멘토 페이지-멘토스 리뷰보기
	 */
	@RequestMapping("/mentodetailreview")
	public String mentosMentoDetailReview(@RequestParam("mentoId") int mentoId, Model model) {
		log.info("[MentoDetailViewController.showMentoDetailClassListPage]");
		model.addAttribute("mentoId", mentoId);  
	    return "mentos/mentosMentoDetailReview";
	}

	/*
	 * 멘토 페이지-진행한 멘토스 리스트
	 */
	@RequestMapping("/mentodetaillist")
	public String showMentoDetailClassListPage(@RequestParam("mentoId") int mentoId, Model model) {
		log.info("[MentoDetailViewController.showMentoDetailClassListPage]");
		model.addAttribute("mentoId", mentoId);
		return "mentos/mentosMentoDetailClassList";
	}

}
