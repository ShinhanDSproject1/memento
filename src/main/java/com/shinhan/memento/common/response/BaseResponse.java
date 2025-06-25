package com.shinhan.memento.common.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.common.response.status.ResponseStatus;

import lombok.Getter;



@Getter
@JsonPropertyOrder({"code", "status", "message", "result"})
public class BaseResponse<T> implements ResponseStatus {

    private final int code;
    private final int status;
    private final String message;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private final T result;

    public BaseResponse(T result) {
        this.code = BaseExceptionResponseStatus.SUCCESS.getCode();
        this.status =  BaseExceptionResponseStatus.SUCCESS.getStatus();
        this.message =  BaseExceptionResponseStatus.SUCCESS.getMessage();
        this.result = result;
    }
    public BaseResponse(ResponseStatus status, T result) {
        this.code = status.getCode();
        this.status = status.getStatus();
        this.message = status.getMessage();
        this.result = result;
    }
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
