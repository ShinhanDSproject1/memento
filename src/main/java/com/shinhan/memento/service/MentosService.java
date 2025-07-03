package com.shinhan.memento.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.shinhan.memento.common.exception.MemberException;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchTypeDTO;
import com.shinhan.memento.dto.mentoDetail.MentoDetailClassDTO;
import com.shinhan.memento.dto.mentos.CreateMentosDBDTO;
import com.shinhan.memento.dto.mentos.CreateMentosDTO;
import com.shinhan.memento.dto.mentos.GetMentosDTO;
import com.shinhan.memento.dto.mentos.JoinMentosDTO;
import com.shinhan.memento.mapper.CartMapper;
import com.shinhan.memento.mapper.CategoryMapper;
import com.shinhan.memento.mapper.LanguageMapper;
import com.shinhan.memento.mapper.MatchTypeMapper;
import com.shinhan.memento.mapper.MemberMapper;
import com.shinhan.memento.mapper.MemberMentosMapper;
import com.shinhan.memento.mapper.MentosMapper;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.model.Mentos;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MentosService {

	@Autowired
	MentosMapper mentosMapper;

	@Autowired
	MemberMentosMapper memberMentosMapper;

	@Autowired
	LanguageMapper languageMapper;

	@Autowired
	CategoryMapper categoryMapper;

	@Autowired
	MatchTypeMapper matchTypeMapper;

	@Autowired
	CartMapper cartMapper;

	@Autowired
	MemberService memberService;

	@Value("${file.upload.dir}")
	private String uploadDir;

	// 멘토스 아이디로 유효한 멘토스인지 확인
	public Mentos checkValidMentosById(int mentosId) {
		log.info("MentosService.checkValidMentosById");
		return mentosMapper.checkValidMentosById(mentosId);
	}

	/**
	 * 멘토스 생성
	 */
	@Transactional
	public boolean createMentos(CreateMentosDTO requestDto, MultipartFile imageFile) {
		log.info("[MentosService.createMentos]");

		// 날짜 및 시간 변환
		Date startDay = Date.valueOf(requestDto.getStartDay());
		Date endDay = Date.valueOf(requestDto.getEndDay());
		Timestamp startTime = Timestamp
				.valueOf(LocalDateTime.of(LocalDate.of(2000, 1, 1), LocalTime.parse(requestDto.getStartTime())));
		Timestamp endTime = Timestamp
				.valueOf(LocalDateTime.of(LocalDate.of(2000, 1, 1), LocalTime.parse(requestDto.getEndTime())));

		// 이미지 저장 처리
		String imageUrl = null;
		if (imageFile != null && !imageFile.isEmpty()) {
			try {
				File dir = new File(uploadDir);
				if (!dir.exists()) {
					dir.mkdirs();
				}

				// 확장자 추출 + 고유 파일명 생성
				String ext = getFileExtension(imageFile.getOriginalFilename());
				String savedFileName = UUID.randomUUID().toString() + (ext != null ? "." + ext : "");
				File destFile = new File(dir, savedFileName);
				Files.copy(imageFile.getInputStream(), destFile.toPath(), StandardCopyOption.REPLACE_EXISTING);

				// 웹에서 접근 가능한 경로로 구성 (리소스 경로 기준)
				imageUrl = "/resources/uploadImage/" + savedFileName;
				log.info("이미지 저장 완료: {}", imageUrl);
			} catch (IOException e) {
				log.error("이미지 업로드 실패", e);
				return false;
			}
		}

		// DB 저장용 DTO 생성
		CreateMentosDBDTO dbDTO = CreateMentosDBDTO.builder().categoryId(requestDto.getCategoryId())
				.content(requestDto.getContent()).endDay(endDay).startDay(startDay).endTime(endTime)
				.startTime(startTime).image(imageUrl) // URL 경로 저장
				.languageId(requestDto.getLanguageId()).matchTypeFirst(requestDto.getMatchTypeFirst())
				.matchTypeSecond(requestDto.getMatchTypeSecond()).matchTypeThird(requestDto.getMatchTypeThird())
				.maxMember(requestDto.getMaxMember()).minMember(requestDto.getMinMember()).price(requestDto.getPrice())
				.mentoId(requestDto.getMentoId()).title(requestDto.getTitle())
				.simpleContent(requestDto.getSimpleContent()).selectedDays(requestDto.getSelectedDays())
				.times(requestDto.getTimes()).regionDetail(requestDto.getRegionDetail())
				.regionGroup(requestDto.getRegionGroup()).regionSubgroup(requestDto.getRegionSubgroup()).build();

		int result = mentosMapper.createMentos(dbDTO);
		return result == 1;
	}

	private String getFileExtension(String fileName) {
		if (fileName != null && fileName.contains(".")) {
			return fileName.substring(fileName.lastIndexOf('.') + 1);
		}
		return null;
	}

	public List<LanguageDTO> getAllLanguages() {
		return mentosMapper.getAllLanguages();
	}

	public List<CategoryDTO> getAllCategories() {
		return mentosMapper.getAllCategories();
	}

	public List<MatchTypeDTO> getAllMatchTypes() {
		return mentosMapper.getAllMatchTypes();
	}

	/**
	 * 멘토스 참여하기(신청하기)
	 */
	@Transactional
	public int joinMentos(JoinMentosDTO joinMentoDto) {
		log.info("[MentosService.joinMentos]");
		return memberMentosMapper.joinMentos(joinMentoDto);
	}

	/**
	 * 멘토스 리스트 불러오기(필터링까지)
	 */
	public List<GetMentosDTO> showMentosList(String regionGroup, Integer matchTypeId, Integer categoryId,
			Integer languageId, int page) {
		log.info("[MentosService.showMentosList]");
		int mentosId;
		long daysBetween;
		int remainMemberCnt;
		String remainMemberStr;
		String mentosImg;
		String title;
		String subTitle;
		String categoryName;
		String languageName;
		String mentoName;
		String mentoType;
		String startDay;
		String endDay;
		String startTime;
		String endTime;
		String location;
		int price;
		boolean isFavorite;

		int offset = (page - 1) * 15;
		List<Mentos> mentosList = mentosMapper.showMentosList(regionGroup, matchTypeId, categoryId, languageId, offset);
		List<GetMentosDTO> result = new ArrayList<>();

		for (Mentos mentos : mentosList) {
			Member member = memberService.findMemberById(mentos.getMentoId());
			mentosId = mentos.getMentosId();

			LocalDate today = LocalDate.now();
			LocalDate startDate = mentos.getStartDay().toLocalDate();
			daysBetween = ChronoUnit.DAYS.between(today, startDate);

			// 현재 참여인원 세어오기 (확정까지 몇명)
			int nowMemberCnt = mentosMapper.countNowMember(mentosId);
			remainMemberCnt = mentos.getMinMember() - nowMemberCnt;
			if (remainMemberCnt <= 0) {
				remainMemberStr = "확정";
			} else {
				remainMemberStr = "확정까지 " + remainMemberCnt + "명";
			}

			mentosImg = mentos.getImage();
			title = mentos.getTitle();
			subTitle = mentos.getSimpleContent();
			categoryName = categoryMapper.findCategoryById(mentos.getCategoryId());
			languageName = languageMapper.findLanguageById(mentos.getLanguageId());
			mentoName = member.getNickname();
			mentoType = matchTypeMapper.findMatchTypeById(member.getMatchTypeId());
			startDay = mentos.getStartDay().toString();
			endDay = mentos.getEndDay().toString();
			startTime = mentos.getStartTime().toString().substring(11);
			endTime = mentos.getEndTime().toString().substring(11);
			location = mentos.getRegionGroup();
			price = mentos.getPrice();

			// 찜 여부 확인하기
			Map<String, Object> favoriteParams = new HashMap<>();
			favoriteParams.put("mentosId", mentos.getMentosId());
			favoriteParams.put("memberId", member.getMemberId());
			isFavorite = cartMapper.checkFavorite(favoriteParams) == null ? false : true;

			GetMentosDTO mentosForMap = GetMentosDTO.builder().mentosId(mentosId).daysBetween(daysBetween)
					.remainMemberCnt(remainMemberStr).mentosImg(mentosImg).title(title).subTitle(subTitle)
					.categoryName(categoryName).languageName(languageName).mentoName(mentoName).mentoType(mentoType)
					.startDay(startDay).endDay(endDay).startTime(startTime).endTime(endTime).location(location)
					.price(price).isFavorite(isFavorite).build();

			result.add(mentosForMap);
		}

		return result;
	}

	/**
	 * 멘토 상세조회(진행한 멘토스내역 보기)
	 */
	public List<MentoDetailClassDTO> showMentoDetailClassList(int mentoId, java.util.Date lastCreatedAt) {
		log.info("[MentosService.showMentoDetailClassList]");
		Map<String, Object> mentosParams = new HashMap<>();
		mentosParams.put("mentoId", mentoId);
		mentosParams.put("lastCreatedAt", lastCreatedAt);
		List<Mentos> mentosList = mentosMapper.showMentosListByMentoId(mentosParams);
		
		List<MentoDetailClassDTO> result = new ArrayList<>();
		
		for(Mentos mentos : mentosList) {
			Member member = memberService.findMemberById(mentos.getMentoId());
			if(member==null) {
				throw new MemberException(BaseExceptionResponseStatus.CANNOT_FOUND_MENTO);
			}
			
			MentoDetailClassDTO dto = MentoDetailClassDTO.builder()
					.mentosImg(mentos.getImage())
					.title(mentos.getTitle())
					.mentoName(member.getNickname())
					.userType(member.getUserType().toString())
					.startDay(mentos.getStartDay().toString())
					.endDay(mentos.getEndDay().toString())
					.startTime(mentos.getStartTime().toString().substring(11))
					.endTime(mentos.getEndTime().toString().substring(11))
					.selectedDays(mentos.getSelectedDays())
					.region(mentos.getRegionGroup()+" "+mentos.getRegionSubgroup())
					.price(mentos.getPrice()).build();
			
			result.add(dto);
		}
		return result;
	}
}
