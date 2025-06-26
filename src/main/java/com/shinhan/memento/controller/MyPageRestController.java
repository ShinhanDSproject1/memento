package com.shinhan.memento.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.dto.MyMatchupListResponseDTO;
import com.shinhan.memento.service.MemberMatchUpService;

@RestController
@RequestMapping("/mypage")
public class MyPageRestController {
	@Autowired
	MemberMatchUpService memberMatchUpService;
	
	@GetMapping(value="/page6/{memberId}", produces = "application/json")
	public BaseResponse<List<MyMatchupListResponseDTO>> selectJoinListByMemberId(
				@PathVariable Integer memberId
			){
		List<MyMatchupListResponseDTO> memberMatchUpList = memberMatchUpService.selectJoinListByMemberId(memberId);
		if(memberMatchUpList.size() == 0) {
			return new BaseResponse<>(null);
		}
		
		return new BaseResponse<>(memberMatchUpList);
	}
	
}
