package com.shinhan.memento.common.exception_handler;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.shinhan.memento.common.exception.KeepgoingException;
import com.shinhan.memento.common.response.BaseErrorResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestControllerAdvice
public class KeepgoingExceptionControllerAdvice {
	@ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(KeepgoingException.class)
    public BaseErrorResponse handle_KeepgoingException(KeepgoingException e) {
        log.error("[handle_KeepgoingException]", e);
        return new BaseErrorResponse(e.getExceptionStatus(), e.getMessage());
    }
}
