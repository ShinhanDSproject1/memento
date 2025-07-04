package com.shinhan.memento.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.shinhan.memento.dto.MyProfileDBUpdateDTO;
import com.shinhan.memento.model.SparkTestType;

@Mapper
public interface MypageMapper {
	public abstract List<Map<String, Object>> selectMyPaymentListById(Integer memberId);
	public abstract List<Map<String, Object>> selectPaymentDetail(String orderId);
	public abstract int selectMatchTypebyName(SparkTestType sparkType);
	public abstract int updateMyTypeByMemberId(@Param("matchTypeId") int matchTypeId, @Param("memberId") int memberId);
	public abstract List<Map<String, Object>> selectMyProfileInfo(Integer memberId);
	public abstract int updateProfileInfo(MyProfileDBUpdateDTO dto);
	public abstract List<Map<String, Object>> refundSelectData(@Param("memberId") Integer memberId, @Param("orderId")String orderId);
	public abstract int updateUserBalance(@Param("resultBalance") Integer resultBalance, @Param("memberId") Integer memberId);
	public abstract int updatePaymentByRefund(@Param("orderId") String orderId);
}
