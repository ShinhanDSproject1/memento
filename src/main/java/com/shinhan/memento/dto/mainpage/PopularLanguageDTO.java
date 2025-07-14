package com.shinhan.memento.dto.mainpage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class PopularLanguageDTO {
	private int languageId;
    private String languageName;
    private String languageImage;
    private int totalCount;
    
}
