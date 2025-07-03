package com.shinhan.memento.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.common.exception.MentosException;
import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.DeleteMentosDTO;
import com.shinhan.memento.dto.DetailMentosDTO;
import com.shinhan.memento.dto.EditMentosDTO;
import com.shinhan.memento.service.MemberService;
import com.shinhan.memento.service.MentosService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/mentos")
public class MentosApiController {

	@Autowired
	MentosService mentosService;

	@Autowired
	MemberService memberService;

	/**
	 * 멘토스 생성
	 */
//
//	@PostMapping("")
//	public BaseResponse<Void> createmento(@RequestBody CreateMentosDTO dto) {
//		log.info("[MentosController.createMento]");
//
//		// mentoId 로 들어온 식별자값이 db에서 유효한 사용자인지 검증
//		Map<String, Object> memberCheckParams = new HashMap<>();
//		memberCheckParams.put("memberId", dto.getMentoId());
//		memberCheckParams.put("userType", String.valueOf(UserType.MENTO));
//		memberCheckParams.put("status", String.valueOf(BaseStatus.ACTIVE));
//		Member member = memberService.findMemberById(memberCheckParams);
//
//		if (member == null) {
//			throw new MemberException(BaseExceptionResponseStatus.CANNOT_FOUND_MENTO);
//		}
//
//		boolean result = mentosService.createMentos(dto);
//		if (!result) {
//			throw new MentosException(BaseExceptionResponseStatus.CANNOT_CREATE_MENTOS);
//		}
//		return new BaseResponse<>(null);
//	}



	@GetMapping("/api/detail")
	public BaseResponse<DetailMentosDTO> getMentosDetailAjax(@RequestParam int mentosId) {
		log.info("[MentosController.getMentosDetailAjax] mentosId: {}", mentosId);

		DetailMentosDTO dto = mentosService.getMentosDetail(mentosId);
		return new BaseResponse<>(dto);
	}

	
	/*
	 * @PatchMapping("/editmentos") public BaseResponse<Void>
	 * updateMentos(@RequestBody EditMentosDTO dto) {
	 * log.info("MentosController.updateMentos");
	 * 
	 * boolean result = mentosService.updateMentos(dto); if (!result) { throw new
	 * MentosException(BaseExceptionResponseStatus.CANNOT_EDIT_MENTOS); } return new
	 * BaseResponse<>(null); }
	 * 
	 * @PatchMapping("/deletementos") public BaseResponse<Void>
	 * deleteMento(@RequestBody DeleteMentosDTO dto) {
	 * log.info("MentosController.deleteMento");
	 * 
	 * boolean result = mentosService.deleteMentos(dto.getMentosId()); if (!result)
	 * { throw new
	 * MentosException(BaseExceptionResponseStatus.CANNOT_DElETE_MENTOS); }
	 * 
	 * return new BaseResponse<>(null); }
	 */
	 

}
