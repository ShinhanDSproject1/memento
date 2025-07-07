package com.shinhan.memento.mapper;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.shinhan.memento.model.MentoTestHistory;
import com.shinhan.memento.model.SparkTestType;

@Mapper
public interface MypageMapper {
	public abstract List<Map<String, Object>> selectMyPaymentListById(Integer memberId);
	public abstract int selectMatchTypebyName(SparkTestType sparkType);
	public abstract int updateMyTypeByMemberId(@Param("matchTypeId") int matchTypeId, @Param("memberId") int memberId);
	public abstract MentoTestHistory selectMentoTestHistory(@Param("userId")int userId, @Param("now") String now);
	public abstract int  insertMentoTestHistory(MentoTestHistory history);
	public abstract int updateMemberUserType(@Param("userId") int userId, @Param("userType")String userType);
}
