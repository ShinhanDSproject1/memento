package com.shinhan.memento.dto.mypage;

import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MentoTestStartResponseDTO {
	private List<MentoProblemDTO> problems;
	private LocalDateTime startTime;
}
