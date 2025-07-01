package com.shinhan.memento.dao;

import java.util.List;

import com.shinhan.memento.dto.MyMentosListResponseDTO;

public interface MyPageDAOInterface {

	public abstract List<MyMentosListResponseDTO> selectMyMentosListById(Integer memberId);
}
