package com.shinhan.memento.service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shinhan.memento.dao.MatchUpDAO;
import com.shinhan.memento.dao.MemberMatchUpDAO;
import com.shinhan.memento.model.BaseStatus;
import com.shinhan.memento.model.MatchUp;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.model.UserType;
import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchTypeDTO;
import com.shinhan.memento.dto.MatchupApplyMentiDTO;
import com.shinhan.memento.dto.MatchupApplyMentoDTO;
import com.shinhan.memento.dto.MatchupCreateDTO;
import com.shinhan.memento.dto.MatchupDetailDTO;
import com.shinhan.memento.dto.MatchupListDTO;
import com.shinhan.memento.dto.MatchupPaginationDTO;
import com.shinhan.memento.dto.MatchupPaginationResultDTO;
import com.shinhan.memento.dto.MatchupPagingResponseDTO;
import com.shinhan.memento.dto.MatchupUpdateDTO;
import com.shinhan.memento.dto.MatchupWaitingMentoDTO;
import com.shinhan.memento.mapper.MemberMapper;

@Service
public class MatchupService {

	@Autowired
	MatchUpDAO matchUpDAO;
	@Autowired
	MemberMatchUpDAO memberMatchUpDAO;
	@Autowired
	MemberMapper memberMapper;

	/* 매치업 조회 */
	public MatchupPagingResponseDTO<MatchupListDTO> getMatchupList(Map<String, Object> params) {
		
		int count = matchUpDAO.countAll(params);
		
		MatchupPaginationDTO pagination = (MatchupPaginationDTO) params.get("pagination");
		MatchupPaginationResultDTO paginationResult = new MatchupPaginationResultDTO(pagination, count);
		
        params.put("offset", pagination.getOffset());
        params.put("recordSize", pagination.getRecordSize());
		
		List<MatchupListDTO> matchups = matchUpDAO.getMatchupList(params);

		for (MatchupListDTO matchup : matchups) {
			if (matchup.getMaxMember() != null && matchup.getMatchupCount() >= matchup.getMaxMember()) {
				matchup.setRecruit("모집완료");
			} else if (matchup.getMaxMember() != null && matchup.getMatchupCount() >= (matchup.getMaxMember() - 2)) {
				matchup.setRecruit("마감임박");
			} else {
				matchup.setRecruit("모집중");
			}
		}
		return new MatchupPagingResponseDTO<>(matchups, paginationResult);
	}

	/* 매치업 상세보기 */
	public MatchupDetailDTO getMatchupDetail(int id, Integer loginMemberId) {
		MatchupDetailDTO matchupDetail = matchUpDAO.getMatchupDetail(id);

		if (matchupDetail == null) {
			throw new IllegalArgumentException("매치업을 찾을 수 없습니다. id: " + id);
		} else {
			int currentMemberCount = matchUpDAO.getActiveMemberCount(matchupDetail.getMatchupId()); /* 현재 신청 인원 */
			matchupDetail.setMatchupCount(currentMemberCount);
		}

        if (loginMemberId != null) {
            // 멘토 신청 여부 확인 
            Map<String, Object> mentoParams = new HashMap<>();
            mentoParams.put("memberId", loginMemberId);
            mentoParams.put("matchupId", id);
            int mentoApplicationCount = matchUpDAO.checkMentoApplicationExists(mentoParams);
            if (mentoApplicationCount > 0) {
                matchupDetail.setMentoApplicationPending(true);
            }

            // 멘티 참여 여부 확인 
            Map<String, Object> mentiParams = new HashMap<>();
            mentiParams.put("memberId", loginMemberId);
            mentiParams.put("matchupId", id);
            int mentiApplicationCount = memberMatchUpDAO.checkIfAlreadyApplied(mentiParams); 
            if (mentiApplicationCount > 0) {
                matchupDetail.setAlreadyAppliedAsMenti(true);
            }
        }
		return matchupDetail;
	}

	public List<String> getDistinctRegionGroups() {
		return matchUpDAO.getDistinctRegionGroups();
	}

	/* 필터 목록 */
	public List<CategoryDTO> getAllCategories() {
		return matchUpDAO.getAllCategories();
	}

	public List<LanguageDTO> getAllLanguages() {
		return matchUpDAO.getAllLanguages();
	}

	public List<MatchTypeDTO> getAllMatchTypes() {
		return matchUpDAO.getAllMatchTypes();
	}

	/* 매치업 생성 */
	public int createMatchup(MatchupCreateDTO dto) {

		MatchUp matchupToCreate = new MatchUp();

		matchupToCreate.setTitle(dto.getTitle());
		matchupToCreate.setContent(dto.getContent());
		matchupToCreate.setLanguageId(dto.getLanguageId());
		matchupToCreate.setCategoryId(dto.getCategoryId());
		matchupToCreate.setCount(dto.getCount());
		matchupToCreate.setSelectedDays(dto.getSelectedDays());
		matchupToCreate.setHasMento(dto.getHasMento());
		matchupToCreate.setPrice(dto.getPrice());
		matchupToCreate.setMinMember(dto.getMinMember());
		matchupToCreate.setMaxMember(dto.getMaxMember());
		matchupToCreate.setRegionGroup(dto.getRegionGroup());
		matchupToCreate.setRegionSubgroup(dto.getRegionSubgroup());
		matchupToCreate.setRegionDetail(dto.getRegionDetail());
		matchupToCreate.setMatchTypeFirst(dto.getMatchTypeFirst());
		matchupToCreate.setMatchTypeSecond(dto.getMatchTypeSecond());
		matchupToCreate.setMatchTypeThird(dto.getMatchTypeThird());
		matchupToCreate.setLeaderId(dto.getLeaderId());
		matchupToCreate.setStatus(BaseStatus.ACTIVE);

		if (dto.getStartDay() != null && !dto.getStartDay().isEmpty()) {
			LocalDate localStartDate = LocalDate.parse(dto.getStartDay());
			matchupToCreate.setStartDay(Date.valueOf(localStartDate));
		}
		if (dto.getEndDay() != null && !dto.getEndDay().isEmpty()) {
			LocalDate localEndDate = LocalDate.parse(dto.getEndDay());
			matchupToCreate.setEndDay(Date.valueOf(localEndDate));
		}

		if (dto.getStartTime() != null && !dto.getStartTime().isEmpty()) {
			matchupToCreate.setStartTime(LocalDateTime.parse(dto.getStartTime()));
		}
		if (dto.getEndTime() != null && !dto.getEndTime().isEmpty()) {
			matchupToCreate.setEndTime(LocalDateTime.parse(dto.getEndTime()));
		}
		return matchUpDAO.createMatchup(matchupToCreate);
	}

	/* 매치업 수정 */
	@Transactional
	public int updateMatchup(MatchupUpdateDTO dto) {

		MatchUp matchupToUpdate = matchUpDAO.getMatchupById(dto.getMatchupId());

		if (matchupToUpdate == null) {
			throw new RuntimeException("수정할 매치업을 찾을 수 없습니다.");
		}

		matchupToUpdate.setTitle(dto.getTitle());
		matchupToUpdate.setContent(dto.getContent());
		matchupToUpdate.setLanguageId(dto.getLanguageId());
		matchupToUpdate.setCategoryId(dto.getCategoryId());
		matchupToUpdate.setCount(dto.getCount());
		matchupToUpdate.setSelectedDays(dto.getSelectedDays());
		matchupToUpdate.setHasMento(dto.getHasMento());
		matchupToUpdate.setPrice(dto.getPrice());
		matchupToUpdate.setMinMember(dto.getMinMember());
		matchupToUpdate.setMaxMember(dto.getMaxMember());
		matchupToUpdate.setRegionGroup(dto.getRegionGroup());
		matchupToUpdate.setRegionSubgroup(dto.getRegionSubgroup());
		matchupToUpdate.setRegionDetail(dto.getRegionDetail());
		matchupToUpdate.setMatchTypeFirst(dto.getMatchTypeFirst());
		matchupToUpdate.setMatchTypeSecond(dto.getMatchTypeSecond());
		matchupToUpdate.setMatchTypeThird(dto.getMatchTypeThird());

		if (dto.getStartDay() != null && !dto.getStartDay().isEmpty()) {
			LocalDate localStartDate = LocalDate.parse(dto.getStartDay());
			matchupToUpdate.setStartDay(Date.valueOf(localStartDate));

			if (dto.getStartTime() != null && !dto.getStartTime().isEmpty()) {
				LocalTime localStartTime = LocalTime.parse(dto.getStartTime());
				matchupToUpdate.setStartTime(LocalDateTime.of(localStartDate, localStartTime));
			}
		}

		if (dto.getEndDay() != null && !dto.getEndDay().isEmpty()) {
			LocalDate localEndDate = LocalDate.parse(dto.getEndDay());
			matchupToUpdate.setEndDay(Date.valueOf(localEndDate));

			if (dto.getEndTime() != null && !dto.getEndTime().isEmpty()) {
				LocalTime localEndTime = LocalTime.parse(dto.getEndTime());
				matchupToUpdate.setEndTime(LocalDateTime.of(localEndDate, localEndTime));
			}
		}

		return matchUpDAO.updateMatchup(matchupToUpdate);
	}

	/* 매치업 삭제 */
	@Transactional // 한꺼번에 처리 위해 (1. 매치업 테이블에서 해당 매치업 삭제, 2. 멤버 매치업 테이블에서 관련 내역 삭제)
	public int inactivateMatchup(int matchupId, int leaderId) {
		memberMatchUpDAO.inactivateMemberMatchupById(matchupId);
		int result = matchUpDAO.inactivateMatchupByIdAndLeader(matchupId, leaderId);

		return result;
	}

	/* 특정 매치업에 멘토로 신청하기 */
	@Transactional
	public int applyMentoMatchup(MatchupApplyMentoDTO dto) {
		Map<String, Object> params = new HashMap<String, Object>();

		params.put("memberId", dto.getMemberId());
		params.put("userType", UserType.MENTO);
		params.put("status", BaseStatus.ACTIVE);

		Member member = memberMapper.findMemberById(params);
		if (member == null) {
			System.out.println("사용자 정보가 존재하지 않습니다.");
			return -1;
		}

		UserType userType = matchUpDAO.findUserTypeById(dto.getMemberId());
		if (userType == null) {
			System.out.println("사용자 타입 정보가 DB에 존재하지 않습니다.");
			return -1;
		}
		if (userType != UserType.MENTO) {
			System.out.println("멘토 권한이 없습니다. UserType=" + userType.name());
			return -1;
		}
		int result = matchUpDAO.applyMento(dto);
		return result;
	}

	public List<MatchupWaitingMentoDTO> getWaitingMentoList(int matchupId) {
		return matchUpDAO.selectWaitingMentoByMatchupId(matchupId);
	}

	/* 멘토 승인, 선정 처리 트랜잭션 */
	@Transactional
	public MatchupWaitingMentoDTO approveMento(int matchupId, int memberId) {

		Map<String, Object> params = new HashMap<>();
		params.put("matchupId", matchupId);
		params.put("memberId", memberId);
		int updatedMatchup = matchUpDAO.setMentoForMatchup(params);
		if (updatedMatchup == 0) {
			throw new RuntimeException("매치업 정보 업데이트에 실패했습니다. matchupId: " + matchupId);
		}
		matchUpDAO.deleteWaitingMentoApplications(matchupId);

        MatchupWaitingMentoDTO resultDto = matchUpDAO.getApprovedMentoDetails(memberId);
        if (resultDto == null) {
            throw new RuntimeException("승인된 멘토의 상세 정보를 찾을 수 없습니다. memberId: " + memberId);
        }
		return resultDto;
	}
	
	
    /* 매치업에 멘티로 참여 신청하기 */
    @Transactional 
    public int applyForMatchupAsMenti(MatchupApplyMentiDTO dto) {
        // 1. 신청하려는 매치업의 현재 정보를 가져온다.
        MatchUp matchup = matchUpDAO.getMatchupById(dto.getMatchupId());

        if (matchup == null) {
            return -3; // 존재하지 않는 매치업
        }

        // 2. 이미 신청한 사용자인지 확인한다.
        Map<String, Object> params = new HashMap<>();
        params.put("memberId", dto.getMemberId());
        params.put("matchupId", dto.getMatchupId());
        int appliedCount = memberMatchUpDAO.checkIfAlreadyApplied(params);

        if (appliedCount > 0) {
            return -2; // 이미 신청한 경우
        }

        // 3. 모집 인원이 다 찼는지 확인한다.
        // matchup_count는 DB에서 직접 관리되므로, getActiveMemberCount를 호출하여 최신 인원을 확인
        int currentMemberCount = matchUpDAO.getActiveMemberCount(dto.getMatchupId());
        if (currentMemberCount >= matchup.getMaxMember()) {
            return -1; // 모집 인원 마감
        }

        // 4. 모든 조건을 통과했으면 신청 처리를 진행한다.
        // 4-1. member_matchup 테이블에 신청자 정보 삽입
        int insertResult = memberMatchUpDAO.applyAsMenti(dto);

        // 4-2. matchup 테이블의 현재 인원 수(matchup_count) 1 증가
        int updateResult = matchUpDAO.incrementMatchupCount(dto.getMatchupId());

        if (insertResult > 0 && updateResult > 0) {
            return 1; // 성공
        } else {
            return 0; // 실패
        }
    }
}