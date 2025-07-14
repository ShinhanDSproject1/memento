package com.shinhan.memento.dto.mypage;

import com.shinhan.memento.model.SparkTestType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SparkTestResultRequestDTO {
		private SparkTestType sparkResultType;
}
