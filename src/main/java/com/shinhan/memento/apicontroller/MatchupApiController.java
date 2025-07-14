package com.shinhan.memento.apicontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.matchup.MatchupApplyMentiDTO;
import com.shinhan.memento.dto.matchup.MatchupApplyMentoDTO;
import com.shinhan.memento.dto.matchup.MatchupApproveMentoDTO;
import com.shinhan.memento.dto.matchup.MatchupCreateDTO;
import com.shinhan.memento.dto.matchup.MatchupDetailDTO;
import com.shinhan.memento.dto.matchup.MatchupListDTO;
import com.shinhan.memento.dto.matchup.MatchupMemberDTO;
import com.shinhan.memento.dto.matchup.MatchupPaginationDTO;
import com.shinhan.memento.dto.matchup.MatchupPagingResponseDTO;
import com.shinhan.memento.dto.matchup.MatchupUpdateDTO;
import com.shinhan.memento.dto.matchup.MatchupWaitingMentoDTO;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.service.MatchupService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/matchup")
public class MatchupApiController {

	@Autowired
	MatchupService matchupService;

	/* 특정 매치업의 팀원 리스트를 JSON으로 반환 */
	@GetMapping("/getMembers")
	@ResponseBody
	public BaseResponse<List<MatchupMemberDTO>> getMatchupMemberList(@RequestParam int matchupId) {
		try {
			List<MatchupMemberDTO> memberList = matchupService.getMatchupMembers(matchupId);
			return new BaseResponse<>(memberList);
		} catch (Exception e) {
			e.printStackTrace();
			return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, null);
		}
	}

	/* 특정 매치업에 멘티로 신청하기 */
	@PostMapping("/applyMentiMatchup")
	@ResponseBody
	public BaseResponse<?> applyMentiMatchup(@RequestBody MatchupApplyMentiDTO dto, HttpSession session) {
		try {
			Member loginUser = (Member) session.getAttribute("loginUser");
			if (loginUser == null) {
				return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "로그인이 필요합니다.");
			}
			dto.setMemberId(loginUser.getMemberId());

			Map<String, Object> serviceResult = matchupService.applyForMatchupAsMenti(dto);
			int resultCode = (int) serviceResult.get("resultCode");

			switch (resultCode) {
			case 1:
				Map<String, Object> responseData = new HashMap<>();
				responseData.put("message", "매치업 참여 신청이 완료되었습니다.");
				responseData.put("newMemberCount", serviceResult.get("newMemberCount"));
				return new BaseResponse<>(responseData); // 성공 응답에 데이터 포함
			case -1:
				return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "모집 인원이 모두 찼습니다.");
			case -2:
				return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "이미 신청한 매치업입니다.");
			case -3:
				return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "존재하지 않는 매치업입니다.");
			default:
				return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "신청에 실패했습니다. 다시 시도해주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "서버 오류로 신청에 실패했습니다.");
		}
	}

	/* 멘토 승인 요청 처리 API */
	@PostMapping("/approveMento")
	@ResponseBody
	public BaseResponse<MatchupWaitingMentoDTO> approveMento(@RequestBody MatchupApproveMentoDTO dto) {
		try {
			MatchupWaitingMentoDTO approvedMento = matchupService.approveMento(dto.getMatchupId(), dto.getMemberId());
			return new BaseResponse<>(approvedMento);
		} catch (Exception e) {
			e.printStackTrace();
			return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, null);
		}
	}

	/* 요청중인 멘토 리스트 JSON 반환 API */
	@GetMapping("/getWaitingMentoList")
	@ResponseBody
	public BaseResponse<List<MatchupWaitingMentoDTO>> getPendingMentos(@RequestParam int matchupId) {
		try {
			List<MatchupWaitingMentoDTO> mentoList = matchupService.getWaitingMentoList(matchupId);
			return new BaseResponse<>(mentoList);
		} catch (Exception e) {
			e.printStackTrace();
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

			if (result > 0) {
				return new BaseResponse<>(BaseExceptionResponseStatus.SUCCESS, "멘토 신청을 성공적으로 완료했습니다.");
			} else if (result == -1) {
				return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "멘토만 신청할 수 있는 기능입니다.");
			} else {
				return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "멘토 신청에 실패했습니다. 다시 시도해주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "서버 오류로 신청에 실패했습니다.");
		}
	}

	/* 매치업 삭제하기 - UPDATE STATUS = DELETE (Patch 방식) */
	@PatchMapping("/deleteMatchup")
	@ResponseBody
	public BaseResponse<String> deleteMatchup(@RequestBody Map<String, Object> params) {
		try {
			int matchupId = Integer.parseInt(params.get("matchupId").toString());
			int leaderId = Integer.parseInt(params.get("leaderId").toString());

			int result = matchupService.deleteMatchup(matchupId, leaderId);

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

	/* 매치업 신규 작성하기 */
	@PostMapping("/postCreateMatchup")
	@ResponseBody
	public BaseResponse<String> createMatchup(@RequestBody MatchupCreateDTO dto, HttpSession session) {
		try {
			Member loginUser = (Member) session.getAttribute("loginUser");

			if (loginUser == null) {
				return new BaseResponse<>(BaseExceptionResponseStatus.FAILURE, "매치업을 생성하려면 로그인이 필요합니다.");
			}

			dto.setLeaderId(loginUser.getMemberId());

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

	/* 매치업 카테고리별 조회 */
	@ResponseBody
	@GetMapping("/getMatchupList")
	public BaseResponse<MatchupPagingResponseDTO<MatchupListDTO>> getMatchupList(MatchupPaginationDTO pagination) {

		Map<String, Object> params = new HashMap<>();
		params.put("pagination", pagination);

		MatchupPagingResponseDTO<MatchupListDTO> matchups = matchupService.getMatchupList(params);

		return new BaseResponse<>(matchups);
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
