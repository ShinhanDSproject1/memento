package com.shinhan.memento.dao;

import com.shinhan.memento.model.Member;

public interface MemberDAOInterface {

	public Member selectMemberById(int memberId);
}
