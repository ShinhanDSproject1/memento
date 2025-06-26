package com.shinhan.memento.common.exception;

import com.shinhan.memento.common.response.status.ResponseStatus;

import lombok.Getter;

@Getter
public class MypageException extends RuntimeException{

    private final ResponseStatus exceptionStatus;

    public MypageException(ResponseStatus exceptionStatus) {
        super(exceptionStatus.getMessage());
        this.exceptionStatus = exceptionStatus;
    }

    public MypageException(ResponseStatus exceptionStatus, String message) {
        super(message);
        this.exceptionStatus = exceptionStatus;
    }

}
