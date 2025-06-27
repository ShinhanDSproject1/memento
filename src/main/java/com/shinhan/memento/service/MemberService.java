package com.shinhan.memento.service;

import com.shinhan.memento.dto.MemberDTO;

public interface MemberService {
    MemberDTO findByEmail(String email);
    void insertMember(MemberDTO dto);
    MemberDTO kakaoLogin(String code, String clientId, String redirectUri) throws Exception;
}
