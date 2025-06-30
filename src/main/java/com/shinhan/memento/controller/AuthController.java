package com.shinhan.memento.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shinhan.memento.model.Member;
import com.shinhan.memento.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@PropertySource("classpath:application-secret.properties")
@RequiredArgsConstructor
public class AuthController {

	@Autowired
    MemberService memberService;

    @Value("${kakao.client-id}")
    private String clientId;

    @Value("${kakao.redirect-uri}")
    private String redirectUri;

    @GetMapping("/api/auth/kakao/callback")
    public String kakaoLogin(@RequestParam("code") String code, HttpSession session) throws Exception {
    	System.out.println(clientId);
    	System.out.println(redirectUri);
        Member member = memberService.kakaoLogin(code, clientId, redirectUri);
        session.setAttribute("loginUser", member);
        return "redirect:/mainpage/main1";
    }
}