package com.shinhan.memento.apicontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.common.exception.MemberException;
import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.mentoDetail.MentoDetailHomeDTO;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.model.UserType;
import com.shinhan.memento.service.MemberService;
import com.shinhan.memento.service.MentosService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/mentodetail")
public class MentoDetailApiController {
	@Autowired
	MemberService memberService;

	@Autowired
	MentosService mentosService;

	@GetMapping("")
	public BaseResponse<MentoDetailHomeDTO> showMentoDetailHome(@RequestParam int mentoId) {
		log.info("[MentoDetailApiController.showmentoDetailHome]");

		// mentoId 로 들어온 값이 유효한지 확인
		Map<String, Object> memberParams = new HashMap<>();
		memberParams.put("memberId", mentoId);
		memberParams.put("userType", UserType.MENTO);
		Member member = memberService.findMemberByIdAndUserType(memberParams);
		if (member == null) {
			throw new MemberException(BaseExceptionResponseStatus.CANNOT_FOUND_MENTO);
		}
		
		return new BaseResponse<>(memberService.showMentoDetailHome(member));
	}
}