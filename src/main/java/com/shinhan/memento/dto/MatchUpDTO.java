package com.shinhan.memento.dto;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
   Integer match_type_first;
   Integer match_type_second;
   Integer match_type_third;
   String title;
   Integer count;
   Integer matchup_count;
   Date start_day;
   Date end_day;
   LocalDateTime start_time;
   LocalDateTime end_time; 
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
   String selected_days;
}