package com.shinhan.memento.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.shinhan.memento.dto.InterestDTO;
import com.shinhan.memento.model.Interest;

@Mapper
public interface InterestMapper {
	
    // 1. 관심사 이름으로 interest_id 조회 (없으면 null)
	InterestDTO getInterestByName(String interestName);
    
    void insertInterest(String interestName);
    
 // 3. 특정 회원의 모든 관심사 (interest_id) 조회
    @Select("SELECT mi.INTEREST_ID, i.INTEREST_NAME " +
            "FROM member_interest mi left JOIN INTEREST i ON mi.INTEREST_ID = i.INTEREST_ID " +
            "WHERE mi.member_id = #{memberId}")
    List<InterestDTO> getMemberInterestsByMemberId(@Param("memberId") Integer memberId);

    // 4. 회원 관심사 추가 (member_interest 테이블에 삽입)
    void insertMemberInterestByName(@Param("memberId") int memberId, @Param("interestName") String interestName);

    // 5. 회원 관심사 삭제 (member_interest 테이블에서 삭제)
    @Delete("DELETE FROM MEMBER_INTEREST WHERE member_id = #{memberId} AND interest_id = #{interestId}")
    void deleteMemberInterest(@Param("memberId") Integer memberId, @Param("interestId") Integer interestId);	
}
