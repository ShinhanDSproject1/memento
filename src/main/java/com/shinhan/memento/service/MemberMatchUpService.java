package com.shinhan.memento.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dao.MemberMatchUpDAO;
import com.shinhan.memento.dto.MyMatchupListDTO;

@Service
public class MemberMatchUpService {
	@Autowired
	MemberMatchUpDAO memberMatchUpDAO;
	
	public List<MyMatchupListDTO> selectJoinListByMemberId(Integer memberid){
		// --- 가짜 데이터 생성 시작 ---
        List<MyMatchupListDTO> fakeList = new ArrayList<>();
        LocalDateTime now = LocalDateTime.now(); // 시간 기준

        if (memberid.equals(1)) {
            // ===============================================
            // 사용자 ID 1번을 위한 더미 데이터 3개
            // ===============================================
            fakeList.add(MyMatchupListDTO.builder()
                    .matchup_id(101)
                    .leader_img("https://placehold.co/100x100/E8D2A6/333333?text=Leader1")
                    .matchup_title("스프링부트 기반 MSA 프로젝트")
                    .region_subgroup("강남구")
                    .category("백엔드")
                    .language("Java")
                    .start_time(Timestamp.valueOf(now.withHour(19).withMinute(0)))
                    .end_time(Timestamp.valueOf(now.withHour(21).withMinute(0)))
                    .selected_days("MON,THU")
                    .has_mento(true)
                    .mento_nickname("김멘토")
                    .count(6)
                    .matchup_count(4)
                    .role("팀장")
                    .status("ACTIVE")
                    .build());

            fakeList.add(MyMatchupListDTO.builder()
                    .matchup_id(102)
                    .leader_img("https://placehold.co/100x100/A6B1E8/333333?text=Leader2")
                    .matchup_title("코딩테스트 대비 알고리즘 문제풀이")
                    .region_subgroup("온라인")
                    .category("알고리즘")
                    .language("Python")
                    .start_time(Timestamp.valueOf(now.withHour(20).withMinute(0)))
                    .end_time(Timestamp.valueOf(now.withHour(22).withMinute(0)))
                    .selected_days("TUE")
                    .has_mento(false)
                    .mento_nickname(null)
                    .count(8)
                    .matchup_count(8)
                    .role("팀원")
                    .status("ACTIVE")
                    .build());

            fakeList.add(MyMatchupListDTO.builder()
                    .matchup_id(103)
                    .leader_img("https://placehold.co/100x100/E8A6A6/333333?text=Leader3")
                    .matchup_title("반려동물 산책 앱 개발")
                    .region_subgroup("마포구")
                    .category("앱개발")
                    .language("Kotlin")
                    .start_time(Timestamp.valueOf(now.minusMonths(2)))
                    .end_time(Timestamp.valueOf(now.minusMonths(1)))
                    .selected_days("SAT")
                    .has_mento(false)
                    .mento_nickname(null)
                    .count(4)
                    .matchup_count(4)
                    .role("팀원")
                    .status("COMPLETED")
                    .build());

        } else if (memberid.equals(2)) {
            // ===============================================
            // 사용자 ID 2번을 위한 더미 데이터 3개
            // ===============================================
            fakeList.add(MyMatchupListDTO.builder()
                    .matchup_id(201)
                    .leader_img("https://placehold.co/100x100/A6E8B7/333333?text=Leader4")
                    .matchup_title("포트폴리오용 웹사이트 만들기")
                    .region_subgroup("온라인")
                    .category("프론트엔드")
                    .language("React")
                    .start_time(Timestamp.valueOf(now.withHour(15).withMinute(0)))
                    .end_time(Timestamp.valueOf(now.withHour(18).withMinute(0)))
                    .selected_days("WEEKEND")
                    .has_mento(true)
                    .mento_nickname("이멘토")
                    .count(5)
                    .matchup_count(3)
                    .role("팀원")
                    .status("ACTIVE")
                    .build());

            fakeList.add(MyMatchupListDTO.builder()
                    .matchup_id(202)
                    .leader_img("https://placehold.co/100x100/D9A6E8/333333?text=Leader5")
                    .matchup_title("SQL 튜닝 및 데이터베이스 설계")
                    .region_subgroup("서초구")
                    .category("데이터베이스")
                    .language("SQL")
                    .start_time(Timestamp.valueOf(now.withHour(19).withMinute(30)))
                    .end_time(Timestamp.valueOf(now.withHour(21).withMinute(0)))
                    .selected_days("WED")
                    .has_mento(false)
                    .mento_nickname(null)
                    .count(7)
                    .matchup_count(5)
                    .role("팀원")
                    .status("ACTIVE")
                    .build());

            fakeList.add(MyMatchupListDTO.builder()
                    .matchup_id(203)
                    .leader_img("https://placehold.co/100x100/E8E0A6/333333?text=Leader6")
                    .matchup_title("NestJS로 만드는 백엔드 API")
                    .region_subgroup("온라인")
                    .category("백엔드")
                    .language("TypeScript")
                    .start_time(Timestamp.valueOf(now.plusWeeks(1)))
                    .end_time(Timestamp.valueOf(now.plusWeeks(1).withHour(22)))
                    .selected_days("TUE,FRI")
                    .has_mento(false)
                    .mento_nickname(null)
                    .count(5)
                    .matchup_count(1)
                    .role("팀원")
                    .status("RECRUITING")
                    .build());
        }
        return fakeList; // DB 구축 후 밑에 코드로 변경
		
		//return memberMatchUpDAO.selectJoinListByMemberId(memberid);
	}
}
