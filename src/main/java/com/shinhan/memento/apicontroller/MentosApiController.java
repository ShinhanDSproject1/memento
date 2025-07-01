package com.shinhan.memento.apicontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.common.exception.MemberException;
import com.shinhan.memento.common.exception.MentosException;
import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.CreateMentosDTO;
import com.shinhan.memento.model.BaseStatus;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.model.UserType;
import com.shinhan.memento.service.MemberService;
import com.shinhan.memento.service.MentosService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/mentos")
public class MentosApiController {
	
	@Autowired
	private MentosService mentosService;
	
	@Autowired
	private MemberService memberService;

	/**
	 * 멘토스 생성 
	 */
	@PostMapping("")
	public BaseResponse<Void> createmento(@RequestBody CreateMentosDTO dto) {
		log.info("[MentosController.createMento]");
		
		// mentoId 로 들어온 식별자값이 db에서 유효한 사용자인지 검증
		Map<String, Object> memberCheckParams = new HashMap<>();
		memberCheckParams.put("memberId", dto.getMentoId());
		memberCheckParams.put("userType", String.valueOf(UserType.MENTO));
		memberCheckParams.put("status", String.valueOf(BaseStatus.ACTIVE));
		Member member = memberService.findMemberById(memberCheckParams);
		
		if(member==null) {
			throw new MemberException(BaseExceptionResponseStatus.CANNOT_FOUND_MENTO);
		}
		
		boolean result = mentosService.createMentos(dto);
		if (!result) {
			throw new MentosException(BaseExceptionResponseStatus.CANNOT_CREATE_MENTOS);
		}
		return new BaseResponse<>(null);
	}

}
