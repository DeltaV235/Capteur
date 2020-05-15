package com.wuyue.model.vo;

/**
 * @author DeltaV235
 * @version 1.0
 * @className ResultEntity
 * @description
 * @date 2020/5/14 16:09
 */
public class ResultEntity<T> {
    private boolean success;
    private String msg;
    private T data;

    public static <E> ResultEntity<E> successWithoutData() {
        return new ResultEntity<>(true, null, null);
    }

    public static <E> ResultEntity<E> successWithData(E data) {
        return new ResultEntity<>(true, null, data);
    }

    public static <E> ResultEntity<E> error(String msg) {
        return new ResultEntity<>(false, msg, null);
    }

    public ResultEntity() {
    }

    public ResultEntity(boolean isSuccess, String msg, T data) {
        this.success = isSuccess;
        this.msg = msg;
        this.data = data;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
