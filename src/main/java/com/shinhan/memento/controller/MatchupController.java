package com.shinhan.memento.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.MatchupDetailDTO;
import com.shinhan.memento.dto.MatchupListDTO;
import com.shinhan.memento.dto.MemberDTO;
import com.shinhan.memento.service.MatchupService;

@Controller
@RequestMapping("/matchup")
public class MatchupController {

    @Autowired
    MatchupService matchupService;

    // 멤버 리스트
    @GetMapping("/matchupList")
    public String matchupListPage(Model model) {
        int memberId = 1; // 테스트용 고정값
        List<MatchupListDTO> matchups = matchupService.getMatchupList(new HashMap<>(), memberId);
        model.addAttribute("matchupList", matchups);
        return "/matchup/matchupList";
    }
    // 멘티용 상세 보기
    @GetMapping("/matchupDetail")
    public String matchupDetailPage(@RequestParam Integer id, Model model, HttpSession session) {
        // Integer memberId = (Integer) session.getAttribute("memberId");
        int memberId = 1; // 테스트용 하드코딩
        
        MatchupDetailDTO detail = matchupService.getMatchupDetailWithLeaderCheck(id, memberId);
        model.addAttribute("matchupDetail", detail);
        model.addAttribute("isLeader", detail.isLeader());

        boolean isApplied = matchupService.isApplied(memberId, id);
        model.addAttribute("isApplied", isApplied);

        if (detail.isLeader()) {
            return "/matchup/matchupDetailLeader";
        } else {
            return "/matchup/matchupDetail";
        }
    }

    // 방장용 상세보기
    @GetMapping("/matchupDetailLeader")
    public String matchupDetailLeaderPage(@RequestParam(required = false) Integer id, Model model
            /*, HttpSession session*/) {
        if (id == null) {
            return "redirect:/matchup/matchupList";
        }
        try {
            MatchupDetailDTO matchupDetail = matchupService.getMatchupDetail(id);

            // TODO: 로그인된 회원 ID 가져오기 예시 (주석 해제 후 사용)
            // Integer loggedInMemberId = (Integer) session.getAttribute("memberId");

            // TODO: 방장 여부 체크 로직
            // if (loggedInMemberId == null || !loggedInMemberId.equals(matchupDetail.getLeaderId())) {
            //     return "redirect:/matchup/matchupList";  // 권한 없으면 리스트로 리다이렉트
            // }

            model.addAttribute("matchupDetail", matchupDetail);
            // 멘토 리스트, 멤버 리스트 등 추가로 필요하면 model에 넣기

            return "/matchup/matchupDetailLeader";
        } catch (IllegalArgumentException e) {
            return "redirect:/matchup/matchupList";
        }
    }
    
    // 신청, 취소
    @PostMapping("/apply")
    @ResponseBody
    public BaseResponse<Map<String, Object>> applyMatchup(@RequestParam int matchupId, @RequestParam int memberId) {
        int updatedCount = matchupService.applyMatchupAndGetCount(memberId, matchupId);
        if (updatedCount == -1) {  // 이미 신청된 경우 -1 반환하도록 서비스에서 처리
            return new BaseResponse<>(BaseExceptionResponseStatus.ALREADY_EXISTS, null);
        }
        Map<String, Object> data = new HashMap<>();
        data.put("message", "신청 완료");
        data.put("updatedCount", updatedCount);
        return new BaseResponse<>(data);
    }

    @PostMapping("/cancelApplication")
    @ResponseBody
    public BaseResponse<Map<String, Object>> cancelApplication(@RequestParam int memberId, @RequestParam int matchupId) {
        int updatedCount = matchupService.cancelApplicationAndGetCount(memberId, matchupId);
        if (updatedCount == -1) {  // 취소 실패 시
            return new BaseResponse<>(BaseExceptionResponseStatus.NOT_FOUND, null);
        }
        Map<String, Object> data = new HashMap<>();
        data.put("message", "신청 취소 완료");
        data.put("updatedCount", updatedCount);
        return new BaseResponse<>(data);
    }
    // 멤버 리스트
    @GetMapping("/teamMembers")
    @ResponseBody
    public BaseResponse<List<MemberDTO>> getTeamMembers(@RequestParam int matchupId) {
        List<MemberDTO> members = matchupService.getTeamMembersByMatchupId(matchupId);
        return new BaseResponse<>(members);
    }	



}
