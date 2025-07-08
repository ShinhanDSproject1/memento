package com.shinhan.memento.dto;

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
	List<MyMatchupListResponseDTO> myMatchupList;
	List<MyMatchupCreateListResponseDTO> mymatchupCreateList;
}
