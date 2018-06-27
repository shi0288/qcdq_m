package com.xyauto.qa.core;

import com.alibaba.fastjson.JSON;
import com.xyauto.qa.cons.ApiCons;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * 封装了请求时附加的app_id和sign,解耦业务逻辑
 *
 * Created by shiqm on 2017/3/14.
 */

@Component
public class ForwardedForInterceptor implements RequestInterceptor {


    @Autowired
    private ApiCons apiCons;

    @Override
    public void apply(RequestTemplate input) {
        input.query(true, "app_id", apiCons.getApp_id());
        input.query(true, "sign", apiCons.getSign());
        input.query(true, "version", "2.5");
    }

}
