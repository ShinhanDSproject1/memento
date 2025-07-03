package com.shinhan.memento.dto.mentoDetail;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class MentoDetailHomeDTO {
	private String introduceComment;
	private List<MentoDetailClassDTO> inProgressMentos; 
}
