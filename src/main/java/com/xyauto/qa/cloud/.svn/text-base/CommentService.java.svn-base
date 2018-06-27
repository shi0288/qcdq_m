package com.xyauto.qa.cloud;

import com.mcp.fastcloud.annotation.ServerName;
import com.mcp.fastcloud.util.Result;
import com.xyauto.qa.core.ForwardedForInterceptor;
import feign.Param;
import feign.QueryMap;
import feign.RequestLine;

import java.util.Map;

/**
 * Created by shiqm on 2017-11-27.
 */

@ServerName(value = "QCDQ-QA-SERVER", applyClass = ForwardedForInterceptor.class)
public interface CommentService {

    /**
     * 评论点赞
     */
    @RequestLine("GET /comment/agree?comment_id={comment_id}&uid={uid}")
    Result agree(@Param("comment_id") String comment_id, @Param("uid") String uid);


    /**
     * 取消评论点赞
     */
    @RequestLine("GET /comment/disagree?comment_id={comment_id}&uid={uid}")
    Result disAgree(@Param("comment_id") String comment_id, @Param("uid") String uid);


    /**
     * 发起回复
     */
    @RequestLine("POST /comment/add")
    Result add(@QueryMap Map<String, Object> params);

    /**
     * 评论列表
     */
    @RequestLine("GET /comment/plist")
    Result list(@QueryMap Map<String, Object> params);


    @RequestLine("GET /comment/del")
    Result del(@QueryMap Map<String, Object> params);


    @RequestLine("GET /comment/report")
    Result report(@QueryMap Map<String, Object> params);


    @RequestLine("GET /comment/{comment_id}")
    Result get(@Param("comment_id") String comment_id);






}
