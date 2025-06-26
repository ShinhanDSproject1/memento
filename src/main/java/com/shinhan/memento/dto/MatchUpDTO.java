package com.shinhan.memento.dto;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
   
   /* 모집 현황 정보 */
   String recruit;
   String m_recruit;
   
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

   /* 태그 생성 */
    public String getTags() {
        String langTag = "";
        String catTag = "";
        
        switch (language_id) {
         case 1: langTag = "#Python"; break;
         case 2: langTag = "#Java"; break;
         case 3: langTag = "#C++"; break;
         case 4: langTag = "#C#"; break;
         case 5: langTag = "#C"; break;
         case 6: langTag = "#HTML/CSS"; break;
         case 7: langTag = "#JavaScript"; break;
         default: langTag = "";
        }
 
        switch (category_id) {
         case 1: catTag = "#면접준비"; break;
         case 2: catTag = "#운영체제"; break;
         case 3: catTag = "#데이터베이스"; break;
         case 4: catTag = "#네트워크"; break;
         case 5: catTag = "#자료구조"; break;
         case 6: catTag = "#알고리즘"; break;
         case 7: catTag = "#자격증"; break;
         default: catTag = "";
        }
        return langTag + " " + catTag;
    }
    
  	/* spark 유형 이름 표출 */
    public String getFormattedMatchTypeFirst() {
        String matchType1 = getMatchTypeName(match_type_first);
        return matchType1;
    }
    public String getFormattedMatchTypeSecond() {
        String matchType2 = getMatchTypeName(match_type_second);
        return matchType2;
    }
    public String getFormattedMatchTypeThird() {
        String matchType3 = getMatchTypeName(match_type_third);
        return matchType3;
    }
    
	public String getMatchTypeName(Integer typeId) {
		if (typeId == null) return "선택 안함";
		switch (typeId) {
		  case 1: return "코드폭탄 해피빈";
		  case 2: return "혼코딩 슬로우곰";
		  case 3: return "아이디어 요정 깃요미";
		  case 4: return "계획왕 컴정이";
		  case 5: return "느긋한 타닥냥";
		  case 6: return "목표러 코취지";
		  default: return "수정 필요";
	      }
	  } 
}