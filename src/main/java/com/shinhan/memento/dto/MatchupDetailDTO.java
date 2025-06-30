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
	  	Integer matchupId; 
	    Integer categoryId;
	    Integer languageId;
	    Integer leaderId;
	    Integer mentoId;
	    String title;
	    Integer totalCount; 	/* 총 진행 횟수 */
	    Integer matchupCount;	/* 현재 참여 인원  */
	    Date startDay; 			/* 화면 상에 추가해야 하지 않나 생각함. */
	    Date endDay; 			/* 화면 상에 추가해야 하지 않나 생각함. */
	    Integer matchTypeFirst;
	    Integer matchTypeSecond;
	    Integer matchTypeThird;

	    @JsonIgnore
	    LocalDateTime startTime;
	    
	    @JsonIgnore
	    LocalDateTime endTime;
	    
	    Integer minMember; 
	    Integer maxMember;
	    boolean hasMento;
	    String content;
	    Integer price;
	    String regionGroup;
	    String regionSubgroup;
	    String regionDetail;
	    String selectedDays;	/* 화면 상에 추가해야 하지 않나 생각함. */
	    
	    /* Category, Language, MatchType 테이블을 통해 이름을 참조*/
	    String categoryName;
	    String languageName;
	    String matchTypeFirstName;
	    String matchTypeSecondName;
	    String matchTypeThirdName;
	    
	    /* 모집 현황 정보 */
	    String mRecruit; 		/* 멘토를 모집하는 매치업인가에 대한 여부 (멘토 모집중, 모집 완료(표시 안됨))*/ 
	   
	   	/* 날짜 포맷 변경 */
	    public String getFormattedStartDate() {
	        if (startDay == null) return "";
	        return new SimpleDateFormat("yyyy-MM-dd").format(startDay);
	    }

	    public String getFormattedEndDate() {
	        if (endDay == null) return "";
	        return new SimpleDateFormat("yyyy-MM-dd").format(endDay);
	    }
	    
	    /* 시간 포맷 변경 */
	    public String getFormattedStartTime() {
	        if (startTime == null) return "";
	        return startTime.format(DateTimeFormatter.ofPattern("HH:mm"));
	    }

	    public String getFormattedEndTime() {
	        if (endTime == null) return "";
	        return endTime.format(DateTimeFormatter.ofPattern("HH:mm"));
	    }
	    
	    /* 지역 정보 포맷 (region_group + region_subgroup + region_detail) */
	    public String getFormattedRegion() {
	        StringBuilder sb = new StringBuilder();
	        
	        if (regionGroup != null && !regionGroup.isEmpty()) {
	            sb.append(regionGroup);
	        }
	        if (regionSubgroup != null && !regionSubgroup.isEmpty()) {
	            if (sb.length() > 0) sb.append(" ");
	            sb.append(regionSubgroup);
	        }
	        if (regionDetail != null && !regionDetail.isEmpty()) {
	            if (sb.length() > 0) sb.append(" ");
	            sb.append(regionDetail);
	        }
	        return sb.toString();
	    }	    
	    
	    /* 모집인원 포맷 변경 */
	    public String getFormattedMemberCount() {
	        return String.format("%02d/%02d", matchupCount, maxMember);
	    }
	    
	    /* 가격 포맷 변경 */ 
	    public String getFormattedPrice() {
	        return String.format("%,d", price);
	    }

}
