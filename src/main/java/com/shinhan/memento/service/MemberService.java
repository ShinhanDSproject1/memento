package com.shinhan.memento.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shinhan.memento.dto.mentoDetail.MentoDetailHomeDTO;
import com.shinhan.memento.dto.mentos.GetMentosDTO;
import com.shinhan.memento.mapper.MemberMapper;
import com.shinhan.memento.mapper.MentosMapper;
import com.shinhan.memento.model.BaseStatus;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.model.Mentos;
import com.shinhan.memento.model.UserType;
import com.shinhan.memento.util.DBUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberService {
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	MentosService mentosService;
	
	@Autowired
	MentosMapper mentosMapper;
	
	public Member findMemberById(int memberId) {
		log.info("[MemberService.findMemberById]");
		return memberMapper.findMemberById(memberId);
	}
	public Member findMemberByIdAndUserType(Map<String, Object> params) {
		log.info("[MemberService.findMemberByIdAndUserType]");
		return memberMapper.findMemberByIdAndUserType(params);
	}
	
	public Member kakaoLogin(String code, String clientId, String redirectUri) throws Exception {
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
		ResponseEntity<String> tokenResponse = rt.postForEntity("https://kauth.kakao.com/oauth/token", tokenRequest,
				String.class);

		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode tokenJson = objectMapper.readTree(tokenResponse.getBody());
		String accessToken = tokenJson.get("access_token").asText();

		// 2. 사용자 정보 요청
		HttpHeaders profileHeaders = new HttpHeaders();
		profileHeaders.add("Authorization", "Bearer " + accessToken);

		HttpEntity<Void> profileRequest = new HttpEntity<>(profileHeaders);
		ResponseEntity<String> profileResponse = rt.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.GET,
				profileRequest, String.class);

		JsonNode userJson = objectMapper.readTree(profileResponse.getBody());
		String email = userJson.get("kakao_account").get("email").asText();
		String nickname = userJson.get("properties").get("nickname").asText();
		String imageUrl = userJson.get("properties").get("profile_image").asText();

		// 3. DB에서 회원 확인 또는 신규 등록
		Member member = findByEmail(email);

		if (member == null) {
			member = Member.builder().email(email).nickname(nickname).userType(UserType.MENTI).point(0).score(0)
					.matchTypeId(1).status(BaseStatus.ACTIVE).createdAt(new java.sql.Date(System.currentTimeMillis()))
					.profileImg(imageUrl).build();

			insertMember(member);
			member = findByEmail(email);
			int insertSuccess =  insertUserbalance(member.getMemberId());
			log.info(insertSuccess == 1 ? "insertUserbalance : sucess" : "insertUserbalance : fail");
			
		} else {
			member.updateMemberProfile(imageUrl); // 기존 회원 프로필 최신화
		}

		return member;
	}

	private int insertUserbalance(int memberId) {
		  String sql = "INSERT INTO userbalance ("
	               + "userbalance_id, member_id, balance, updated_at, status"
	               + ") VALUES (seq_userbalance_id.nextval, ?, ?, ?, ?)";
		  
		int result = 0;
	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {

	        pstmt.setInt(1, memberId);                              // member_id
	        pstmt.setInt(2, 0);                                     // balance 초기값
	        pstmt.setDate(3, new java.sql.Date(System.currentTimeMillis())); // updated_at
	        pstmt.setString(4, "ACTIVE");                           // status

	        result = pstmt.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return result; 
	}

	public Member findByEmail(String email) {
		Member member = null;
		String sql = "SELECT * FROM member WHERE email = ?";
		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				member = Member.builder().memberId(rs.getInt("member_id")).email(rs.getString("email"))
						.nickname(rs.getString("nickname")).userType(UserType.valueOf(rs.getString("user_type")))
						.status(BaseStatus.valueOf(rs.getString("status"))).profileImg(rs.getString("profile_image_url")).build();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}

	public void insertMember(Member dto) {
		String sql = "INSERT INTO member (" + "member_id, match_type_id, email, nickname, phone_number, "
				+ "user_type, point, introduce_mento, score, " + "region_group, region_subgroup, region_detail, "
				+ "created_at, updated_at, status, profile_image_url"
				+ ") VALUES (seq_member_id.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
		
			pstmt.setInt(1, dto.getMatchTypeId());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getNickname());
			pstmt.setString(4, dto.getPhoneNumber());
			pstmt.setString(5, String.valueOf(dto.getUserType()));
			pstmt.setInt(6, dto.getPoint());
			pstmt.setString(7, dto.getIntroduceMento());
			pstmt.setInt(8, dto.getScore());
			pstmt.setString(9, dto.getRegionGroup());
			pstmt.setString(10, dto.getRegionSubgroup());
			pstmt.setString(11, dto.getRegionDetail());
			pstmt.setDate(12, new java.sql.Date(System.currentTimeMillis()));
			pstmt.setDate(13, null);
			pstmt.setString(14, String.valueOf(dto.getStatus()));
			pstmt.setString(15, dto.getProfileImg());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 멘토 상세보기 페이지(홈화면)
	 */
	public MentoDetailHomeDTO showMentoDetailHome(Member member) {
		log.info("[MemberService.showMentoDetailHome]");
		System.out.println("member 왜 널이냐" + member.getIntroduceMento());
		String introduceComment = member.getIntroduceMento() == null ? "" : member.getIntroduceMento();
		
		// 그냥 진행 중인 최신 멘토스 딱 3개만 보여주기 
		List<Mentos> mentosList = mentosService.showInProgressMentosList(member.getMemberId());
		List<GetMentosDTO> inProgressMentos = new ArrayList<>();
		for(Mentos mentos : mentosList) {
			LocalDate today = LocalDate.now();
			LocalDate startDate = mentos.getStartDay().toLocalDate();
			long daysBetween = ChronoUnit.DAYS.between(today, startDate);
			
			int nowMemberCnt = mentosMapper.countNowMember(mentos.getMentosId());
			int remainMemberCnt = mentos.getMinMember() - nowMemberCnt;
			String remainMemberStr = "";
			if (remainMemberCnt <= 0) {
				remainMemberStr = "확정";
			} else {
				remainMemberStr = "확정까지 " + remainMemberCnt + "명";
			}
			
			GetMentosDTO dto = GetMentosDTO.builder()
					.mentosId(mentos.getMentosId())
					.daysBetween(daysBetween)
					.remainMemberCnt(remainMemberStr)
					.mentosImg(mentos.getImage())
					.title(mentos.getTitle())
					.mentoName(member.getNickname())
					.mentoType(member.getUserType().toString())
					.startDay(mentos.getStartDay().toString())
					.endDay(mentos.getEndDay().toString())
					.startTime(mentos.getStartTime().toString().substring(11))
					.endTime(mentos.getEndTime().toString().substring(11))
					.location(mentos.getRegionGroup()+" "+mentos.getRegionSubgroup())
					.price(mentos.getPrice())
					.build();
			
			inProgressMentos.add(dto);
		}
		
		MentoDetailHomeDTO result = MentoDetailHomeDTO.builder()
				.introduceComment(introduceComment)
				.inProgressMentos(inProgressMentos)
				.build();
		
		return result;
	}

}
