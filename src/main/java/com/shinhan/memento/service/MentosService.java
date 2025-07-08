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

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.shinhan.memento.common.exception.MemberException;
import com.shinhan.memento.common.exception.MentosException;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchTypeDTO;
import com.shinhan.memento.dto.mentoDetail.MentoDetailClassDTO;
import com.shinhan.memento.dto.mentos.CreateMentosDBDTO;
import com.shinhan.memento.dto.mentos.CreateMentosDTO;
import com.shinhan.memento.dto.mentos.GetMentosDTO;
import com.shinhan.memento.dto.mentos.GetMentosDetailDTO;
import com.shinhan.memento.dto.mentos.GetMentosDetailDTO.GetSimilarMentosListDTO;
import com.shinhan.memento.dto.mentos.GetMentosListResponseDTO;
import com.shinhan.memento.dto.mentos.JoinMentosDTO;
import com.shinhan.memento.dto.mentos.ShowMentosDetailForEditDTO;
import com.shinhan.memento.mapper.CartMapper;
import com.shinhan.memento.mapper.CategoryMapper;
import com.shinhan.memento.mapper.LanguageMapper;
import com.shinhan.memento.mapper.MatchTypeMapper;
import com.shinhan.memento.mapper.MemberMentosMapper;
import com.shinhan.memento.mapper.MentosMapper;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.model.Mentos;
import com.shinhan.memento.util.S3Uploader;

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
	@Autowired
	ServletContext servletContext;
	@Autowired
	S3Uploader s3Uploader;

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
	public int createMentos(CreateMentosDTO requestDto, MultipartFile imageFile) {
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
				imageUrl = s3Uploader.upload(imageFile);
				log.info("S3 업로드 완료: {}", imageUrl);
			} catch (IOException e) {
				log.error("S3 이미지 업로드 실패", e);
				return false;
			}
		}

		// DB 저장용 DTO 생성
		CreateMentosDBDTO dbDTO = CreateMentosDBDTO.builder().categoryId(requestDto.getCategoryId())
				.content(requestDto.getContent()).endDay(endDay).startDay(startDay).endTime(endTime)
				.startTime(startTime).image(imageUrl).languageId(requestDto.getLanguageId())
				.matchTypeFirst(requestDto.getMatchTypeFirst()).matchTypeSecond(requestDto.getMatchTypeSecond())
				.matchTypeThird(requestDto.getMatchTypeThird()).maxMember(requestDto.getMaxMember())
				.minMember(requestDto.getMinMember()).price(requestDto.getPrice()).mentoId(requestDto.getMentoId())
				.title(requestDto.getTitle()).simpleContent(requestDto.getSimpleContent())
				.selectedDays(requestDto.getSelectedDays()).times(requestDto.getTimes())
				.regionDetail(requestDto.getRegionDetail()).regionGroup(requestDto.getRegionGroup())
				.regionSubgroup(requestDto.getRegionSubgroup()).build();

		int result = mentosMapper.createMentos(dbDTO);
		return result;
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

	public List<Map<String, String>> getRegionGroups() {
		return mentosMapper.getRegionGroups();
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
	public GetMentosListResponseDTO showMentosList(String regionGroup, Integer matchTypeId, Integer categoryId,
			Integer languageId, int page) {
		log.info("[MentosService.showMentosList] page: {}", page);

		// --- 1. 페이지 정보 계산 ---
		int pageSize = 6; // 한 페이지에 보여줄 개수
		int pageBlockSize = 5; // 페이지네이션에 보여줄 페이지 번호 개수

		// 필터 조건에 맞는 전체 게시글 수 조회
		int totalCount = mentosMapper.getMentosListTotalCount(regionGroup, matchTypeId, categoryId, languageId);
		int totalPageCount = (int) Math.ceil((double) totalCount / pageSize);

		// 페이지네이션 블록의 시작과 끝 페이지 번호 계산
		int startPage = ((page - 1) / pageBlockSize) * pageBlockSize + 1;
		int endPage = Math.min(startPage + pageBlockSize - 1, totalPageCount);

		// 이전/다음 버튼 표시 여부
		boolean hasPrev = startPage > 1;
		boolean hasNext = endPage < totalPageCount;

		// 최종 페이지 정보 객체 생성
		GetMentosListResponseDTO.PaginationInfo paginationInfo = GetMentosListResponseDTO.PaginationInfo.builder()
				.currentPage(page).totalPageCount(totalPageCount).startPage(startPage).endPage(endPage).hasPrev(hasPrev)
				.hasNext(hasNext).build();

		// --- 2. 해당 페이지 목록 조회 ---
		int offset = (page - 1) * pageSize;
		List<Mentos> mentosListFromDb = mentosMapper.showMentosList(regionGroup, matchTypeId, categoryId, languageId,
				offset);
		List<GetMentosDTO> mentosDtoList = new ArrayList<>();

		// --- 3. DTO 변환 (이전 로직과 동일) ---
		for (Mentos mentos : mentosListFromDb) {
			Member member = memberService.findMemberById(mentos.getMentoId());

			// D-day 계산
			LocalDate today = LocalDate.now();
			LocalDate startDate = mentos.getStartDay().toLocalDate();
			long daysBetween = ChronoUnit.DAYS.between(today, startDate);

			// 남은 모집 인원 계산
			int nowMemberCnt = mentosMapper.countNowMember(mentos.getMentosId());
			int remainMemberCnt = mentos.getMinMember() - nowMemberCnt;
			String remainMemberStr;
			if (remainMemberCnt <= 0) {
				remainMemberStr = "확정";
			} else {
				remainMemberStr = "확정까지 " + remainMemberCnt + "명";
			}

			// 찜 여부 확인 (세션에 로그인 유저가 있을 경우)
			// 이 부분은 로그인 정보가 필요하므로, 일단 false로 처리하거나 실제 로그인 memberId를 가져와야 합니다.
			// 여기서는 예시로 memberId 1을 기준으로 처리합니다. 실제 구현 시 세션에서 가져온 memberId를 사용해야 합니다.
			boolean isFavorite = false;
			Map<String, Object> favoriteParams = new HashMap<>();
			favoriteParams.put("mentosId", mentos.getMentosId());
			favoriteParams.put("memberId", 1); // TODO: 세션에서 실제 로그인된 사용자 ID 가져오기
			Integer favoriteResult = cartMapper.checkFavorite(favoriteParams);
			if (favoriteResult != null && favoriteResult > 0) {
				isFavorite = true;
			}

			GetMentosDTO mentosForMap = GetMentosDTO.builder().mentosId(mentos.getMentosId()).daysBetween(daysBetween)
					.remainMemberCnt(remainMemberStr) // 최종 수정된 필드명
					.mentosImg(mentos.getImage()).title(mentos.getTitle()).subTitle(mentos.getSimpleContent())
					.categoryName(categoryMapper.findCategoryById(mentos.getCategoryId()))
					.languageName(languageMapper.findLanguageById(mentos.getLanguageId()))
					.mentoName(member.getNickname())
					.mentoType(matchTypeMapper.findMatchTypeById(member.getMatchTypeId()))
					.startDay(mentos.getStartDay().toString()).endDay(mentos.getEndDay().toString())
					.startTime(mentos.getStartTime().toString().substring(11, 16))
					.endTime(mentos.getEndTime().toString().substring(11, 16)).location(mentos.getRegionGroup())
					.price(mentos.getPrice()).isFavorite(isFavorite).build();

			mentosDtoList.add(mentosForMap);
		}

		// --- 4. 최종 결과 반환 ---
		return GetMentosListResponseDTO.builder().mentosList(mentosDtoList).paginationInfo(paginationInfo).build();
	}

	// MentosService.java 파일 하단에 추가

	/**
	 * PREMENTO가 작성한 무료 강의 목록 불러오기
	 */
	public List<GetMentosDTO> showPreMentoList(String regionGroup, Integer matchTypeId, Integer categoryId,
			Integer languageId) {
		log.info("[MentosService.showPreMentoList]");

		List<Mentos> preMentoMentosList = mentosMapper.showPreMentoList(regionGroup, matchTypeId, categoryId,
				languageId);

		List<GetMentosDTO> result = new ArrayList<>();

		for (Mentos mentos : preMentoMentosList) {
			Member member = memberService.findMemberById(mentos.getMentoId());

			LocalDate today = LocalDate.now();
			LocalDate startDate = mentos.getStartDay().toLocalDate();
			long daysBetween = ChronoUnit.DAYS.between(today, startDate);

			int nowMemberCnt = mentosMapper.countNowMember(mentos.getMentosId());
			int remainMemberCnt = mentos.getMinMember() - nowMemberCnt;
			String remainMemberStr;
			if (remainMemberCnt <= 0) {
				remainMemberStr = "확정";
			} else {
				remainMemberStr = "확정까지 " + remainMemberCnt + "명";
			}

			GetMentosDTO mentosForMap = GetMentosDTO.builder().mentosId(mentos.getMentosId()).daysBetween(daysBetween)
					.remainMemberCnt(remainMemberStr).mentosImg(mentos.getImage()).title(mentos.getTitle())
					.subTitle(mentos.getSimpleContent())
					.categoryName(categoryMapper.findCategoryById(mentos.getCategoryId()))
					.languageName(languageMapper.findLanguageById(mentos.getLanguageId()))
					.mentoName(member.getNickname())
					.mentoType(matchTypeMapper.findMatchTypeById(member.getMatchTypeId()))
					.startDay(mentos.getStartDay().toString()).endDay(mentos.getEndDay().toString())
					.startTime(mentos.getStartTime().toString().substring(11, 16))
					.endTime(mentos.getEndTime().toString().substring(11, 16)).location(mentos.getRegionGroup())
					.price(mentos.getPrice()).isFavorite(false) // 찜 기능은 로그인 사용자 기준이므로, 여기서는 기본값 처리
					.build();

			result.add(mentosForMap);
		}
		return result;
	}

	/**
	 * 멘토 상세보기 페이지(홈화면)
	 */
	public List<Mentos> showInProgressMentosList(int memberId) {
		log.info("[MentoService.showInProgressMentosList]");

		return mentosMapper.showInProgressMentosList(memberId);
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

		for (Mentos mentos : mentosList) {
			Member member = memberService.findMemberById(mentos.getMentoId());
			if (member == null) {
				throw new MemberException(BaseExceptionResponseStatus.CANNOT_FOUND_MENTO);
			}

			MentoDetailClassDTO dto = MentoDetailClassDTO.builder().mentosImg(mentos.getImage())
					.title(mentos.getTitle()).mentoName(member.getNickname()).userType(member.getUserType().toString())
					.startDay(mentos.getStartDay().toString()).endDay(mentos.getEndDay().toString())
					.startTime(mentos.getStartTime().toString().substring(11))
					.endTime(mentos.getEndTime().toString().substring(11)).selectedDays(mentos.getSelectedDays())
					.region(mentos.getRegionGroup() + " " + mentos.getRegionSubgroup()).price(mentos.getPrice())
					.createdAt(mentos.getCreatedAt().toString()).build();

			result.add(dto);
		}
		return result;
	}

	/**
	 * 멘토스 상세보기
	 */
	public GetMentosDetailDTO showMentosDetail(Mentos mentos, Member member) {
		log.info("[MentosService.showmentosDetail]");

		// 멘토 정보 받아오기
		Member mento = memberService.findMemberById(mentos.getMentoId());
		if (mento == null) {
			throw new MentosException(BaseExceptionResponseStatus.CANNOT_FOUND_MENTOS);
		}

		String matchTypeNameFirst = matchTypeMapper.findMatchTypeById(mentos.getMatchTypeIdFirst());
		String matchTypeNameSecond = matchTypeMapper.findMatchTypeById(mentos.getMatchTypeIdSecond());
		String matchTypeNameThird = matchTypeMapper.findMatchTypeById(mentos.getMatchTypeIdThird());
		String matchTypeName = matchTypeMapper.findMatchTypeById(mento.getMatchTypeId());

		String categoryName = categoryMapper.findCategoryById(mentos.getCategoryId());
		String languageName = languageMapper.findLanguageById(mentos.getCategoryId());

		Map<String, Object> cartParams = new HashMap<>();
		cartParams.put("mentosId", mentos.getMentosId());
		cartParams.put("memberId", member.getMemberId());

		boolean isFavorite = cartMapper.checkFavorite(cartParams) == 1 ? true : false;

		// 비슷한 멘토스 찾기 => 언어랑 카테고리, 리전그룹이 같은 애들로 찾기
		Map<String, Object> similarParams = new HashMap<>();
		similarParams.put("languageId", mentos.getLanguageId());
		similarParams.put("categoryId", mentos.getCategoryId());
		similarParams.put("regionGroup", mentos.getRegionGroup());
		similarParams.put("mentosId", mentos.getMentosId());
		List<Mentos> similarList = mentosMapper.findSimilarMentosList(similarParams);

		List<GetSimilarMentosListDTO> similarMentosList = new ArrayList<>();

		for (Mentos similar : similarList) {
			Member similarMento = memberService.findMemberById(similar.getMentoId());
			String similarCategoryName = categoryMapper.findCategoryById(similar.getCategoryId());
			String similarLanguageName = languageMapper.findLanguageById(similar.getCategoryId());

			// 현재 참여인원 세어오기 (확정까지 몇명)
			int nowMemberCnt = mentosMapper.countNowMember(similar.getMentosId());
			int remainSeatCnt = mentos.getMinMember() - nowMemberCnt;
			String remainSeat;
			if (remainSeatCnt <= 0) {
				remainSeat = "확정";
			} else {
				remainSeat = "확정까지 " + remainSeatCnt + "명";
			}
			GetSimilarMentosListDTO result = GetSimilarMentosListDTO.builder().mentosId(similar.getMentosId())
					.title(similar.getTitle()).mentoName(similarMento.getNickname())
					.userType(similarMento.getUserType().toString()).startDay(similar.getStartDay().toString())
					.endDay(similar.getEndDay().toString()).startTime(similar.getStartTime().toString().substring(11))
					.endTime(similar.getEndTime().toString().substring(11)).selectedDay(similar.getSelectedDays())
					.price(similar.getPrice()).image(similar.getImage()).simpleContent(similar.getSimpleContent())
					.categoryName(similarCategoryName).languageName(similarLanguageName).remainSeat(remainSeat)
					.regionSubGroup(similar.getRegionSubgroup()).build();

			similarMentosList.add(result);
		}

		GetMentosDetailDTO dto = GetMentosDetailDTO.builder().mentosId(mentos.getMentosId()).title(mentos.getTitle())
				.simpleContent(mentos.getSimpleContent()).image(mentos.getImage()).currentMemberCnt(0)
				.maxMember(mentos.getMaxMember()).startDay(mentos.getStartDay().toString())
				.endDay(mentos.getEndDay().toString()).startTime(mentos.getStartTime().toString().substring(11))
				.endTime(mentos.getEndTime().toString().substring(11)).selectedDays(mentos.getSelectedDays())
				.price(mentos.getPrice()).times(mentos.getTimes() + "회").categoryName(categoryName)
				.languageName(languageName)
				.place(mentos.getRegionGroup() + " " + mentos.getRegionSubgroup() + " " + mentos.getRegionDetail())
				.content(mentos.getContent()).matchTypeNameFirst(matchTypeNameFirst)
				.matchTypeNameSecond(matchTypeNameSecond).matchTypeNameThird(matchTypeNameThird)
				.mentoProfile(mento.getProfileImg()).mentoName(mento.getNickname())
				.userType(mento.getUserType().toString()).matchTypeName(matchTypeName)
				.similarMentosList(similarMentosList).isFavorite(isFavorite).build();

		return dto;
	}

	@Transactional
	public void deleteMentos(int mentosId) {
		log.info("[MentosService.deleteMentos]");
		mentosMapper.deleteMentos(mentosId);
		memberMentosMapper.deleteMemberMentos(mentosId);
	}

	/**
	 * 프론트 페이지 리다이렉트를 위해서 해당 멘토스에 대한 접속 유저의 권한 확인
	 */
	public boolean checkPermission(Member member, int mentosId) {
		log.info("[MentosService.checkPermission]");
		// usertype 확인할 필요없음! 어차피 컨트롤러에서 확인해서 멘토인애들만 보냄
		Map<String, Object> checkParams = new HashMap<>();
		checkParams.put("memberId", member.getMemberId());
		checkParams.put("mentosId", mentosId);

		return mentosMapper.checkPermission(checkParams) == 1 ? true : false;
	}

	public ShowMentosDetailForEditDTO showMentosDetailForEdit(int mentosId, int memberId) {
		log.info("[MentosService.showMentosDetailForEdit]");
		Mentos mentos = mentosMapper.checkValidMentosById(mentosId);

		ShowMentosDetailForEditDTO dto = ShowMentosDetailForEditDTO.builder().title(mentos.getTitle())
				.simpleContent(mentos.getSimpleContent()).image(mentos.getImage()).minMember(mentos.getMinMember())
				.maxMember(mentos.getMaxMember()).startDay(mentos.getStartDay()).endDay(mentos.getEndDay())
				.startTime(mentos.getStartTime()).endTime(mentos.getEndTime()).selectedDays(mentos.getSelectedDays())
				.price(mentos.getPrice()).times(mentos.getTimes()).categoryId(mentos.getCategoryId())
				.languageId(mentos.getLanguageId()).regionGroup(mentos.getRegionGroup())
				.regionSubgroup(mentos.getRegionSubgroup()).regionDetail(mentos.getRegionDetail())
				.content(mentos.getContent()).matchTypeFirst(mentos.getMatchTypeIdFirst())
				.matchTypeSecond(mentos.getMatchTypeIdSecond()).matchTypeThird(mentos.getMatchTypeIdThird()).build();

		return dto;
	}

	public boolean updateMentos(int mentosId, CreateMentosDTO createMentosDto, MultipartFile imageFile) {
		log.info("[MentosService.updateMentos]");
		Date startDay = Date.valueOf(createMentosDto.getStartDay());
		Date endDay = Date.valueOf(createMentosDto.getEndDay());
		Timestamp startTime = Timestamp
				.valueOf(LocalDateTime.of(LocalDate.of(2000, 1, 1), LocalTime.parse(createMentosDto.getStartTime())));
		Timestamp endTime = Timestamp
				.valueOf(LocalDateTime.of(LocalDate.of(2000, 1, 1), LocalTime.parse(createMentosDto.getEndTime())));

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

		// DB 업데이트용 DTO 생성
		CreateMentosDBDTO dbDTO = CreateMentosDBDTO.builder().categoryId(createMentosDto.getCategoryId())
				.content(createMentosDto.getContent()).endDay(endDay).startDay(startDay).endTime(endTime)
				.startTime(startTime).image(imageUrl) // URL 경로 저장
				.languageId(createMentosDto.getLanguageId()).matchTypeFirst(createMentosDto.getMatchTypeFirst())
				.matchTypeSecond(createMentosDto.getMatchTypeSecond())
				.matchTypeThird(createMentosDto.getMatchTypeThird()).maxMember(createMentosDto.getMaxMember())
				.minMember(createMentosDto.getMinMember()).price(createMentosDto.getPrice())
				.mentoId(createMentosDto.getMentoId()).title(createMentosDto.getTitle())
				.simpleContent(createMentosDto.getSimpleContent()).selectedDays(createMentosDto.getSelectedDays())
				.times(createMentosDto.getTimes()).regionDetail(createMentosDto.getRegionDetail())
				.regionGroup(createMentosDto.getRegionGroup()).regionSubgroup(createMentosDto.getRegionSubgroup())
				.build();

		Map<String, Object> mentosUpdateParams = new HashMap<>();
		mentosUpdateParams.put("CreateMentosDBDTO", dbDTO);
		mentosUpdateParams.put("mentosId", mentosId);
		int result = mentosMapper.updateMentos(mentosUpdateParams);
		return result == 1;
	}
}
