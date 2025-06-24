package com.shinhan.memento.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class MemberDTO {
	Integer member_id;
	Integer match_type_id;
	String email;
	String nickname;
	String phone_number;
	String user_type;
	Integer point;
	String introduce_mento;
	Integer score;
	String region_group;
	String region_subgroup;
	String region_detail;
	Date created_at;
	Date updated_at;
	String status;
}
