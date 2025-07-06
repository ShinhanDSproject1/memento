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
import com.shinhan.memento.service.MentosService;

@Controller
@RequestMapping("/mentos")
public class MentosController {
	
	@Autowired
	MentosService mentosService;

	@RequestMapping("/full")
	public String mentosAllView() {
		return "mentos/mentosFull";
	}

	@RequestMapping("/detailPage")
	public String mentosDetailView(HttpSession session,@RequestParam int mentosId) {
		// 로그인 하고 있는 유저가 이 멘토스에 대해 해당 멘토스를 만든 멘토라면 mentosDetailMento.jsp 를 보여주고 그게 아니라면 mentosDetailMenti.jsp 보여주기
		Member member = (Member) session.getAttribute("loginUser");
		
		if(!(member.getUserType().equals(UserType.MENTI)) && mentosService.checkPermission(member, mentosId)) {
			//true 이면 이 멘토스 만든 멘토인거 
			return "mentos/mentosDetailMento";
		}
		// 그냥 일반 유저인거
		return "mentos/mentosDetailMenti";
		
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

	@RequestMapping("/mentodetailclasslist")
	public String mentosMentoDetailClassList() {
		return "mentos/mentosMentoDetailClassList";
	}

}
