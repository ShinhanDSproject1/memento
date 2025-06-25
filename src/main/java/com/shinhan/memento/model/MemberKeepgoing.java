package com.shinhan.memento.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
public class MemberKeepgoing {
	int member_keepgoing_id;
	int member_id;
	int keepgoing_id;
	Date created_at;
	Date updated_at;
	BaseStatus status;
}
