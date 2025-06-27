package com.shinhan.memento.common.exception;

import com.shinhan.memento.common.response.status.ResponseStatus;

import lombok.Getter;

@Getter
public class MentosException extends RuntimeException{

    private final ResponseStatus exceptionStatus;

    public MentosException(ResponseStatus exceptionStatus) {
        super(exceptionStatus.getMessage());
        this.exceptionStatus = exceptionStatus;
    }

    public MentosException(ResponseStatus exceptionStatus, String message) {
        super(message);
        this.exceptionStatus = exceptionStatus;
    }

}
