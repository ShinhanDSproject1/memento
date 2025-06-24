package com.shinhan.memento.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shinhan.memento.dto.KeepgoingDTO;

@Controller
@RequestMapping("/keepgoing")
public class KeepgoingController {
	
	@GetMapping("keepgoinginsert.do")
	public String keepgoingInsert(){
		return "keepgoing/keepgoing-insert";
	}
	
	@GetMapping("keepgoinglist.do")
	public String keepgoingList(){
		return "keepgoing/keepgoing-list";
	}
	
	@GetMapping("keepgoingupdate.do")
	public String keepgoingUpdate(){
		return "keepgoing/keepgoing-update";
	}
	
	@GetMapping("keepgoingdetail.do")
	public String keepgoingDetail(){
		return "keepgoing/keepgoing-detail";
	}
	
	@GetMapping("keepgoingmember.do")
	public String keepgoingMember(){
		return "keepgoing/keepgoing-member";
	}
	
	@PostMapping("keepgoinginsert.do")
    @ResponseBody // 이 메서드의 반환 값이 HTTP 응답 본문으로 직접 전송됨 (뷰 이름이 아님)
    public String insertKeepgoing(@RequestBody KeepgoingDTO data) {

        System.out.println("----- AJAX JSON 데이터 수신 -----");
        System.out.println("킵고잉 이름: " + data.getKeepgoingName());
        System.out.println("도시: " + data.getLocation());
        System.out.println("지역: " + data.getRegion());
        System.out.println("선택된 요일: " + data.getSelectedDays());
        System.out.println("활동 시작 시간: " + data.getActivityStartTime());
        System.out.println("활동 종료 시간: " + data.getActivityEndTime());
        System.out.println("선호 유형: " + data.getStudyType());
        System.out.println("도로명 주소: " + data.getDetailLocation());
        System.out.println("소개글 (SmartEditor): " + data.getEditorTxt());
        System.out.println("카테고리: " + data.getCategory());
        System.out.println("언어: " + data.getLanguage());
        System.out.println("가격: " + data.getPrice()); // Integer 타입이므로 null 체크 필요할 수 있음
        System.out.println("---------------------------------");
       
        System.out.println("-----------------------------------------");
        // 성공 응답 반환
        return "success";
        // 또는
        // return ResponseEntity.ok("데이터가 성공적으로 수신되었습니다!"); // 단순 문자열 응답
    }
}
