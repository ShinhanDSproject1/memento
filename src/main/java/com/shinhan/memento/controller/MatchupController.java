package com.shinhan.memento.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shinhan.memento.common.response.BaseErrorResponse;
import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.MatchUpDTO;
import com.shinhan.memento.dto.MatchupDetailDTO;
import com.shinhan.memento.dto.MatchupListDTO;
import com.shinhan.memento.service.MatchupService;

@Controller
@RequestMapping("/matchup")
public class MatchupController {
   
   @Autowired
   MatchupService matchupService;
   
   @GetMapping("/matchupDetailLeader")
   public String f2() {
      return "/matchup/matchupDetailLeader";
   }
   
   @GetMapping("/updateMatchup")
   public String f4() {
      return "/matchup/updateMatchup";
   }
   
   @GetMapping("/createMatchup")
   public String createMatchupForm() {
      return "/matchup/createMatchup";
   }
   
   /* 매치업 작성하기 */
   @PostMapping("/postCreateMatchup")
   @ResponseBody
   public BaseResponse<MatchUpDTO> createMatchup(@RequestBody MatchUpDTO matchup) {
	  System.out.println("Received DTO via JSON: " + matchup);
      return new BaseResponse<>(matchup);
   }
   
	/* 매치업 조회페이지 이동 */
   @GetMapping("/matchupList")
   public String matchupListPage(Model model) {
      List<MatchupListDTO> matchups = matchupService.getMatchupList(new HashMap<>());
       model.addAttribute("matchupList", matchups);
      return "/matchup/matchupList";
   }
   
   /* 매치업 카테고리별 조회 */
   @ResponseBody
   @GetMapping("/getMatchupList")
   public BaseResponse<List<MatchupListDTO>> getMatchupList(
         @RequestParam(required = false) String region_group,
         @RequestParam(required = false) Integer category_id,
         @RequestParam(required = false) String selected_days,
         @RequestParam(required = false) Integer language_id) {
      
      Map<String, Object> filters = new HashMap<>();
      filters.put("region_group", region_group);
      filters.put("category_id", category_id);
      filters.put("selected_days", selected_days);
      filters.put("language_id", language_id);
      
      List<MatchupListDTO> matchups = matchupService.getMatchupList(filters); 
      
      if (matchups == null) {
    	  return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, null); /* 매치업은 에러 처리가 없어서 임시 처리 */
      }
      return new BaseResponse<>(matchups);
   }
   
   /* 매치업 상세 조회 페이지 이동 */
   @GetMapping("/matchupDetail")
   public String matchupDetailPage(@RequestParam(required = false) Integer id, Model model) {
	   if (id == null) {
		    return "redirect:/matchup/matchupList";
	   }
	   MatchupDetailDTO matchupDetail = matchupService.getMatchupDetail(id);
	   model.addAttribute("matchupDetail", matchupDetail);
       return "/matchup/matchupDetail";
   }
   
   @GetMapping("/getMatchupDetail")
   @ResponseBody
   public BaseResponse<MatchupDetailDTO> getMatchupDetail(@RequestParam int id) {
	   MatchupDetailDTO matchupDetail = matchupService.getMatchupDetail(id);
	   if (matchupDetail == null) {
		   return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, null); /* 매치업은 에러 처리가 없어서 임시 처리 */
	   }
	   return new BaseResponse<>(matchupDetail);
   }
}