package com.shinhan.memento.apicontroller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.common.exception.MemberException;
import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.mentoDetail.MentoDetailClassDTO;
import com.shinhan.memento.dto.mentoDetail.MentoDetailHomeDTO;
import com.shinhan.memento.dto.mentoDetail.MentoDetailReviewDTO;
import com.shinhan.memento.dto.mentos.MentosSidebarDTO;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.model.UserType;
import com.shinhan.memento.service.MemberService;
import com.shinhan.memento.service.MentosService;
import com.shinhan.memento.service.MentosSidebarService;
import com.shinhan.memento.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/mentodetail")
public class MentoDetailApiController {
	
	@Autowired
	MemberService memberService;

	@Autowired
	MentosService mentosService;

	@Autowired
	ReviewService reviewService;
	
	@Autowired
	MentosSidebarService mentosSidebarService;

	@GetMapping("/home")
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

	// 사이드 바
	@GetMapping("/sidebar")
	public BaseResponse<MentosSidebarDTO> sidebar(@RequestParam("mentoId") int mentoId) {
		MentosSidebarDTO data = mentosSidebarService.getSidebarInfo(mentoId);
		if (data == null) {
			throw new MemberException(BaseExceptionResponseStatus.CANNOT_FOUND_MENTO);
		}
		return new BaseResponse<>(data); // 이게 정석!
	}

	/**
	 * 멘토 상세조회(진행한 멘토스내역 보기)
	 */
	@GetMapping("/classlist")
	public BaseResponse<List<MentoDetailClassDTO>> showMentoDetailClassList(@RequestParam("mentoId") int mentoId,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date lastCreatedAt) {
		log.info("[MentoDetailApiController.showMentoDetailClassList]");
		// mentoId 로 들어온 값이 유효한지 확인
		Map<String, Object> memberParams = new HashMap<>();
		memberParams.put("memberId", mentoId);
		memberParams.put("userType", UserType.MENTO);
		Member member = memberService.findMemberByIdAndUserType(memberParams);
		if (member == null) {
			throw new MemberException(BaseExceptionResponseStatus.CANNOT_FOUND_MENTO);
		}

		return new BaseResponse<>(mentosService.showMentoDetailClassList(mentoId, lastCreatedAt));
	}

	@GetMapping("/review")
	public BaseResponse<List<MentoDetailReviewDTO>> showMentoReviews(@RequestParam("mentoId") int mentoId,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date lastCreatedAt) {
		log.info("[MentoDetailApiController.showMentoReviews]");

		// mentoId 로 들어온 값이 유효한지 확인
		Map<String, Object> memberParams = new HashMap<>();
		memberParams.put("memberId", mentoId);
		memberParams.put("userType", UserType.MENTO);
		Member member = memberService.findMemberByIdAndUserType(memberParams);

		if (member == null) {
			throw new MemberException(BaseExceptionResponseStatus.CANNOT_FOUND_MENTO);
		}

		return new BaseResponse<>(reviewService.showMentoReviews(mentoId, lastCreatedAt));
	}
}