package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class SimilarMentosDTO {
	private int mentosId;
	private String regionGroup;
	private String regionSubgroup;
	private int languageId;
}
