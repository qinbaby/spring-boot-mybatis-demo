package com.xcc.springbootmybatisdemo.model;

/**
 * 所有API请求返回类型，封装json结果
 * @param <T>
 */
public class ApiResult<T> {

    private Integer status;

    private String info;

    private T data;

    private Integer count;

    public ApiResult() {
    }

    public ApiResult(Integer status, String info, T data) {
        this.status = status;
        this.info = info;
        this.data = data;
    }

    public ApiResult(Integer status, String info, T data, Integer count) {
        this.status = status;
        this.info = info;
        this.data = data;
        this.count = count;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
