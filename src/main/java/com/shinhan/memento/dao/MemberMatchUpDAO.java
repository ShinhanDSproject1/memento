package com.shinhan.memento.dao;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.memento.dto.MatchupApplyMentiDTO;
import com.shinhan.memento.dto.MatchupMemberDTO;
import com.shinhan.memento.dto.MyMatchupListResponseDTO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberMatchUpDAO {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.shinhan.memento.dao.MemberMatchUpDAO.";
	
	String mypageNamespace="com.memento.shinhan.mymatchuplist.";
	
	public List<MyMatchupListResponseDTO> selectJoinListByMemberId(Integer memberId) {
		// 1. 결과를 DTO 리스트로 직접 받습니다.
        List<MyMatchupListResponseDTO> memberMatchUPList = sqlSession.selectList(mypageNamespace + "selectMyMatchUpList", memberId);

        // 2. DTO 리스트를 순회하며 시간 포맷만 수정합니다.
        for (MyMatchupListResponseDTO dto : memberMatchUPList) {
            // MyBatis가 DTO에 넣어준 기존 시간 값을 getter로 가져옵니다.
            String startRaw = dto.getStartTime(); // rawData.get("STARTTIME") 대신 사용
            String endRaw = dto.getEndTime();     // rawData.get("ENDTIME") 대신 사용

            // 원하시는 포맷으로 변경합니다.
            // (기존 코드에서 이 부분은 에러가 없었으므로 그대로 사용하되, null 체크를 추가하면 더 안전합니다.)
            if (startRaw != null && startRaw.length() >= 16) {
                String startFormatted = LocalTime.parse(startRaw.substring(11, 16)).format(DateTimeFormatter.ofPattern("HH:mm"));
                dto.setStartTime(startFormatted); // setter를 사용해 포맷된 값으로 덮어씁니다.
            }
            if (endRaw != null && endRaw.length() >= 16) {
                String endFormatted = LocalTime.parse(endRaw.substring(11, 16)).format(DateTimeFormatter.ofPattern("HH:mm"));
                dto.setEndTime(endFormatted);     // setter를 사용해 포맷된 값으로 덮어씁니다.
            }
        }

        return memberMatchUPList;
	}
	
	/* 매치업에 멘티로 신청 */
    public int applyAsMenti(MatchupApplyMentiDTO dto) {
        return sqlSession.insert(namespace + "applyAsMenti", dto);
    }
    
    /* 특정 유저가 특정 매치업에 이미 신청했는지 확인 */
    public int checkIfAlreadyApplied(Map<String, Object> params) {
        return sqlSession.selectOne(namespace + "checkIfAlreadyApplied", params);
    }
    
    /* 매치업 비활성화 시 멤버들도 비활성화 */
    public int inactivateMemberMatchupById(int matchupId) {
        return sqlSession.update(namespace + "inactivateMemberMatchupById", matchupId);
    }

    /* 특정 매치업에 참여중인 멤버 목록 조회 */
    public List<MatchupMemberDTO> findMembersByMatchupId(int matchupId) {
        return sqlSession.selectList(namespace + "findMembersByMatchupId", matchupId);
    }
}
