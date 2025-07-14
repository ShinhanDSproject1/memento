package com.shinhan.memento.dto.mypage;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MypageMatchupListDTO {
	private List<MyMatchupListResponseDTO> myMatchupList;
	private List<MyMatchupCreateListResponseDTO> mymatchupCreateList;
}
