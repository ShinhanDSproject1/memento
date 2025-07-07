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
    Integer maxMember;
    Integer minMember;
    boolean hasMento;
    Integer price;
    String regionGroup;
    String regionSubgroup;
    String regionDetail;
    String recruit;     /* 매치업 멤버를 아직 모집중인가에 대한 여부 (모집중, 마감임박, 모집 완료)*/
    String mRecruit;    /* 멘토를 모집하는 매치업인가에 대한 여부 (멘토 모집중, 모집 완료(표시 안됨))*/
    String selectedDays;
    String profileImageUrl;

    
    @JsonIgnore
    LocalDateTime startTime;
    
    @JsonIgnore
    LocalDateTime endTime;  

    /* Category, Language 테이블을 통해 이름을 참조*/
    String categoryName;
    String languageName;
    
    /* 조회를 위한 */
    @Builder.Default
    boolean newMatchup = false;
    
    /* 날짜 포맷 변경 */
    public String getFormattedStartDate() {
        if (startDay == null) return "";
        return new SimpleDateFormat("yyyy/MM/dd").format(startDay);
    }

    public String getFormattedEndDate() {
        if (endDay == null) return "";
        return new SimpleDateFormat("yyyy/MM/dd").format(endDay);
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
    
    /* 모집인원 포맷 변경 */
    public String getFormattedMemberCount() {
        return String.format("%02d/%02d", matchupCount, maxMember);
    }
    
   /* 가격 포맷 변경 */ 
    public String getFormattedPrice() {
        return String.format("%,d", price);
    }
    
    /* */
    public boolean isNewMatchup() {
        return newMatchup;
    }

    public void setNewMatchup(boolean newMatchup) {
        this.newMatchup = newMatchup;
    }
    
    public String getProfileImageUrl() {
        if (profileImageUrl == null || profileImageUrl.trim().isEmpty()) {
            return "/memento/resources/images/default-profile.svg"; // 기본 이미지
        }
        return profileImageUrl;
    }
    
}