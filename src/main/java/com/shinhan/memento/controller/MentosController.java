package com.shinhan.memento.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchTypeDTO;
import com.shinhan.memento.model.Mentos;
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
	public String mentosEdit(@RequestParam int mentosId, Model model) {
		
		
		List<LanguageDTO> languages = mentosService.getAllLanguages();
		List<CategoryDTO> categories = mentosService.getAllCategories();
		List<MatchTypeDTO> matchTypes = mentosService.getAllMatchTypes();
		
//		model.addAttribute("mentos", mentos);
		model.addAttribute("languages", languages);
		model.addAttribute("categories", categories);
		model.addAttribute("matchTypes", matchTypes);
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
