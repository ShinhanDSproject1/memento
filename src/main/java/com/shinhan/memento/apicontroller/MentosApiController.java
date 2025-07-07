package com.shinhan.memento.apicontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.shinhan.memento.common.exception.MemberException;
import com.shinhan.memento.common.exception.MemberMentosException;
import com.shinhan.memento.common.exception.MentosException;
import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchTypeDTO;
import com.shinhan.memento.dto.mentos.CreateMentosDTO;
import com.shinhan.memento.dto.mentos.GetMentosDTO;
import com.shinhan.memento.dto.mentos.GetMentosDetailDTO;
import com.shinhan.memento.dto.mentos.GetMentosListResponseDTO;
import com.shinhan.memento.dto.mentos.JoinMentosDTO;
import com.shinhan.memento.dto.mentos.ShowMentosDetailForEditDTO;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.model.MemberMentos;
import com.shinhan.memento.model.Mentos;
import com.shinhan.memento.model.UserType;
import com.shinhan.memento.service.MemberMentosService;
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

	@Autowired
	private MemberMentosService memberMentosService;

	/**
	 * 멘토스 생성
	 */
	@PostMapping("")
	public BaseResponse<Void> createmento(@RequestPart("data") CreateMentosDTO dto,
			@RequestPart(value = "image", required = false) MultipartFile imageFile) {
		log.info("[MentosController.createMento]");

		Member member = checkValidMemberByIdAndUserType(dto.getMentoId(), UserType.MENTO);
		if (member == null) {
			throw new MemberException(BaseExceptionResponseStatus.CANNOT_FOUND_MENTO);
		}

		boolean result = mentosService.createMentos(dto, imageFile);
		if (!result) {
			throw new MentosException(BaseExceptionResponseStatus.CANNOT_CREATE_MENTOS);
		}
		return new BaseResponse<>(null);
	}

	/**
	 * 멘토스 수정할 때 기존 필드 보여주기 위한 api
	 */
	@GetMapping("/detail/edit")
	public BaseResponse<ShowMentosDetailForEditDTO> showMentosDetailForEdit(@RequestParam int mentosId,
			@RequestParam int memberId) {
		log.info("[MentosApiController.showMentosDetailForEdit]");
		return new BaseResponse<>(mentosService.showMentosDetailForEdit(mentosId, memberId));
	}

	/**
	 * 멘토스 참여하기(신청하기)
	 */
	@PostMapping("/join")
	public BaseResponse<Void> joinMentos(@RequestBody JoinMentosDTO joinMentosDto) {
		log.info("[MentosController.joinMentos]");

		// 해당 memberId, mentosId 로 이미 참여신청이 되어 있는건 없는지 찾아봐야함!!!!!

		Member member = checkValidMemberById(joinMentosDto.getMemberId());
		if (member == null) {
			throw new MemberException(BaseExceptionResponseStatus.CANNOT_FOUND_MEMBER);
		}

		Mentos mentos = checkValidMentosById(joinMentosDto.getMentosId());
		if (mentos == null) {
			throw new MentosException(BaseExceptionResponseStatus.CANNOT_FOUND_MENTOS);
		}

		int result = memberMentosService.joinMentos(joinMentosDto);
		if (result == 0) { // 무조건 1개만 생기게 해야하는데 그 멱등성에 대한 처리는 후에 하기...
			throw new MentosException(BaseExceptionResponseStatus.CANNOT_JOIN_MENTOS);
		}

		return new BaseResponse<>(null);
	}

	// mentosId 로 들어온 식별자값이 db에서 유효한 값인지 검증
	private Mentos checkValidMentosById(int mentosId) {
		log.info("[MentosApiController.checkValidMentosById]");
		return mentosService.checkValidMentosById(mentosId);
	}

	// mentoId 로 들어온 식별자값이 db에서 유효한 사용자인지 검증
	private Member checkValidMemberByIdAndUserType(int memberId, UserType userType) {
		log.info("[MentosApiController.checkValidMemberByIdAndUserType]");

		Map<String, Object> memberCheckParams = new HashMap<>();
		memberCheckParams.put("memberId", memberId);
		memberCheckParams.put("userType", String.valueOf(userType));
		Member member = memberService.findMemberByIdAndUserType(memberCheckParams);

		return member;
	}

	private Member checkValidMemberById(int memberId) {
		log.info("[MentosApiController.checkValidMemberById]");
		return memberService.findMemberById(memberId);
	}

	/**
	 * 멘토스 메인페이지 리스트 조회
	 */
	@GetMapping("")
	public BaseResponse<GetMentosListResponseDTO> showMentosList(
	        @RequestParam(required = false) String regionGroup,
	        @RequestParam(required = false) Integer matchTypeId, 
	        @RequestParam(required = false) Integer categoryId,
	        @RequestParam(required = false) Integer languageId, 
	        @RequestParam(defaultValue = "1") int page) {
	    
	    log.info("[MentosApiController.showMentosList]");
	    return new BaseResponse<>(mentosService.showMentosList(regionGroup, matchTypeId, categoryId, languageId, page));
	}

    /**
     * PREMENTO 유저가 작성한 무료 강의 목록 조회
     */
	@GetMapping("/premento-list")
	public BaseResponse<List<GetMentosDTO>> showPreMentoList(
	        @RequestParam(required = false) String regionGroup,
	        @RequestParam(required = false) Integer matchTypeId, 
	        @RequestParam(required = false) Integer categoryId,
	        @RequestParam(required = false) Integer languageId) {
	    return new BaseResponse<>(mentosService.showPreMentoList(regionGroup, matchTypeId, categoryId, languageId));
	}
	
    /**
     * 필터링을 위한 지역 그룹 목록 조회
     */
    @GetMapping("/filters/regions")
    public BaseResponse<List<Map<String, String>>> getRegionsForFilter() {
        return new BaseResponse<>(mentosService.getRegionGroups());
    }
	
    /**
     * 필터링을 위한 카테고리 목록 조회
     */
    @GetMapping("/filters/categories")
    public BaseResponse<List<CategoryDTO>> getCategoriesForFilter() {
        return new BaseResponse<>(mentosService.getAllCategories());
    }

    /**
     * 필터링을 위한 언어 목록 조회
     */
    @GetMapping("/filters/languages")
    public BaseResponse<List<LanguageDTO>> getLanguagesForFilter() {
        return new BaseResponse<>(mentosService.getAllLanguages());
    }

    /**
     * 필터링을 위한 학습유형 목록 조회
     */
    @GetMapping("/filters/match-types")
    public BaseResponse<List<MatchTypeDTO>> getMatchTypesForFilter() {
        return new BaseResponse<>(mentosService.getAllMatchTypes());
    }
	
	/**
	 * 멘토스 참여 취소하기(신청 취소)
	 */
	@PatchMapping("/join/cancel")
	public BaseResponse<Void> cancelJoinMentos(@RequestBody JoinMentosDTO joinMentosDto) {
		log.info("MentosApiController.cancelJoinMentos");

		MemberMentos memberMentos = memberMentosService.checkValidMemberMentos(joinMentosDto);
		if (memberMentos == null) {
			throw new MemberMentosException(BaseExceptionResponseStatus.CANNOT_FOUND_MEMBER_MENTOS);
		}

		System.out.println(memberMentos.getMemberId());

		int result = memberMentosService.cancelJoinMentos(memberMentos.getMemberMentosId());
		if (result == 0) {
			throw new MemberMentosException(BaseExceptionResponseStatus.CANNOT_CANCEL_MEMBER_MENTOS);
		}

		return new BaseResponse<>(null);
	}

	/**
	 * 멘토스 상세보기
	 */
	@GetMapping("/detail")
	public BaseResponse<GetMentosDetailDTO> showMentosDetail(@RequestParam int mentosId, @RequestParam int memberId) {
		log.info("[MentosApiController.showMentoDetail]");
		Mentos mentos = mentosService.checkValidMentosById(mentosId);
		if (mentos == null) {
			throw new MentosException(BaseExceptionResponseStatus.CANNOT_FOUND_MENTOS);
		}

		Member member = checkValidMemberById(memberId);
		if (member == null) {
			throw new MemberException(BaseExceptionResponseStatus.CANNOT_FOUND_MEMBER);
		}

		return new BaseResponse<>(mentosService.showMentosDetail(mentos, member));
	}

	/**
	 * 멘토스 수정하기
	 */
	@PatchMapping("/edit")
	public BaseResponse<Void> updateMentos(@RequestParam int mentosId, @RequestPart("data") CreateMentosDTO createMentosDto,
			@RequestPart(value = "image", required = false) MultipartFile imageFile) {
		log.info("[MentosApiController.updateMentos]");

		Member member = checkValidMemberByIdAndUserType(createMentosDto.getMentoId(), UserType.MENTO);
		if (member == null) {
			throw new MemberException(BaseExceptionResponseStatus.CANNOT_FOUND_MENTO);
		}

		Mentos mentos = checkValidMentosById(mentosId);
		if (mentos == null) {
			throw new MentosException(BaseExceptionResponseStatus.CANNOT_FOUND_MENTOS);
		}

		boolean result = mentosService.updateMentos(mentosId, createMentosDto, imageFile);

		if (!result) {
			throw new MentosException(BaseExceptionResponseStatus.CANNOT_UPDATE_MENTOS);
		}
		return new BaseResponse<>(null);
	}

}
