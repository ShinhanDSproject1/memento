package com.shinhan.memento.dto;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MyMatchupListDTO {
	private Integer matchup_id;
	private String leader_img;
	private String matchup_title;
	private String region_subgroup;
	private String category;
	private String language;
	private Timestamp start_time;
	private Timestamp end_time;
	private String selected_days;
	private Boolean has_mento;
	private String mento_nickname;
	private Integer count;
	private Integer matchup_count;
	private String role;
	private String status;
}