package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MatchTypeDTO {
	Integer match_type_id;
	String match_type_name;
	String match_type_info;
}
