package com.shinhan.memento.dto.mentos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GetMentosDTO {
	
	private int mentosId;
	private long daysBetween; // d-2 여기에 들어가는 값
	private String remainMemberCnt; // 이거 그냥 그대로 프론트로 뿌리기
	private String mentosImg;
	private String title;
	private String subTitle; // 소개글
	private String categoryName; // 백엔드, 알고리즘 이런거
	private String languageName; // 언어
	private String mentoName;
	private String mentoType;
	private String startDay;
	private String endDay;
	private String startTime;
	private String endTime;
	private String location; // regionGroup 그냥 보여주기
	private int price;
	private boolean isFavorite; // 찜 눌렀는지 아닌지 
}
