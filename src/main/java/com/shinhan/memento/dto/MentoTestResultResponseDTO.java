package com.shinhan.memento.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MentoTestResultResponseDTO {
	
    private int score;                       		  				 // 점수
    private int totalProblems;                				 // 총 문항 수
    private int correctCount;                 				 // 맞은 문항 수
    private List<Integer> correctProblemIds;   // 맞은 문제 ID 리스트
    private boolean passed;                   			 // 합격 여부
}
