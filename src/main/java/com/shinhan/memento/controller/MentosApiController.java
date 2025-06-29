package com.shinhan.memento.controller;

import org.springframework.beans.factory.annotation.Autowired;
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

@Slf4j
@RestController
@RequestMapping("/mentos")
public class MentosApiController {
	
	@Autowired
	private MentosService mentosService;

	/**
	 * 멘토스 생성 
	 */
	@PostMapping("")
	public BaseResponse<Void> createMento(@RequestBody CreateMentosDTO dto) {
		log.info("MentosController.createMento");
		boolean result = mentosService.registerMento(dto);
		if (!result) {
			throw new MentosException(BaseExceptionResponseStatus.CANNOT_CREATE_MENTOS);
		}
		return new BaseResponse<>(null);
	}

}
