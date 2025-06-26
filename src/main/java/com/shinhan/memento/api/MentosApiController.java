package com.shinhan.memento.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.dto.mentos.MentosListRequestDTO;
import com.shinhan.memento.dto.mentos.MentosListResponseDTO;
import com.shinhan.memento.service.MentosService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/api/mentos")
public class MentosApiController {
	
	private final MentosService mentosService;
	
    @GetMapping("/list")
    public BaseResponse<MentosListResponseDTO> getMentosList(@ModelAttribute MentosListRequestDTO reqDTO) {
    	MentosListResponseDTO resDTO = mentosService.getMentos(reqDTO);
        return new BaseResponse<>(resDTO);
    }
}
