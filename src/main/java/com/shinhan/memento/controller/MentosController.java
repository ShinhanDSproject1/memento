package com.shinhan.memento.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.common.exception.MentosException;
import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.EditMentosDTO;
import com.shinhan.memento.service.MentosService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/mentos")
@Slf4j
public class MentosController {
	@Autowired
	private MentosService mentosService;

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
	
	@PatchMapping("/edit")
	public BaseResponse<Void> updateMentos(@RequestBody EditMentosDTO dto) {
		log.info("MentosController.updateMentos");

		boolean result = mentosService.updateMentos(dto);
		if (!result) {
			throw new MentosException(BaseExceptionResponseStatus.CANNOT_EDIT_MENTOS);
		}

		return new BaseResponse<>(null);
	}

}
