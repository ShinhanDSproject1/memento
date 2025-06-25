package com.shinhan.memento.dao;

import java.util.List;
import com.shinhan.memento.dto.MyMatchupListDTO;

public interface MemberMatchUpInterface {

	List<MyMatchupListDTO> selectJoinListByMemberId(Integer memberid);
}
