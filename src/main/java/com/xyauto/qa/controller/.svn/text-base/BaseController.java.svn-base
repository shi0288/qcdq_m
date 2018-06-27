package com.xyauto.qa.controller;

import com.xyauto.qa.cons.CommonCons;
import com.xyauto.qa.core.annotation.Log;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by shiqm on 2017/3/15.
 */
public class BaseController {
    @Autowired
    protected HttpSession httpSession;

    @Autowired
    protected HttpServletRequest httpServletRequest;

    @Autowired
    protected HttpServletResponse httpServletResponse;

    @Log
    protected Logger logger;

    protected void setSession(String key, Object value) {
        httpSession.setAttribute(key, value);
    }


    protected void setCookies(String key, Object value) {
        Cookie cookie = new Cookie(key.trim(), value.toString());
        httpServletResponse.addCookie(cookie);
    }


    protected String getCookies(String key) {
        Cookie[] cookies = httpServletRequest.getCookies();//这样便可以获取一个cookie数组
        if (null == cookies) {
        } else {
            for (Cookie cookie : cookies) {
                if (key.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }


    protected void removeSession(String key) {
        httpSession.removeAttribute(key);
    }

    protected Object getSession(String key) {
        return httpSession.getAttribute(key);
    }

    protected String getUserIdSession(String key) {
        if (httpSession.getAttribute(key) != null) {
            return (String) httpSession.getAttribute(key);
        }
        return CommonCons.Status_Flag.OUT_SESSION;
    }


}
