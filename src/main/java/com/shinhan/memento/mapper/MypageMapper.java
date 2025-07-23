package com.shinhan.memento.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.shinhan.memento.dto.mypage.MyMatchTypeByDashboardResponseDTO;
import com.shinhan.memento.dto.mypage.MyPageSideBarResponseDTO;
import com.shinhan.memento.dto.mypage.MyProfileDBUpdateDTO;
import com.shinhan.memento.model.MentoTestHistory;
import com.shinhan.memento.model.SparkTestType;

@Mapper
public interface MypageMapper {
	public abstract List<Map<String, Object>> selectMyPaymentListById(Integer memberId);
	public abstract List<Map<String, Object>> selectPaymentDetail(String orderId);
	public abstract int selectMatchTypebyName(SparkTestType sparkType);
	public abstract int updateMyTypeByMemberId(@Param("matchTypeId") int matchTypeId, @Param("memberId") int memberId);
	public abstract MentoTestHistory selectMentoTestHistory(@Param("userId")int userId, @Param("now") String now);
	public abstract int  insertMentoTestHistory(MentoTestHistory history);
	public abstract int updateMemberUserType(@Param("userId") int userId, @Param("userType")String userType);
	public abstract List<Map<String, Object>> selectMyProfileInfo(Integer memberId);
	public abstract int updateProfileInfo(MyProfileDBUpdateDTO dto);
	public abstract List<Map<String, Object>> myJoinMatchupByDashboard(@Param("memberId") Integer memberId);
	public abstract List<Map<String, Object>> myJoinMentosByDashboard(@Param("memberId") Integer memberId);
	public abstract MyMatchTypeByDashboardResponseDTO myMatchTypeByDashboard(@Param("memberId") Integer memberId);
	public abstract List<Map<String, Object>> refundSelectData(@Param("memberId") Integer memberId, @Param("orderId")String orderId);
	public abstract int updateUserBalanceByRefund(@Param("resultBalance") Integer resultBalance, @Param("memberId") Integer memberId);
	public abstract int updatePaymentByRefund(@Param("orderId") String orderId);
	public abstract MyPageSideBarResponseDTO selectMySideBarInfo(@Param("memberId") Integer memberId);
	public abstract List<Map<String, Object>> selectMyCreateMatchUpList(@Param("memberId") Integer memberId);
	public abstract List<Map<String, Object>> myCreateMatchupByDashboard(@Param("memberId") Integer memberId);
	public abstract List<Map<String, Object>> selectJoinMyMatchUpList(@Param("memberId") Integer memberId);
	public abstract List<Map<String, Object>> selectMyMentosListById(@Param("memberId") Integer memberId);
}
