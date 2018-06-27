package com.xyauto.qa.core.interceptor;

import com.xyauto.qa.cloud.AssistService;
import com.xyauto.qa.cons.QcdqcdnStatic;
import com.xyauto.qa.core.annotation.Log;
import com.xyauto.qa.util.HttpUtils;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 获取用户地址
 * <p>
 * Created by shiqm on 2017/3/17.
 */
public class UserCityInter implements HandlerInterceptor {


    @Log
    private Logger logger;

    @Autowired
    private AssistService assistService;

    @Autowired
    private QcdqcdnStatic qcdqcdnStatic;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
          // delete  进入提问回复在定位
//        HttpSession httpSession = httpServletRequest.getSession();
//        if (httpSession.getAttribute(CommonCons.Session_Flag.CLIENT_CITY_ID) == null) {
//            try {
//                String clientIp = IPUtil.getRequestIP(httpServletRequest);
//                logger.info("根据用户IP获取定位:{}",clientIp);
//                Result result = JSON.parseObject(assistService.getCity(null, null, clientIp), Result.class);
//                logger.info("定位信息:{}",result.getData().toString());
//                String cityName = result.getData().getString("name");
//                String cityId = result.getData().getString("id");
//                httpSession.setAttribute(CommonCons.Session_Flag.CLIENT_CITY, cityName);
//                httpSession.setAttribute(CommonCons.Session_Flag.CLIENT_CITY_ID, cityId);
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        String base = HttpUtils.getBasePath(httpServletRequest);
        httpServletRequest.setAttribute("base", base);
        httpServletRequest.setAttribute("cssPath", qcdqcdnStatic.getUrl()+"css");
        httpServletRequest.setAttribute("jsPath", qcdqcdnStatic.getUrl()+"js");
        httpServletRequest.setAttribute("imgPath", qcdqcdnStatic.getUrl()+"img");
        StringBuffer url = httpServletRequest.getRequestURL();
        if (httpServletRequest.getQueryString() != null) {
            url.append("?");
            url.append(httpServletRequest.getQueryString());
        }
        httpServletRequest.setAttribute("curUrl", url);
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
