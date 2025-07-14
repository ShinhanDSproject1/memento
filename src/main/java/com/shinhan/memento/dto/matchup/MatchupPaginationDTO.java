package com.shinhan.memento.dto.matchup;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MatchupPaginationDTO {
    private int page;          
    private int recordSize;    
    private int pageSize;      
    private String keyword;    
    private String searchType; 
    
    /* 필터링 파라미터 */
    private String regionGroup;
    private Integer categoryId;
    private String selectedDays;
    private Integer languageId;
    
    public MatchupPaginationDTO() {
        this.page = 1;
        this.recordSize = 6; 
        this.pageSize = 10;
    }

    public int getOffset() {
        return (page - 1) * recordSize;
    }
}