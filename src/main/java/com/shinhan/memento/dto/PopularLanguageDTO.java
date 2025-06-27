package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class PopularLanguageDTO {
    private String languageName;
    private int totalCount;

    
}
