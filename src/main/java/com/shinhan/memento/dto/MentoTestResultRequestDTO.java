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
public class MentoTestResultRequestDTO {
		private Boolean isAutoSubmit;
		private List<MentoTestAnswerDTO> answers;
}
