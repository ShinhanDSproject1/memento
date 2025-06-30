package com.shinhan.memento.model;

import java.sql.Date;

import com.shinhan.memento.model.BaseStatus;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Review {
	private int reviewId;
	private int mentiId;
	private int mentoId;
	private int mentosId;
	private String reviewImg;
	private Double score;
	private String reviewComment;
	private Date createdAt;
	private Date updatedAt;
	private BaseStatus status;
}
