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
public class MatchupListDTO {
    Integer matchup_id;
    Integer category_id;
    Integer language_id;
    Integer leader_id;
    String title;
    Integer count;
    Integer matchup_count;
    Date start_day;
    Date end_day;
    Integer max_member;
    boolean has_mento;
    Integer price;
    String region_group;
    String recruit;  	/* 매치업 멤버를 아직 모집중인가에 대한 여부 (모집중, 마감임박, 모집 완료)*/
    String m_recruit; 	/* 멘토를 모집하는 매치업인가에 대한 여부 (멘토 모집중, 모집 완료(표시 안됨))*/
    
    @JsonIgnore
    LocalDateTime start_time;
    
    @JsonIgnore
    LocalDateTime end_time;    

    /* Category, Language 테이블을 통해 이름을 참조*/
    String categoryName;
    String languageName;
    
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
    
    /* 모집인원 포맷 변경 */
    public String getFormattedMemberCount() {
        return String.format("%02d/%02d", count, max_member);
    }
    
   /* 가격 포맷 변경 */ 
    public String getFormattedPrice() {
        return String.format("%,d", price);
    }
    
}