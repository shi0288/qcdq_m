package com.xyauto.qa.cloud;

import com.mcp.fastcloud.annotation.ServerName;
import feign.Param;
import feign.RequestLine;
import org.springframework.stereotype.Component;

/**
 * Created by shiqm on 2017-08-29.
 */

@ServerName(value = "QCDQ-SEARCH-SERVER")
public interface SearchService {

    /**
     * 获取搜索
     * @return
     */
    @RequestLine("GET /appsearch/searchQAForM?version={version}&method=search.searchQA&keyword={keyword}&pageNum={pageNum}&jsonCallback={jsonCallback}")
    String getUserInfo(@Param("keyword") String keyword, @Param("version") String version, @Param("pageNum") int pageNum, @Param("jsonCallback") String callback);

}
