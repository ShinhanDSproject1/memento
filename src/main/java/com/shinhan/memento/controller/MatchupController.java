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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchTypeDTO;
import com.shinhan.memento.dto.MatchupApplyMentoDTO;
import com.shinhan.memento.dto.MatchupCreateDTO;
import com.shinhan.memento.dto.MatchupDetailDTO;
import com.shinhan.memento.dto.MatchupListDTO;
import com.shinhan.memento.dto.MatchupUpdateDTO;
import com.shinhan.memento.dto.MatchupWaitingMentoDTO;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.service.MatchupService;

@Controller
@RequestMapping("/matchup")
public class MatchupController {
   
   @Autowired
   MatchupService matchupService;
   
   /* 요청중인 멘토 리스트 JSON 반환 API */
   @GetMapping("/getWaitingMentoList")
   @ResponseBody
   public BaseResponse<List<MatchupWaitingMentoDTO>> getPendingMentos(@RequestParam int matchupId) {
       try {
           List<MatchupWaitingMentoDTO> mentoList = matchupService.getWaitingMentoList(matchupId);
           return new BaseResponse<>(mentoList);
       } catch (Exception e) {
           e.printStackTrace();
           // BaseResponse는 직접 만드신 공통 응답 객체이므로, 실패 시 생성자에 맞게 수정해주세요.
           return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, null);
       }
   }
   
   /* 특정 매치업에 멘토로 신청하기 */
   @PostMapping("/applyMentoMatchup")
   @ResponseBody
   public BaseResponse<String> applyMentoMatchup(@RequestBody MatchupApplyMentoDTO dto) {
       System.out.println("Received DTO via JSON: " + dto);
       try {
           int result = matchupService.applyMentoMatchup(dto);
           
           // [수정] Service의 반환값에 따른 분기 처리
           if (result > 0) {
               return new BaseResponse<>(BaseExceptionResponseStatus.SUCCESS, "멘토 신청을 성공적으로 완료했습니다.");
           } else if (result == -1) { // 멘토 권한이 없는 경우
               return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "멘토만 신청할 수 있는 기능입니다.");
           } else { // 그 외 데이터베이스 insert 실패 등
               return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "멘토 신청에 실패했습니다. 다시 시도해주세요.");
           }
       } catch (Exception e) {
           e.printStackTrace();
           return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "서버 오류로 신청에 실패했습니다.");
       }
   }
   
   /* 매치업 삭제하기 - UPDATE STATUS = INACTIVE */
   @PostMapping("/deleteMatchup")
   @ResponseBody
   public BaseResponse<String> deleteMatchup(@RequestParam("matchupId") int matchupId,
                                             @RequestParam("leaderId") int leaderId) {
       try {
           int result = matchupService.inactivateMatchup(matchupId, leaderId);

           if (result > 0) {
               return new BaseResponse<>(BaseExceptionResponseStatus.SUCCESS, result + "건이 비활성화되었습니다.");
           } else {
               return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, null);
           }
       } catch (Exception e) {
           e.printStackTrace();
           return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, null);
       }
   }
   
   /* 매치업 수정 페이지 이동 */
   @GetMapping("/updateMatchup")
   public String matchupUpdatePage(@RequestParam int id, Model model, HttpSession session) {
	 Integer loginMemberId = (Integer) session.getAttribute("loginMemberId");
		  
	 MatchupDetailDTO matchupDetail = matchupService.getMatchupDetail(id, loginMemberId);
      
     System.out.println("### 최종 DTO 확인 (JSP로 전달 직전): " + matchupDetail); 
      
     model.addAttribute("matchupDetail", matchupDetail);
      
     List<LanguageDTO> languages = matchupService.getAllLanguages();
     List<CategoryDTO> categories = matchupService.getAllCategories();
     List<MatchTypeDTO> matchTypes = matchupService.getAllMatchTypes();
         
     model.addAttribute("languages", languages);
     model.addAttribute("categories", categories);
     model.addAttribute("matchTypes", matchTypes); 

      return "/matchup/updateMatchup"; 
   }
   
   /* 매치업 수정하기 */
   @PostMapping("/updateMatchup")
   @ResponseBody
   public BaseResponse<String> updateMatchup(@RequestBody MatchupUpdateDTO dto) {
       try {
           int result = matchupService.updateMatchup(dto);
           if (result > 0) {
               return new BaseResponse<>(BaseExceptionResponseStatus.SUCCESS, "매치업 정보가 성공적으로 수정되었습니다.");
           } else {
               return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "매치업 수정에 실패했습니다.");
           }
       } catch (Exception e) {
           e.printStackTrace();
           return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "서버 오류로 수정에 실패했습니다.");
       }
   }
   
   /* 매치업 신규 작성 페이지 이동 */
   @GetMapping("/createMatchup")
   public String createMatchupForm(Model model) {
     List<LanguageDTO> languages = matchupService.getAllLanguages();
     List<CategoryDTO> categories = matchupService.getAllCategories();
     List<MatchTypeDTO> matchTypes = matchupService.getAllMatchTypes();
         
     model.addAttribute("languages", languages);
     model.addAttribute("categories", categories);
     model.addAttribute("matchTypes", matchTypes); 
      
     return "/matchup/createMatchup";
   }
   
   /* 매치업 신규 작성하기 */
   @PostMapping("/postCreateMatchup")
   @ResponseBody
   public BaseResponse<String> createMatchup(@RequestBody MatchupCreateDTO dto) {
       System.out.println("Received DTO via JSON: " + dto);
       try {
           int result = matchupService.createMatchup(dto);
           if (result > 0) {
               return new BaseResponse<>(BaseExceptionResponseStatus.SUCCESS, "매치업이 성공적으로 생성되었습니다.");
           } else {
               return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "매치업 생성에 실패했습니다.");
           }
       } catch (Exception e) {
           e.printStackTrace();
           return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "서버 오류로 생성에 실패했습니다.");
       }
   }
   
   /* 매치업 조회페이지 이동 */
   @GetMapping("/matchupList")
   public String matchupListPage(Model model) {
      List<MatchupListDTO> matchups = matchupService.getMatchupList(new HashMap<>());
      model.addAttribute("matchupList", matchups);
      
      List<String> regionGroups = matchupService.getDistinctRegionGroups();
      List<CategoryDTO> categories = matchupService.getAllCategories();
      List<LanguageDTO> languages = matchupService.getAllLanguages();
      
      model.addAttribute("regionGroups", regionGroups);
      model.addAttribute("categories", categories);
      model.addAttribute("languages", languages);
      
      return "/matchup/matchupList";
   }
   
   /* 매치업 카테고리별 조회 */
   @ResponseBody
   @GetMapping("/getMatchupList")
   public BaseResponse<List<MatchupListDTO>> getMatchupList(
         @RequestParam(required = false) String regionGroup,
         @RequestParam(required = false) Integer categoryId,
         @RequestParam(required = false) String selectedDays,
         @RequestParam(required = false) Integer languageId) {
      
      Map<String, Object> filters = new HashMap<>();
      filters.put("regionGroup", regionGroup);
      filters.put("categoryId", categoryId);
      filters.put("selectedDays", selectedDays);
      filters.put("languageId", languageId);
      
      List<MatchupListDTO> matchups = matchupService.getMatchupList(filters); 
      
      if (matchups == null) {
         return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, null); /* 매치업은 에러 처리가 없어서 임시 처리 */
      }
      return new BaseResponse<>(matchups);
   }
   
   /* 매치업 상세 조회 페이지 이동 */
   @GetMapping("/matchupDetail")
   public String matchupDetailPage(@RequestParam(required = false) Integer id, Model model, HttpSession session) {
	   
	   if (id == null) {
          return "redirect:/matchup/matchupList";
      }
      
	  Member loginUser = (Member) session.getAttribute("loginUser");
	  Integer loginMemberId = null;
	  if (loginUser != null) {
	      loginMemberId = loginUser.getMemberId();
	  }
      
      MatchupDetailDTO matchupDetail = matchupService.getMatchupDetail(id, loginMemberId);
      System.out.println("### Service에서 가져온 DTO: " + matchupDetail); 
      
      model.addAttribute("matchupDetail", matchupDetail);
      
      /* 방장을 위한 상세 조회 페이지 이동 */
      if (matchupDetail.getLeaderId() == loginMemberId) {
         return "/matchup/matchupDetailLeader";
      }
       return "/matchup/matchupDetail";
   }
   
   @GetMapping("/getMatchupDetail")
   @ResponseBody
   public BaseResponse<MatchupDetailDTO> getMatchupDetail(@RequestParam int id, HttpSession session) {
	  
	  Integer loginMemberId = (Integer) session.getAttribute("loginMemberId");
	  
      MatchupDetailDTO matchupDetail = matchupService.getMatchupDetail(id, loginMemberId);
      if (matchupDetail == null) {
         return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, null); /* 매치업은 에러 처리가 없어서 임시 처리 */
      }
      return new BaseResponse<>(matchupDetail);
   }
}