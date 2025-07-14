package com.shinhan.memento.dto.mypage;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class MentoProblemDTO {
	private String questionText;
	private List<String> choices;
	private int problemId;
}
