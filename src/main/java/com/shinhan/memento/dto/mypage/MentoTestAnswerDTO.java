package com.shinhan.memento.dto.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MentoTestAnswerDTO {
	private int problemId;
	private int answerIndex;
}
