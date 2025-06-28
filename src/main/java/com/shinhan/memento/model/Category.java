package com.shinhan.memento.model;

import com.shinhan.memento.model.BaseStatus;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Category {
	private int categoryId;
	private String categoryName;
	private BaseStatus status;
}
