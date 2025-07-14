package com.shinhan.memento.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.memento.dto.matchup.MatchupApplyMentiDTO;
import com.shinhan.memento.dto.matchup.MatchupMemberDTO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberMatchUpDAO {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.shinhan.memento.dao.MemberMatchUpDAO.";

	/* 삭제된 매치업에 신청 혹은 참여중인 멤버 데이터 삭제하기 */
	public int deleteMemberMatchupById(int matchupId) {
		return sqlSession.delete(namespace + "deleteMemberMatchupById", matchupId);

	}
	/* 매치업에 멘티로 신청 */
    public int applyAsMenti(MatchupApplyMentiDTO dto) {
        return sqlSession.insert(namespace + "applyAsMenti", dto);
    }
    
    /* 특정 유저가 특정 매치업에 이미 신청했는지 확인 */
    public int checkIfAlreadyApplied(Map<String, Object> params) {
        return sqlSession.selectOne(namespace + "checkIfAlreadyApplied", params);
    }
    

    /* 특정 매치업에 참여중인 멤버 목록 조회 */
    public List<MatchupMemberDTO> findMembersByMatchupId(int matchupId) {
        return sqlSession.selectList(namespace + "findMembersByMatchupId", matchupId);
    }
}
