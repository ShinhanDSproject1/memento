package com.shinhan.memento.dao;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.shinhan.memento.dto.MyMatchupListDTO;

@Repository
public class MemberMatchUpDAO implements MemberMatchUpInterface{

	@Override
	public List<MyMatchupListDTO> selectJoinListByMemberId(Integer memberid) {
		List<MyMatchupListDTO> memberMatchUPList = new ArrayList<MyMatchupListDTO>();

		return memberMatchUPList;
	}

}
