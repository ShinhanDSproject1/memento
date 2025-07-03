package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class PopularLanguageDTO {
	// id 값 수정 완료
    private String languageName;
    private int totalCount;
    
}
