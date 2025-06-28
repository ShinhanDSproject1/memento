package com.shinhan.memento.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MatchType {
	private int matchTypeId; 
	private String matchTypeName; 
	private String matchTypeInfo;
	private String matchTypeImg;
}
