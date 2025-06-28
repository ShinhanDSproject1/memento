package com.shinhan.memento.common.exception_handler;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.shinhan.memento.common.exception.MypageException;
import com.shinhan.memento.common.response.BaseErrorResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestControllerAdvice
public class MypageExceptionControllerAdvice {
	@ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MypageException.class)
    public BaseErrorResponse handle_MypageException(MypageException e) {
        log.error("[handle_MypageException]", e);
        return new BaseErrorResponse(e.getExceptionStatus(), e.getMessage());
    }
}
