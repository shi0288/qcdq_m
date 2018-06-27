package com.xyauto.qa.cloud;

import com.mcp.fastcloud.annotation.ServerName;
import feign.Param;
import feign.RequestLine;
import org.springframework.stereotype.Component;

/**
 * Created by shiqm on 2017-05-22.
 */

@ServerName(value = "QCDQ-NEWS-SERVER")
public interface NewsService {

    /**
     * 获取页面URL
     *
     * @return
     */
    @RequestLine("GET /common/getHtmlUrl?dataId={dataId}&pmId={pmId}&dataType={dataType}")
    String getHtmlUrl(@Param("dataId") Integer dataId, @Param("pmId") Integer pmId, @Param("dataType") Integer dataType);


}
