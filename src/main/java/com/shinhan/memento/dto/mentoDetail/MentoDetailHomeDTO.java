package com.shinhan.memento.dto.mentoDetail;

import java.util.List;

import com.shinhan.memento.dto.mentos.GetMentosDTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class MentoDetailHomeDTO {
	private String introduceComment;
	private List<GetMentosDTO> inProgressMentos; 
}
