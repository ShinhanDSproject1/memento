package com.shinhan.memento.dto.mypage;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewDTO {
	private Integer review_id;
	private Integer menti_id;
	private Integer mento_id;
	private Integer mentos_id;
	private String review_img;
	private Double score;
	private String comment;
	private Date created_at;
	private Date updated_at;
	private String status;
	private String nickname;
	
}