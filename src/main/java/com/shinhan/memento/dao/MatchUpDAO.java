package com.shinhan.memento.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.memento.model.MatchUp;
import com.shinhan.memento.dto.MatchupDetailDTO;
import com.shinhan.memento.dto.MatchupListDTO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MatchUpDAO {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.shinhan.memento.dao.MatchUpDAO.";
	
	public List<MatchupListDTO> getMatchupList(Map<String, Object> filters) {
		List<MatchupListDTO> matchuplist = sqlSession.selectList(namespace + "selectAll", filters);
		log.info(matchuplist.size() + "건 조회되었습니다");
		return matchuplist;
	}
    
	/* 현재 해당 매치업에 지원한 사람 수 체크 */
    public int getActiveMemberCount(int matchupId) {
        return sqlSession.selectOne(namespace + "getActiveMemberCount", matchupId);
    }

    /* DB에 저장된 카테고리 이름 조회 */
    public String getCategoryName(int categoryId) {
        return sqlSession.selectOne(namespace + "getCategoryName", categoryId);
    }
    
    /* DB에 저장된 MatchType 이름 조회 */
    public String getMatchTypeName(int typeId) {
        return sqlSession.selectOne(namespace + "getMatchTypeName", typeId);
    }

    /* DB에 저장된 Language 이름 조회 */
    public String getLanguageName(int languageId) {
        return sqlSession.selectOne(namespace + "getLanguageName", languageId);
    }
    
    /* 매치업 상세 페이지 정보 보기 */
	public MatchupDetailDTO getMatchupDetail(int matchupId) {
		return sqlSession.selectOne(namespace + "selectByMatchupId", matchupId);
	}
	
	/* 매치업 신규 생성하기 */
	public int createMatchup(MatchUp matchup) {
	    return sqlSession.insert(namespace + "createMatchup", matchup);
	}
	
	/* 매치업 삭제하기 (방장만이 갖고 있는 권한) */
	public int deleteMatchupByIdAndLeader(int matchupId, int leaderId) {
		Map<String, Object> params = new HashMap<>();
	    params.put("matchupId", matchupId);
	    params.put("leaderId", leaderId);
	    return sqlSession.delete(namespace + "deleteMatchupByIdAndLeader", params);
	}
	
}