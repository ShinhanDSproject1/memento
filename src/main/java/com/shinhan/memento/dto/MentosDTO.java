package com.shinhan.memento.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class MentosDTO {
	Integer mentos_id;
	Integer category_id;
	Integer language_id;
	Integer mento_id;
	String title;
	String simple_content;
	String image;
	Integer price;
	String region_group;
	String region_subgroup;
	String region_detail;
	Date start_day;
	Date end_day;
	Timestamp start_time;
	Timestamp emd_time;
	Integer times;
	Integer min_member;
	Integer max_member;
	String content;
	Date created_at;
	Date updated_at;
	String status;
	Integer match_type_id_first;
	Integer match_type_id_second;
	Integer match_type_id_third;
}
