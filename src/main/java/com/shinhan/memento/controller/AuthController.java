package com.shinhan.memento.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shinhan.memento.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AuthController {

    private final MemberService memberService;

    private final String clientId = "dd889aeee45cfc71c810b8d5b41a800f";
    private final String redirectUri = "http://localhost:9999/memento/api/auth/kakao/callback";

//    @GetMapping("/api/auth/kakao/callback")
//    public String kakaoLogin(@RequestParam("code") String code, HttpSession session) throws Exception {
//        MemberDTO member = memberService.kakaoLogin(code, clientId, redirectUri);
//        session.setAttribute("loginUser", member);
//        return "redirect:/mainpage/main1";
//    }
}