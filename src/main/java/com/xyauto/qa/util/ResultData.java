package com.xyauto.qa.util;


/**
 * Created by shiqm on 2017/3/8.
 */
public class ResultData {

    private int code;
    private int sub_code;
    private String message;
    private String msg;
    private String data;

    @Override
    public String toString() {
        return "ResultData{" +
                "code=" + code +
                ", sub_code=" + sub_code +
                ", message='" + message + '\'' +
                ", msg='" + msg + '\'' +
                ", data='" + data + '\'' +
                '}';
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getSub_code() {
        return sub_code;
    }

    public void setSub_code(int sub_code) {
        this.sub_code = sub_code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
