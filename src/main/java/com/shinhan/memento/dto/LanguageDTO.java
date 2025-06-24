package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LanguageDTO {
	Integer language_id;
	String language_name;
	String status;
}
