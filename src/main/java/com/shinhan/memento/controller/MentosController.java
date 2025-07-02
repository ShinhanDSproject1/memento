package com.shinhan.memento.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shinhan.memento.common.exception.MentosException;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.DetailMentosDTO;
import com.shinhan.memento.service.MentosService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mentos")
@Slf4j
public class MentosController {

	@Autowired
	private MentosService mentosService;

	@RequestMapping("/full")
	public String mentosAllView() {
		return "mentos/mentosFull";
	}


	@GetMapping("/detail")
	public String getMentosDetailView(@RequestParam int mentosId, Model model) {
		log.info("[MentosController.getMentosDetailView] mentosId: {}", mentosId);		

		DetailMentosDTO dto = mentosService.getMentosDetail(mentosId);
		if (dto == null) {
			throw new MentosException(BaseExceptionResponseStatus.MENTOS_NOT_FOUND);
		}

		model.addAttribute("mentosDetail", dto);

		if ("MENTI".equals(dto.getUserType())) {
			return "mentos/mentosDetailMenti";  
		} else {
			return "mentos/mentosDetailMento";  
		}
	}

	
	
	
	@RequestMapping("/insert")
	public String mentosInsert() {
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
