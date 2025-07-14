package com.shinhan.memento.dto.mainpage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor      
@AllArgsConstructor
public class PopularMentiDTO {
	private int memberId;
    private String nickname;
    private String profileImage;
    private double score;
}
