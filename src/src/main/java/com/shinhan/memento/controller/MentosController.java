package com.shinhan.memento.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.common.exception.MentosException;
import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.CreateMentosDTO;
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

	@PostMapping("/creatementos")
	public BaseResponse<Void> createMento(@RequestBody CreateMentosDTO dto) {
		log.info("[MentosController.createMento]");
		boolean result = mentosService.registerMento(dto);
		if (!result) {
			throw new MentosException(BaseExceptionResponseStatus.CANNOT_FOUND_MEMBER);
		}
		return new BaseResponse<>(null);
	}

}
