package com.xyauto.qa.core.configuration;

import com.xyauto.qa.core.interceptor.UserCityInter;
import com.xyauto.qa.core.interceptor.UserCookieInter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by shiqm on 2017/3/17.
 */

@Configuration
public class WebInterceptor extends WebMvcConfigurerAdapter {


    @Bean
    public UserCityInter getUserCityInter(){
        return new UserCityInter();
    }

    @Bean
    public UserCookieInter getUserCookieInter(){
        return new UserCookieInter();
    }


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(getUserCityInter()).addPathPatterns("/**");
        registry.addInterceptor(getUserCookieInter()).addPathPatterns("/**");
        super.addInterceptors(registry);
    }
}
