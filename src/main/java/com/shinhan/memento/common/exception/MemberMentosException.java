package com.shinhan.memento.common.exception;

import com.shinhan.memento.common.response.status.ResponseStatus;

import lombok.Getter;

@Getter
public class MemberMentosException extends RuntimeException{

    private final ResponseStatus exceptionStatus;

    public MemberMentosException(ResponseStatus exceptionStatus) {
        super(exceptionStatus.getMessage());
        this.exceptionStatus = exceptionStatus;
    }

    public MemberMentosException(ResponseStatus exceptionStatus, String message) {
        super(message);
        this.exceptionStatus = exceptionStatus;
    }

}
