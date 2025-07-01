package com.shinhan.memento.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.common.exception.MentosException;
import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.CreateMentosDTO;
import com.shinhan.memento.dto.DeleteMentosDTO;
import com.shinhan.memento.dto.DetailMentosDTO;
import com.shinhan.memento.dto.EditMentosDTO;
import com.shinhan.memento.service.MentosService;

import lombok.extern.slf4j.Slf4j;

@RestController
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

	/*
	  @RequestMapping("/detailmenti") public String mentosDetailMentiView() {
	  return "mentos/mentosDetailMenti"; }
	 */
	
	@RequestMapping("/detailmento")
	public String mentosDetailMrntoView() {
		return "mentos/mentosDetailMento";
	}

	@RequestMapping("/detail")
	public String mentosDetailView() {
		return "mentos/mentosDetail";
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


	@GetMapping("/detailmenti")
	public String mentiDetailPage() {
	    return "mentos/mentosDetailMenti";
	}
	
	@GetMapping("/detailmentos")
	@ResponseBody
	public BaseResponse<DetailMentosDTO> getMentosDetail(@RequestParam int mentosId) {
		log.info("MentosController.getMentosDetail 호출됨, id: " + mentosId);

		DetailMentosDTO dto = mentosService.getMentosDetail(mentosId);
		if (dto == null) {
			throw new MentosException(BaseExceptionResponseStatus.MENTOS_NOT_FOUND);
		}

		return new BaseResponse<>(dto);
	}

	
	
	@PostMapping("/creatementos")
	public BaseResponse<Void> createMento(@RequestBody CreateMentosDTO dto) {
		log.info("[MentosController.createMento]");
		boolean result = mentosService.registerMento(dto);
		if (!result) {
			throw new MentosException(BaseExceptionResponseStatus.CANNOT_FOUND_MEMBER);
		}
		return new BaseResponse<>(null);
	}

	@PatchMapping("/editmentos")
	public BaseResponse<Void> updateMentos(@RequestBody EditMentosDTO dto) {
		log.info("MentosController.updateMentos");

		boolean result = mentosService.updateMentos(dto);
		if (!result) {
			throw new MentosException(BaseExceptionResponseStatus.CANNOT_EDIT_MENTOS);
		}
		return new BaseResponse<>(null);
	}

	@PatchMapping("/deletementos")
	public BaseResponse<Void> deleteMento(@RequestBody DeleteMentosDTO dto) {
		log.info("MentosController.deleteMento");

		boolean result = mentosService.deleteMentos(dto.getMentosId());
		if (!result) {
			throw new MentosException(BaseExceptionResponseStatus.CANNOT_DElETE_MENTOS);
		}

		return new BaseResponse<>(null);
	}

}
