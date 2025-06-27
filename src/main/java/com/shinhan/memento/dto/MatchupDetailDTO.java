package com.shinhan.memento.dto;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
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
public class MatchupDetailDTO {
	   Integer matchup_id;
	   Integer category_id;
	   Integer language_id;
	   Integer leader_id;
	   Integer mento_id;
	   String title;
	   Integer count;
	   Integer matchup_count;
	   Date start_day; /* 화면 상에 추가해야 하지 않나 생각함. */
	   Date end_day;   /* 화면 상에 추가해야 하지 않나 생각함. */
	   Integer match_type_first;
	   Integer match_type_second;
	   Integer match_type_third;
	   
	   @JsonIgnore
	   LocalDateTime start_time;
	   
	   @JsonIgnore
	   LocalDateTime end_time;
	   
	   Integer max_member;
	   boolean has_mento;
	   String content;
	   Integer price;
	   String region_group;
	   String region_subgroup;
	   String region_detail;
	   String selected_days; /* 화면 상에 추가해야 하지 않나 생각함. */
	   
	   /* Category, Language, MatchType 테이블을 통해 이름을 참조*/
	   String categoryName;
	   String languageName;
	   String matchTypeFirstName;
	   String matchTypeSecondName;
	   String matchTypeThirdName;
	   
	   /* 모집 현황 정보 */
	   String m_recruit; /* 멘토를 모집하는 매치업인가에 대한 여부 (멘토 모집중, 모집 완료(표시 안됨))*/ 
	   
	   	/* 날짜 포맷 변경 */
	    public String getFormattedStartDate() {
	        if (start_day == null) return "";
	        return new SimpleDateFormat("yyyy/MM/dd").format(start_day);
	    }

	    public String getFormattedEndDate() {
	        if (end_day == null) return "";
	        return new SimpleDateFormat("yyyy/MM/dd").format(end_day);
	    }
	    
	    /* 시간 포맷 변경 */
	    public String getFormattedStartTime() {
	        if (start_time == null) return "";
	        return start_time.format(DateTimeFormatter.ofPattern("HH:mm"));
	    }

	    public String getFormattedEndTime() {
	        if (end_time == null) return "";
	        return end_time.format(DateTimeFormatter.ofPattern("HH:mm"));
	    }
	    
	    /* 지역 정보 포맷 (region_group + region_subgroup + region_detail) */
	    public String getFormattedRegion() {
	        StringBuilder sb = new StringBuilder();
	        
	        if (region_group != null && !region_group.isEmpty()) {
	            sb.append(region_group);
	        }
	        if (region_subgroup != null && !region_subgroup.isEmpty()) {
	            if (sb.length() > 0) sb.append(" ");
	            sb.append(region_subgroup);
	        }
	        if (region_detail != null && !region_detail.isEmpty()) {
	            if (sb.length() > 0) sb.append(" ");
	            sb.append(region_detail);
	        }
	        return sb.toString();
	    }	    
	    
	    /* 모집인원 포맷 변경 */
	    public String getFormattedMemberCount() {
	        return String.format("%02d/%02d", count, max_member);
	    }
	    
	    /* 가격 포맷 변경 */ 
	    public String getFormattedPrice() {
	        return String.format("%,d", price);
	    }

}
