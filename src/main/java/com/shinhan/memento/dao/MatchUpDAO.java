package com.shinhan.memento.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.memento.model.MatchUp;
import com.shinhan.memento.model.UserType;
import com.shinhan.memento.model.WaitingMentoMatchUp;
import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchTypeDTO;
import com.shinhan.memento.dto.MatchupApplyMentoDTO;
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

   /* 필터 목록 조회를 위한 DAO 메서드 */
   public List<String> getDistinctRegionGroups() {
      return sqlSession.selectList(namespace + "getDistinctRegionGroups");
   }

   public List<CategoryDTO> getAllCategories() {
      return sqlSession.selectList(namespace + "getAllCategories");
   }

   public List<LanguageDTO> getAllLanguages() {
      return sqlSession.selectList(namespace + "getAllLanguages");
   }
   
   public List<MatchTypeDTO> getAllMatchTypes() {
      return sqlSession.selectList(namespace + "getAllMatchTypes");
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
   
   /* MatchUp Model 반환 */
   public MatchUp getMatchupById(Integer matchupId) {
      return sqlSession.selectOne(namespace + "getMatchupModelById", matchupId);
   }
   
   /* 매치업 수정하기 (방장만이 갖고 있는 권한) */
   public int updateMatchup(MatchUp matchup) {
       return sqlSession.update(namespace + "updateMatchup", matchup);
   }
   
   /* 매치업 삭제하기 (방장만이 갖고 있는 권한) */
   public int inactivateMatchupByIdAndLeader(int matchupId, int leaderId) {
      Map<String, Object> params = new HashMap<>();
       params.put("matchupId", matchupId);
       params.put("leaderId", leaderId);
       return sqlSession.delete(namespace + "inactivateMatchupByIdAndLeader", params);
   }
   
   /* 특정 매치업에 멘토 신청하기 (멘토 기준) */ 
   public int applyMento(MatchupApplyMentoDTO dto) {
	   return sqlSession.insert(namespace + "applyMento", dto);
   }
   
   /* 접속 유저의 유저 타입 확인 */
   public UserType findUserTypeById(int memberId) {
       return sqlSession.selectOne(namespace + "findUserTypeById", memberId);
   }
}