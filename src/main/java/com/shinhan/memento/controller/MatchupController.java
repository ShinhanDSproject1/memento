package com.shinhan.memento.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchTypeDTO;
import com.shinhan.memento.dto.matchup.MatchupDetailDTO;
import com.shinhan.memento.dto.matchup.MatchupListDTO;
import com.shinhan.memento.dto.matchup.MatchupPaginationDTO;
import com.shinhan.memento.dto.matchup.MatchupPagingResponseDTO;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.service.MatchupService;

@Controller
@RequestMapping("/matchup")
public class MatchupController {

	@Autowired
	MatchupService matchupService;

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

	/* 매치업 조회페이지 이동 */
	@GetMapping("/matchupList")
	public String matchupListPage(Model model) {

		Map<String, Object> params = new HashMap<>();
		params.put("pagination", new MatchupPaginationDTO());

		MatchupPagingResponseDTO<MatchupListDTO> response = matchupService.getMatchupList(params);

		model.addAttribute("matchupList", response.getList());
		model.addAttribute("paginationResult", response.getPaginationResult());

		List<String> regionGroups = matchupService.getDistinctRegionGroups();
		List<CategoryDTO> categories = matchupService.getAllCategories();
		List<LanguageDTO> languages = matchupService.getAllLanguages();

		model.addAttribute("regionGroups", regionGroups);
		model.addAttribute("categories", categories);
		model.addAttribute("languages", languages);
		System.out.println(response.getList());
		return "/matchup/matchupList";
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

		// 2. 위에서 조회한 상세 정보를 바탕으로, 비슷한 매치업 목록을 조회.
		List<MatchupListDTO> similarList = matchupService.getSimilarMatchups(matchupDetail);

		// 3. 조회된 비슷한 매치업 목록을 "similarList"라는 이름으로 모델에 추가.
		model.addAttribute("similarList", similarList);

		/* 방장을 위한 상세 조회 페이지 이동 */
		if (loginUser != null && matchupDetail.getLeaderId() == loginUser.getMemberId()) {
			return "/matchup/matchupDetailLeader";
		}

		return "/matchup/matchupDetail";
	}

}