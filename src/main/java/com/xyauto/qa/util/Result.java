package com.xyauto.qa.util;


import com.alibaba.fastjson.JSONObject;

/**
 * Created by shiqm on 2017/3/8.
 */
public class Result {

    private int code;
    private String message;
    private String msg;

    private JSONObject data;

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

    public JSONObject getData() {
        return data;
    }

    public void setData(JSONObject data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
