package com.shinhan.memento.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.memento.dto.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberMatchUpDAO {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.shinhan.memento.dao.MatchUpDAO.";
	
	
	/* 삭제된 매치업에 신청 혹은 참여중인 멤버 데이터 삭제하기 */
	public int inactivateMemberMatchupById(int matchupId) {
		return sqlSession.delete(namespace + "inactivateMemberMatchupById", matchupId);
	}
	
	public int insertMemberMatchup(int memberId, int matchupId) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("memberId", memberId);
	    params.put("matchupId", matchupId);
	    return sqlSession.insert(namespace + "insertMemberMatchup", params);
	}
	
    // 신청 중복 체크
    public int existsActiveApplication(int memberId, int matchupId) {
        Map<String, Object> params = new HashMap<>();
        params.put("memberId", memberId);
        params.put("matchupId", matchupId);
        return sqlSession.selectOne(namespace + "existsActiveApplication", params);
    }

    // 신청 insert
    public int insertApplication(int memberId, int matchupId) {
        Map<String, Object> params = new HashMap<>();
        params.put("memberId", memberId);
        params.put("matchupId", matchupId);
        return sqlSession.insert(namespace + "insertApplication", params);
    }

    // 신청 취소 (논리 삭제)
    public int updateStatusToInactive(int memberId, int matchupId) {
        Map<String, Object> params = new HashMap<>();
        params.put("memberId", memberId);
        params.put("matchupId", matchupId);
        return sqlSession.update(namespace + "updateStatusToInactive", params);
    }
    
    public List<MemberDTO> findMembersByMatchupId(int matchupId) {
        return sqlSession.selectList(namespace + "findMembersByMatchupId", matchupId);
    }

}
