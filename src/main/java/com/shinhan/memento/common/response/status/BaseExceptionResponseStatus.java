package com.shinhan.memento.common.response.status;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;

@RequiredArgsConstructor
public enum BaseExceptionResponseStatus implements ResponseStatus {

	/**
	 * 1000: 요청 성공 (OK)
	 */
	SUCCESS(1000, HttpStatus.OK.value(), "요청에 성공하였습니다."), FAILURE(2000, HttpStatus.BAD_REQUEST.value(), "요청에 실패하였습니다."),

	/**
	 * 3000 : member 관련
	 */

	CANNOT_FOUND_MEMBER(3000, HttpStatus.BAD_REQUEST.value(), "해당 유저를 찾을 수 없습니다."),
	CANNOT_FOUND_MENTO(3001, HttpStatus.BAD_REQUEST.value(), "해당 멘토유저를 찾을 수 없습니다."),

	/**
	 * 4000 : mentos 관련
	 */
	CANNOT_CREATE_MENTOS(4000, HttpStatus.BAD_REQUEST.value(), "멘토스를 개설할 수 없습니다. "),
	CANNOT_EDIT_MENTOS(4001, HttpStatus.BAD_REQUEST.value(), "멘토스를 수정할 수 없습니다. "),
	CANNOT_DElETE_MENTOS(4002, HttpStatus.BAD_REQUEST.value(), "멘토스를 삭제할 수 없습니다. "),
	CANNOT_JOIN_MENTOS(4003, HttpStatus.BAD_REQUEST.value(), "멘토스 참여에 실패했습니다."),
	CANNOT_FOUND_MENTOS(4004, HttpStatus.BAD_REQUEST.value(), "해당 멘토스를 찾을 수 없습니다."),
	CANNOT_UPDATE_MENTOS(4005, HttpStatus.BAD_REQUEST.value(), "멘토스를 업데이트할 수 없습니다."),
	/**
	 * 5000 : keepgoing 관련
	 */

	/**
	 * 6000 : mypage 관련
	 */
	NEED_LOGIN(6000, HttpStatus.UNAUTHORIZED.value(), "로그인이 필요합니다."),
	CANNOT_INSERT_MENTOTEST_HISTORY(6001, HttpStatus.BAD_REQUEST.value(), "멘토테스트 기록 실패"),
	CANNOT_UPDATE_MEMBER_USERTYPE(6002, HttpStatus.BAD_REQUEST.value(), "멤버 유저타입 업데이트 실패"),
	CANNOT_FOUND_TIMESTAMP_OBJECT(6003, HttpStatus.BAD_REQUEST.value(), "TIMESTAMP OBJECT를 찾을 수 없습니다."),
	CANNOT_SWITCH_TIMESTAMP_OBJECT_LENGTH_ERROR(6004, HttpStatus.BAD_REQUEST.value(), "TIMESTAMP OBJECT를 시간으로 변환하기에는 길이가 짧습니다."),
	CANNOT_FOUND_HASMENTO_OBJECT(6005, HttpStatus.BAD_REQUEST.value(), "HASMENTO OBJECT를 찾을 수 없습니다."),
	/**
	 * 7000 : 결제 관련?
	 */
	CANNOT_UPDATE_PAYMENT_STATUS_BY_REFUND(7001, HttpStatus.BAD_REQUEST.value(), "결제 상태 업데이트 실패"),

	/**
	 * 8000 : member_mentos 관련
	 */
	CANNOT_FOUND_MEMBER_MENTOS(8000, HttpStatus.BAD_REQUEST.value(), "해당 멘토스 참여기록을 찾을 수 없습니다."),
	CANNOT_CANCEL_MEMBER_MENTOS(8001, HttpStatus.BAD_REQUEST.value(), "멘토스 참여취소에 실패했습니다.");

	private final int code;
	private final int status;
	private final String message;

	@Override
	public int getCode() {
		return code;
	}

	@Override
	public int getStatus() {
		return status;
	}

	@Override
	public String getMessage() {
		return message;
	}
}
