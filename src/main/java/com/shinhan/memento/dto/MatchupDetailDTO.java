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
	private boolean isLeader;
    Integer matchupId; 
    Integer categoryId;
    Integer languageId;
    Integer leaderId;
    Integer mentoId;
    String title;
    Integer count;
    Integer matchupCount;
    Date startDay;
    Date endDay;
    Integer matchTypeFirst;
    Integer matchTypeSecond;
    Integer matchTypeThird;

    @JsonIgnore
    LocalDateTime startTime;
    
    @JsonIgnore
    LocalDateTime endTime;
    
    Integer maxMember;
    boolean hasMento;
    String content;
    Integer price;
    String regionGroup;
    String regionSubgroup;
    String regionDetail;
    String selectedDays;
    
    String categoryName;
    String languageName;
    String matchTypeFirstName;
    String matchTypeSecondName;
    String matchTypeThirdName;
    String mRecruit; 

    public String getFormattedStartDate() {
        if (startDay == null) return "";
        return new SimpleDateFormat("yyyy/MM/dd").format(startDay);
    }

    public String getFormattedEndDate() {
        if (endDay == null) return "";
        return new SimpleDateFormat("yyyy/MM/dd").format(endDay);
    }
    
    public String getFormattedStartTime() {
        if (startTime == null) return "";
        return startTime.format(DateTimeFormatter.ofPattern("HH:mm"));
    }

    public String getFormattedEndTime() {
        if (endTime == null) return "";
        return endTime.format(DateTimeFormatter.ofPattern("HH:mm"));
    }
    
    public String getFormattedRegion() {
        StringBuilder sb = new StringBuilder();
        if (regionGroup != null && !regionGroup.isEmpty()) sb.append(regionGroup);
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
    
    public String getFormattedMemberCount() {
        return String.format("%02d/%02d", count, maxMember);
    }
    
    public String getFormattedPrice() {
        return String.format("%,d", price);
    }
}
