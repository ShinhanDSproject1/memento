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
public class MatchUpDTO {
	Integer matchup_id;
	Integer category_id;
	Integer language_id;
	Integer leader_id;
	Integer mento_id;
	Integer match_type_id_first;
	Integer match_type_id_second;
	Integer match_type_id_third;
	String title;
	Integer count;
	Integer matchup_count;
	Date start_date;
	Date end_day;
	Integer min_member;
	Integer max_member;
	String content;
	boolean has_mento;
	Integer price;
	Integer kg_count;
	String region_group;
	String region_subgroup;
	String region_detail;
	Date created_at;
	Date updated_at;
	String status;
}
