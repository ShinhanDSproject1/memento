package com.shinhan.memento.service;

import org.springframework.transaction.annotation.Transactional;

public interface MemberService {
//    MemberDTO findByEmail(String email);
//    void insertMember(MemberDTO dto);
//    MemberDTO kakaoLogin(String code, String clientId, String redirectUri) throws Exception;
//	
	@Transactional
	void applyMatchup(int matchupId, int memberId);
}
