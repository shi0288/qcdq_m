package com.xyauto.qa.cloud;

import com.mcp.fastcloud.annotation.ServerName;
import com.mcp.fastcloud.util.Result;
import com.xyauto.qa.core.ForwardedForInterceptor;
import feign.Param;
import feign.QueryMap;
import feign.RequestLine;

import java.util.Map;


/**
 * Created by shiqm on 2017/3/8.
 */
@ServerName(value = "QCDQ-QA-SERVER", applyClass = ForwardedForInterceptor.class)
public interface UserService {

    /**
     * 获取首页专家团列表
     *
     * @return
     */
    @RequestLine("GET /v1.0/user/list/recommend")
    String getHomeExperts();


    /**
     * 获取用户详情
     * @return
     */
    @RequestLine("GET /v1.0/user/{uid}")
    String getUserDesc(@Param("uid") String uid);



    /**
     * 获取用户列表
     *
     * @return
     */
    @RequestLine("GET /v1.0/user/plist?page={page}&limit={limit}&type={type}")
    String getPageUserList(@Param("page") Integer page, @Param("limit") Integer limit, @Param("type") Integer type);



    /**
     * 获取用户列表
     *
     * @return
     */
    @RequestLine("GET /v1.0/user/plist")
    Result getPageUserList(@QueryMap Map<String, Object> params);

    /**
     * 个人日报
     */
    @RequestLine("GET /user/answer/report?uid={uid}")
    Result getReport(@Param("uid") String uid);



}
