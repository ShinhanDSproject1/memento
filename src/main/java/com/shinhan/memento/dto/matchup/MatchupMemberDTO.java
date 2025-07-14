package com.shinhan.memento.dto.matchup;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class MatchupMemberDTO {
    private Integer memberId;
    private String nickname;
    private String profileImageUrl;
}