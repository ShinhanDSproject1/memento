package com.shinhan.memento.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchTypeDTO;
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

	@RequestMapping("/detailPage")
	public String mentosDetailView(HttpSession session,@RequestParam int mentosId, Model model) {
		// 로그인 하고 있는 유저가 이 멘토스에 대해 해당 멘토스를 만든 멘토라면 mentosDetailMento.jsp 를 보여주고 그게 아니라면 mentosDetailMenti.jsp 보여주기
		Member member = (Member) session.getAttribute("loginUser");
		
		model.addAttribute("mentosId",mentosId);
		if(!(member.getUserType().equals(UserType.MENTI)) && mentosService.checkPermission(member, mentosId)) {
			//true 이면 이 멘토스 만든 멘토인거 
			return "mentos/mentosDetailMento";
		}
		// 그냥 일반 유저인거
		return "mentos/mentosDetailMenti";
		
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

	@RequestMapping("/editPage")
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

	/*
	 * 멘토 페이지-홈 (소개글)
	 */
	@RequestMapping("/mentodetail")
	public String mentosMentoDetail(@RequestParam("mentoId") int mentoId, Model model) {
		model.addAttribute("mentoId", mentoId);
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
