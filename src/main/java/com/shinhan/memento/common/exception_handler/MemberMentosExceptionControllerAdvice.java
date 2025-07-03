package com.shinhan.memento.common.exception_handler;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.shinhan.memento.common.exception.MemberMentosException;
import com.shinhan.memento.common.response.BaseErrorResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestControllerAdvice
public class MemberMentosExceptionControllerAdvice {
	@ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MemberMentosException.class)
    public BaseErrorResponse handle_MemberMentosExceptionn(MemberMentosException e) {
        log.error("[handle_MemberMentosException]", e);
        return new BaseErrorResponse(e.getExceptionStatus(), e.getMessage());
    }
}
