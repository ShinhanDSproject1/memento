package com.shinhan.memento.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {
	private int memberId;
	private int matchTypeId;
	private String profileImg;
	private String email;
	private String nickname;
	private String phoneNumber;
	private UserType userType;
	private int point;
	private String introduceMento;
	private int score; // 매치업이나 멘토스 참여하면 점수 올리기 
	private String regionGroup;
	private String regionSubgroup;
	private String regionDetail;
	private Date createdAt;
	private Date updatedAt;
	private BaseStatus status;
	
	
	public void updateMemberProfile(String newProfileImg) {
		this.profileImg = newProfileImg;
	}
}
