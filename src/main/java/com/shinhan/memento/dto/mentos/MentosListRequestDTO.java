package com.shinhan.memento.dto.mentos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MentosListRequestDTO {

	private String sortId;
	private String area;
	private String spark;
	private String day;
	private String time;
	private String category;
	private String lang;
	private String page;
	private Integer startRow;
	private Integer endRow;
}
