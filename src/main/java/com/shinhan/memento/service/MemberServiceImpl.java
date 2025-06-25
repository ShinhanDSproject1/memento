package com.shinhan.memento.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shinhan.memento.dto.MemberDTO;
import com.shinhan.memento.util.DBUtil;

@Service
public class MemberServiceImpl implements MemberService {

    @Override
    public MemberDTO kakaoLogin(String code, String clientId, String redirectUri) throws Exception {
        // 1. access token 요청
        RestTemplate rt = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", clientId);
        params.add("redirect_uri", redirectUri);
        params.add("code", code);

        HttpEntity<MultiValueMap<String, String>> tokenRequest = new HttpEntity<>(params, headers);
        ResponseEntity<String> tokenResponse = rt.postForEntity(
                "https://kauth.kakao.com/oauth/token",
                tokenRequest,
                String.class
        );

        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode tokenJson = objectMapper.readTree(tokenResponse.getBody());
        String accessToken = tokenJson.get("access_token").asText();

        // 2. 사용자 정보 요청
        HttpHeaders profileHeaders = new HttpHeaders();
        profileHeaders.add("Authorization", "Bearer " + accessToken);

        HttpEntity<Void> profileRequest = new HttpEntity<>(profileHeaders);
        ResponseEntity<String> profileResponse = rt.exchange(
                "https://kapi.kakao.com/v2/user/me",
                HttpMethod.GET,
                profileRequest,
                String.class
        );

        JsonNode userJson = objectMapper.readTree(profileResponse.getBody());
        String email = userJson.get("kakao_account").get("email").asText();
        String nickname = userJson.get("properties").get("nickname").asText();
        String imageUrl = userJson.get("properties").get("profile_image").asText();

        // 3. DB에서 회원 확인 또는 신규 등록
        MemberDTO member = findByEmail(email);

        if (member == null) {
            member = MemberDTO.builder()
                    .email(email)
                    .nickname(nickname)
                    .user_type("MENTE")
                    .point(0)
                    .score(0)
                    .match_type_id(1)
                    .status("ACTIVE")
                    .created_at(new java.sql.Date(System.currentTimeMillis()))
                    .profile_image_url(imageUrl)
                    .build();

            insertMember(member);
        } else {
            member.setProfile_image_url(imageUrl); // 기존 회원 프로필 최신화
        }

        return member;
    }

    @Override
    public MemberDTO findByEmail(String email) {
        MemberDTO member = null;
        String sql = "SELECT * FROM member WHERE email = ?";
        try (
            Connection conn = DBUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                member = MemberDTO.builder()
                        .member_id(rs.getInt("member_id"))
                        .email(rs.getString("email"))
                        .nickname(rs.getString("nickname"))
                        .user_type(rs.getString("user_type"))
                        .status(rs.getString("status"))
                        .profile_image_url(rs.getString("profile_image_url"))
                        .build();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return member;
    }

    @Override
    public void insertMember(MemberDTO dto) {
        String sql = "INSERT INTO member ("
                   + "member_id, match_type_id, email, nickname, phone_number, "
                   + "user_type, point, introduce_mento, score, "
                   + "region_group, region_subgroup, region_detail, "
                   + "created_at, updated_at, status, profile_image_url"
                   + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (
            Connection conn = DBUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            int newId = getNextMemberId();
            dto.setMember_id(newId);

            pstmt.setInt(1, dto.getMember_id());
            pstmt.setInt(2, dto.getMatch_type_id() != null ? dto.getMatch_type_id() : 1);
            pstmt.setString(3, dto.getEmail());
            pstmt.setString(4, dto.getNickname());
            pstmt.setString(5, dto.getPhone_number());
            pstmt.setString(6, dto.getUser_type());
            pstmt.setInt(7, dto.getPoint() != null ? dto.getPoint() : 0);
            pstmt.setString(8, dto.getIntroduce_mento());
            pstmt.setInt(9, dto.getScore() != null ? dto.getScore() : 0);
            pstmt.setString(10, dto.getRegion_group());
            pstmt.setString(11, dto.getRegion_subgroup());
            pstmt.setString(12, dto.getRegion_detail());
            pstmt.setDate(13, new java.sql.Date(System.currentTimeMillis()));
            pstmt.setDate(14, null);
            pstmt.setString(15, dto.getStatus());
            pstmt.setString(16, dto.getProfile_image_url());

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private int getNextMemberId() {
        int nextId = 1;
        String sql = "SELECT NVL(MAX(member_id), 0) + 1 FROM member";
        try (
            Connection conn = DBUtil.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)
        ) {
            if (rs.next()) {
                nextId = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nextId;
    }
}
