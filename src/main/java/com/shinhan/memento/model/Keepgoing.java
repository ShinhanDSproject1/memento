package com.shinhan.memento.model;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Builder
public class Keepgoing {
	int keepgoing_id;
	int member_id;
	int category_id;
	int language_id;
	int match_type_id;
	String name;
	String img_logo;
	String img_activity;
	LocalDateTime start_time;
	LocalDateTime emd_time;
	String selected_days;
	String content;
	int price;
	String region_group;
	String region_subgroup;
	String region_detail;
	Date created_at;
	Date updated_at;
	BaseStatus status;
}
