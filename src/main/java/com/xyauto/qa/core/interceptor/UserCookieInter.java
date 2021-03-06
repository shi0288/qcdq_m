package com.xyauto.qa.core.interceptor;

import com.xyauto.qa.cloud.UserService;
import com.xyauto.qa.cons.CommonCons;
import com.xyauto.qa.cons.Constants;
import com.xyauto.qa.core.annotation.Log;
import com.xyauto.qa.util.*;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 获取用户Cookies状态
 * <p>
 * Created by shiqm on 2017/3/17.
 */
public class UserCookieInter implements HandlerInterceptor {

    @Log
    private Logger logger;

    @Autowired
    private UserService userService;



    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession httpSession = httpServletRequest.getSession();
        httpSession.removeAttribute(CommonCons.Session_Flag.SESSION_UID);
        httpSession.removeAttribute(CommonCons.Session_Flag.SESSION_AVATAR);
        httpSession.removeAttribute(CommonCons.Session_Flag.SESSION_NICKNAME);
        if (httpSession.getAttribute(CommonCons.Session_Flag.SESSION_UID) == null) {
            try {
                CookieManager cookieManager = CookieManager.getInstance();
                UserCookeiDO userCookeiDO = cookieManager.getUserByCookie(httpServletRequest);
                if (userCookeiDO != null) {
                    httpSession.setAttribute(CommonCons.Session_Flag.SESSION_UID, String.valueOf(userCookeiDO.getUser_id()));
                    String pathUrl=userCookeiDO.getUser_avatar();
                    if (pathUrl.toLowerCase().startsWith("http://") || pathUrl.toLowerCase().startsWith("https://")) {
                    }
                    if (pathUrl.startsWith("group1")) {
                        pathUrl = Constants.avatarGroup1Root + pathUrl;
                    }
                    if (pathUrl.startsWith("group2")) {
                        pathUrl = Constants.avatarGroup2Root + pathUrl;
                    }
                    httpSession.setAttribute(CommonCons.Session_Flag.SESSION_AVATAR, pathUrl);
                    httpSession.setAttribute(CommonCons.Session_Flag.SESSION_NICKNAME, userCookeiDO.getNick_name());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }



        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
