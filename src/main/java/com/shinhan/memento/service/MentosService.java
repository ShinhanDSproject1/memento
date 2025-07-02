package com.shinhan.memento.service;

import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.common.exception.MentosException;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.DetailMentosDTO;
import com.shinhan.memento.dto.ReviewSummaryDTO;
import com.shinhan.memento.dto.SimilarMentosDTO;
import com.shinhan.memento.mapper.MemberMapper;
import com.shinhan.memento.mapper.MentosMapper;
import com.shinhan.memento.mapper.ReviewMapper;
import com.shinhan.memento.model.BaseStatus;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.model.Mentos;
import com.shinhan.memento.model.UserType;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MentosService {

	@Autowired
	MentosMapper mentosMapper;

	@Autowired
	ReviewMapper reviewMapper;

	@Autowired
	MemberMapper memberMapper;

	@Autowired
	CategoryService categoryService;

	@Autowired
	LanguageService languageService;

	@Autowired
	MatchTypeService matchTypeService;

	@Autowired
	MemberService memberService;

	@Autowired
	SqlSession session;


	String namespace = "com.shinhan.memento.mapper.MentosMapper.";

	/*
	 * public boolean createMentos(CreateMentosDTO requestDto) {
	 * log.info("[MentosService.createMentos]");
	 * 
	 * // 사용자로부터 입력받는 값은 String, 데이터베이스에 저장되어야하는 값은 Date 라서 타입변경 Date startDay =
	 * Date.valueOf(requestDto.getStartDay()); Date endDay =
	 * Date.valueOf(requestDto.getEndDay());
	 * 
	 * // 사용자로부터 입력받는 값은 "11:00" 같은 String, 데이터베이스에 저장되어야 하는 값은 Timestamp 라서 타입 변경
	 * Timestamp startTime = Timestamp.valueOf(LocalDateTime.of(LocalDate.of(2000,
	 * 1,1), LocalTime.parse(requestDto.getStartTime()))); Timestamp endTime =
	 * Timestamp.valueOf(LocalDateTime.of(LocalDate.of(2000, 1,1),
	 * LocalTime.parse(requestDto.getEndTime())));
	 * 
	 * 
	 * CreateMentosDBDTO createMentosDBDTO = CreateMentosDBDTO.builder()
	 * .categoryId(requestDto.getCategoryId()) .content(requestDto.getContent())
	 * .endDay(endDay) .startDay(startDay) .endTime(endTime) .startTime(startTime)
	 * .image(requestDto.getImage()) .languageId(requestDto.getLanguageId())
	 * .matchTypeFirst(requestDto.getMatchTypeFirst())
	 * .matchTypeSecond(requestDto.getMatchTypeSecond())
	 * .matchTypeThird(requestDto.getMatchTypeThird())
	 * .maxMember(requestDto.getMaxMember()) .minMember(requestDto.getMinMember())
	 * .price(requestDto.getPrice()) .mentoId(requestDto.getMentoId())
	 * .title(requestDto.getTitle()) .simpleContent(requestDto.getSimpleContent())
	 * .selectedDays(requestDto.getSelectedDays()) .times(requestDto.getTimes())
	 * .regionDetail(requestDto.getRegionDetail())
	 * .regionGroup(requestDto.getRegionGroup())
	 * .regionSubgroup(requestDto.getRegionSubgroup()).build();
	 * 
	 * int result = mentosMapper.createMentos(createMentosDBDTO); return result ==
	 * 1; }
	 */

	public DetailMentosDTO getMentosDetail(int mentosId) {

		Map<String, Object> params = new HashMap<>();
		params.put("mentosId", mentosId);
		params.put("status", BaseStatus.ACTIVE);

		// 1. 멘토스
		Mentos mentos = mentosMapper.findMentosByMentosId(params);

		if (mentos == null) {
			throw new MentosException(BaseExceptionResponseStatus.MENTOS_NOT_FOUND);
		}
		
		Map<String, Object> memberParams = new HashMap<>();
		memberParams.put("memberId", mentos.getMentoId());
		memberParams.put("status", BaseStatus.ACTIVE); // or "ACTIVE" 문자열
		memberParams.put("userType", UserType.MENTO);

		Member mentoMember = memberService.findMemberById(memberParams);

		// 2. 멘토스 아이디를 가지고 리뷰를 돌아서 리뷰 평점
		ReviewSummaryDTO reviewSummary = reviewMapper.calculateAvgReviews(mentosId);

		SimilarMentosDTO similarMentos = new SimilarMentosDTO();
		similarMentos.setMentosId(mentosId);
		similarMentos.setRegionGroup(mentos.getRegionGroup());
		similarMentos.setRegionSubgroup(mentos.getRegionSubgroup());
		similarMentos.setLanguageId(mentos.getLanguageId());

		// 2-1. 비슷한 멘토스 정보들을 찾아서 List<> 로 만들어서 아래 디티오에 넣기

		// List<Mentos> similarMentosList =
		// mentosMapper.findSimilarMentos(similarMentos);

		List<DetailMentosDTO.SimilarMentosListDTO> similarMentosList = session
				.selectList(namespace + "findSimilarMentos", similarMentos);

		// 2-2. Member테이블 가져오기
		Member member = memberMapper.findMemberById(params);

		// 2-3. startDay,endDay,startTime,endTime -> String으로 변환
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formattedStartDay = mentos.getStartDay().toLocalDate().format(dateFormatter);
		String formattedEndDay = mentos.getEndDay().toLocalDate().format(dateFormatter);

		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
		String formattedStartTime = mentos.getStartTime().toLocalTime().format(timeFormatter);
		String formattedEndTime = mentos.getEndTime().toLocalTime().format(timeFormatter);
		
		

		for (DetailMentosDTO.SimilarMentosListDTO dto : similarMentosList) {
		    if (dto.getStartDayRaw() != null)
		        dto.setStartDay(dto.getStartDayRaw().toLocalDateTime().toLocalDate().format(dateFormatter));
		    if (dto.getEndDayRaw() != null)
		        dto.setEndDay(dto.getEndDayRaw().toLocalDateTime().toLocalDate().format(dateFormatter));
		    if (dto.getStartTimeRaw() != null)
		        dto.setStartTime(dto.getStartTimeRaw().toLocalDateTime().toLocalTime().format(timeFormatter));
		    if (dto.getEndTimeRaw() != null)
		        dto.setEndTime(dto.getEndTimeRaw().toLocalDateTime().toLocalTime().format(timeFormatter));
		}


		// 3-1. DTO 만들때 불러오는 값 service, Mapper.wxml, Mapper(interface)만들어서 service에 불러오기
		String categoryName = categoryService.findCategoryNameById(mentos.getCategoryId());
		String languageName = languageService.findLanguageNameById(mentos.getLanguageId());

		String matchTypeFirstName = matchTypeService.findMatchTypeNameById(mentos.getMatchTypeIdFirst());
		String matchTypeSecondName = matchTypeService.findMatchTypeNameById(mentos.getMatchTypeIdSecond());
		String matchTypeThirdName = matchTypeService.findMatchTypeNameById(mentos.getMatchTypeIdThird());

		String mentoName = mentoMember.getNickname();
		String mentoProfile = mentoMember.getProfileImg();
		String userType = String.valueOf(mentoMember.getUserType());

		String matchTypeName = matchTypeService.findMatchTypeNameById(mentoMember.getMatchTypeId());

		// 3-2. 내가 필요한 정보들만 합쳐서 dto 만들어서 반환
		DetailMentosDTO dto = DetailMentosDTO.builder()

				.mentosId(mentos.getMentosId()).title(mentos.getTitle()).simpleContent(mentos.getSimpleContent())
				.image(mentos.getImage()).minMember(mentos.getMinMember()).maxMember(mentos.getMaxMember())
				.startDay(formattedStartDay).endDay(formattedEndDay).startTime(formattedStartTime)
				.endTime(formattedEndTime).selectedDays(mentos.getSelectedDays())

				.price(mentos.getPrice()).times(mentos.getTimes()).categoryName(categoryName).languageName(languageName)

				.regionGroup(mentos.getRegionGroup()).regionSubgroup(mentos.getRegionSubgroup())
				.regionDetail(mentos.getRegionDetail())

				.content(mentos.getContent())

				.matchTypeIdFirst(matchTypeFirstName).matchTypeIdSecond(matchTypeSecondName)
				.matchTypeIdThird(matchTypeThirdName)

				.mentoId(mentoMember.getMemberId()).mentoProfile(mentoMember.getProfileImg())

				.mentoName(mentoName).userType(userType).matchTypeName(matchTypeName)
				.avgScore(reviewSummary.getAvgScore()).similarMentosList(similarMentosList)

				.build();



		return dto;
	}

	
}
