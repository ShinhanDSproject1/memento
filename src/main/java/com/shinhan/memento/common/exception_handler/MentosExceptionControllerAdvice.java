package com.shinhan.memento.common.exception_handler;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.shinhan.memento.common.exception.MentosException;
import com.shinhan.memento.common.response.BaseErrorResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestControllerAdvice
public class MentosExceptionControllerAdvice {
	@ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MentosException.class)
    public BaseErrorResponse handle_MentosException(MentosException e) {
        log.error("[handle_MentosException]", e);
        return new BaseErrorResponse(e.getExceptionStatus(), e.getMessage());
    }
}
