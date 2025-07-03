package com.shinhan.memento.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.shinhan.memento.model.SparkTestType;


@Mapper
public interface MypageMapper {
	public abstract List<Map<String, Object>> selectMyPaymentListById(Integer memberId);
	public abstract List<Map<String, Object>> selectPaymentDetail(String orderId);
	public abstract int selectMatchTypebyName(SparkTestType sparkType);
	public abstract int updateMyTypeByMemberId(@Param("matchTypeId") int matchTypeId, @Param("memberId") int memberId);
}
