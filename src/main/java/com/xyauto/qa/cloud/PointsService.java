package com.xyauto.qa.cloud;

import com.mcp.fastcloud.annotation.ServerName;
import feign.Param;
import feign.RequestLine;
import org.springframework.stereotype.Component;

/**
 * Created by shiqm on 2017-05-22.
 */

@ServerName(value = "QCDQ-USER-POINTS")
public interface PointsService {

    /**
     * 获取用户签到信息
     * @return
     */
    @RequestLine("GET /points/info?uid={uid}")
    String getUserInfo(@Param("uid") String uid);


}
