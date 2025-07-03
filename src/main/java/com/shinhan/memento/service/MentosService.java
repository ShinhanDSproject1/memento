package com.shinhan.memento.service;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.common.exception.MentosException;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.DetailMentosDTO;
import com.shinhan.memento.dto.ReviewSummaryDTO;
import com.shinhan.memento.mapper.MemberMapper;
import com.shinhan.memento.mapper.MentoMemberMapper;
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
	MentoMemberMapper mentoMemberMapper;

	@Autowired
	CategoryService categoryService;

	@Autowired
	LanguageService languageService;

	@Autowired
	MatchTypeService matchTypeService;

	@Autowired
	MemberService memberService;

//	@Transactional
//	public boolean createMentos(CreateMentosDTO requestDto, MultipartFile imageFile) {
//		log.info("[MentosService.createMentos]");
//		// 날짜 및 시간 변환
//		Date startDay = Date.valueOf(requestDto.getStartDay());
//		Date endDay = Date.valueOf(requestDto.getEndDay());
//		Timestamp startTime = Timestamp
//				.valueOf(LocalDateTime.of(LocalDate.of(2000, 1, 1), LocalTime.parse(requestDto.getStartTime())));
//		Timestamp endTime = Timestamp
//				.valueOf(LocalDateTime.of(LocalDate.of(2000, 1, 1), LocalTime.parse(requestDto.getEndTime())));
//		// 이미지 저장 처리
//		String imageUrl = null;
//		if (imageFile != null && !imageFile.isEmpty()) {
//			try {
//				File dir = new File(uploadDir);
//				if (!dir.exists()) {
//					dir.mkdirs();
//				}
//				// 확장자 추출 + 고유 파일명 생성
//				String ext = getFileExtension(imageFile.getOriginalFilename());
//				String savedFileName = UUID.randomUUID().toString() + (ext != null ? "." + ext : "");
//				File destFile = new File(dir, savedFileName);
//				Files.copy(imageFile.getInputStream(), destFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
//				// 웹에서 접근 가능한 경로로 구성 (리소스 경로 기준)
//				imageUrl = "/resources/uploadImage/" + savedFileName;
//				log.info("이미지 저장 완료: {}", imageUrl);
//			} catch (IOException e) {
//				log.error("이미지 업로드 실패", e);
//				return false;
//			}
//		}
//		// DB 저장용 DTO 생성
//		CreateMentosDBDTO dbDTO = CreateMentosDBDTO.builder().categoryId(requestDto.getCategoryId())
//				.content(requestDto.getContent()).endDay(endDay).startDay(startDay).endTime(endTime)
//				.startTime(startTime).image(imageUrl) // URL 경로 저장
//				.languageId(requestDto.getLanguageId()).matchTypeFirst(requestDto.getMatchTypeFirst())
//				.matchTypeSecond(requestDto.getMatchTypeSecond()).matchTypeThird(requestDto.getMatchTypeThird())
//				.maxMember(requestDto.getMaxMember()).minMember(requestDto.getMinMember()).price(requestDto.getPrice())
//				.mentoId(requestDto.getMentoId()).title(requestDto.getTitle())
//				.simpleContent(requestDto.getSimpleContent()).selectedDays(requestDto.getSelectedDays())
//				.times(requestDto.getTimes()).regionDetail(requestDto.getRegionDetail())
//				.regionGroup(requestDto.getRegionGroup()).regionSubgroup(requestDto.getRegionSubgroup()).build();
//		int result = mentosMapper.createMentos(dbDTO);
//		return result == 1;
//	}
//
//	private String getFileExtension(String fileName) {
//		if (fileName != null && fileName.contains(".")) {
//			return fileName.substring(fileName.lastIndexOf('.') + 1);
//		}
//		return null;
//	}
//
//	public List<LanguageDTO> getAllLanguages() {
//		return mentosMapper.getAllLanguages();
//	}
//
//	public List<CategoryDTO> getAllCategories() {
//		return mentosMapper.getAllCategories();
//	}
//
//	public List<MatchTypeDTO> getAllMatchTypes() {
//		return mentosMapper.getAllMatchTypes();
//	}

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
		memberParams.put("status", BaseStatus.ACTIVE);
		memberParams.put("userType", UserType.MENTO);

		// 1-2. Member테이블 가져오기
		Member mentoMember = memberService.findMemberById(memberParams);

		// 2. 멘토스 아이디를 가지고 리뷰를 돌아서 리뷰 평점
		ReviewSummaryDTO reviewSummary = reviewMapper.calculateAvgReviews(mentosId);

		// 2-1. 비슷한 멘토스 정보들을 찾아서 List<> 로 만들어서 아래 디티오에 넣기
		int langId = mentos.getLanguageId();
		String regionGroup = mentos.getRegionGroup();
		String regionSubGroup = mentos.getRegionSubgroup();

		Map<String, Object> mentosParams = new HashMap<>();
		mentosParams.put("languageId", langId);
		mentosParams.put("regionGroup", regionGroup);
		mentosParams.put("regionSubgroup", regionSubGroup);
		List<Mentos> similarMentosList = mentosMapper.findSimilarMentos(mentosParams);

		System.out.println("뽀ㅃ아온 데이터 갯수!!!!!!!!====> " + similarMentosList.size());

		// 2-2. startDay,endDay,startTime,endTime -> String으로 변환
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formattedStartDay = mentos.getStartDay().toLocalDate().format(dateFormatter);
		String formattedEndDay = mentos.getEndDay().toLocalDate().format(dateFormatter);

		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
		String formattedStartTime = mentos.getStartTime().toLocalTime().format(timeFormatter);
		String formattedEndTime = mentos.getEndTime().toLocalTime().format(timeFormatter);

		// 3. DTO 만들때 불러오는 값 service, Mapper.wxml, Mapper(interface)만들어서 service에 불러오기
		String categoryName = categoryService.findCategoryNameById(mentos.getCategoryId());
		String languageName = languageService.findLanguageNameById(mentos.getLanguageId());

		String matchTypeNameFirst = matchTypeService.findMatchTypeNameById(mentos.getMatchTypeIdFirst());
		String matchTypeNameSecond = matchTypeService.findMatchTypeNameById(mentos.getMatchTypeIdSecond());
		String matchTypeNameThird = matchTypeService.findMatchTypeNameById(mentos.getMatchTypeIdThird());

		String mentoName = mentoMember.getNickname();
		String mentoProfile = mentoMember.getProfileImg();
		String userType = mentoMember.getUserType().name();

		String matchTypeName = matchTypeService.findMatchTypeNameById(mentoMember.getMatchTypeId());

		List<DetailMentosDTO.SimilarMentosListDTO> result = new ArrayList<>();
		for (Mentos similar : similarMentosList) {

			String similarStartDay = similar.getStartDay().toString();
			String similarEndDay = similar.getEndDay().toString();
			String similarStartTime = similar.getStartTime().toString().substring(11);
			String similarEndTime = similar.getEndTime().toString().substring(11);

			String similarcategoryName = categoryService.findCategoryNameById(similar.getCategoryId());
			String similarlanguageName = languageService.findLanguageNameById(similar.getLanguageId());
			String similarmentoName = memberService.findMemberById(
					Map.of("memberId", similar.getMentoId(), 
							"status", BaseStatus.ACTIVE, "userType", UserType.MENTO))
					.getNickname();

			int remainSeat = similar.getMaxMember()
					- mentoMemberMapper.countActiveMembersByMentosId(similar.getMentosId());

			DetailMentosDTO.SimilarMentosListDTO dto = DetailMentosDTO.SimilarMentosListDTO.builder()
					.mentosId(similar.getMentosId()).title(similar.getTitle()).mentoName(mentoName)
					.startDay(formattedStartDay).endDay(formattedEndDay).startTime(formattedStartTime)
					.endTime(formattedEndTime).selectedDay(similar.getSelectedDays())
					.regionSubGroup(similar.getRegionSubgroup()).price(similar.getPrice()).image(similar.getImage())
					.remainSeat(remainSeat).categoryName(categoryName).languageName(languageName)
					.build();

			result.add(dto);
		}
	

	// 3-1. 내가 필요한 정보들만 합쳐서 dto 만들어서 반환
	DetailMentosDTO dto = DetailMentosDTO.builder()

				.mentosId(mentos.getMentosId()).title(mentos.getTitle()).simpleContent(mentos.getSimpleContent())
				.image(mentos.getImage()).minMember(mentos.getMinMember()).maxMember(mentos.getMaxMember())
				.startDay(formattedStartDay).endDay(formattedEndDay).startTime(formattedStartTime)
				.endTime(formattedEndTime).selectedDays(mentos.getSelectedDays())

				.price(mentos.getPrice()).times(mentos.getTimes()).categoryName(categoryName).languageName(languageName)

				.regionGroup(mentos.getRegionGroup()).regionSubgroup(mentos.getRegionSubgroup())
				.regionDetail(mentos.getRegionDetail())

				.content(mentos.getContent())

				.matchTypeNameFirst(matchTypeNameFirst).matchTypeNameSecond(matchTypeNameSecond)
				.matchTypeNameThird(matchTypeNameThird)

				.mentoProfile(mentoMember.getProfileImg()).mentoName(mentoName).userType(userType)
				.matchTypeName(matchTypeName).avgScore(reviewSummary.getAvgScore()).similarMentosList(result)

				.build();

	return dto;
}

}
