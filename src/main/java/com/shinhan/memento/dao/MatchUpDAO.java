package com.shinhan.memento.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.memento.dto.MatchUpDTO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MatchUpDAO {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.shinhan.memento.dao.MatchUpDAO.";
	
	public List<MatchUpDTO> getMatchupList(Map<String, Object> filters) {
		List<MatchUpDTO> matchuplist = sqlSession.selectList(namespace + "selectAll", filters);
		log.info(matchuplist.size() + "건 조회되었습니다");
		return matchuplist;
	}
    
	/* 현재 해당 매치업에 지원한 사람 수 체크 */
    public int getActiveMemberCount(int matchupId) {
        return sqlSession.selectOne(namespace + "getActiveMemberCount", matchupId);
    }

    /* 매치업 상세 페이지 정보 보기 */
	public MatchUpDTO getMatchupDetail(int matchupId) {
		return sqlSession.selectOne(namespace + "selectByMatchupId", matchupId);
	}
}