package com.shinhan.memento.dto;

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
	Integer review_id;
	Integer menti_id;
	Integer mento_id;
	Integer mentos_id;
	String review_img;
	Double score;
	String comment;
	Date created_at;
	Date updated_at;
	String status;
	String nickname;
	
}