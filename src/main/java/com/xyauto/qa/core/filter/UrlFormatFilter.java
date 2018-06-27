package com.xyauto.qa.core.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by shiqm on 2018-01-08.
 */


@WebFilter("/*")
public class UrlFormatFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        String url = httpServletRequest.getRequestURL().toString();
        if (url.toLowerCase().indexOf("localhost") > -1) {
            try {
                filterChain.doFilter(servletRequest, servletResponse);
            }catch (Exception e){}
        }else{
            String reg = "http://ask\\.m\\.qichedaquan\\.com.*";
            boolean isRight = url.matches(reg);
            if (isRight) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                String num = "(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)";
                reg = "^http://" + num + "\\." + num + "\\." + num + "\\." + num + ".*";
                if(url.matches(reg)){
                    filterChain.doFilter(servletRequest, servletResponse);
                }else{
                    HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;
                    httpServletResponse.setStatus(404);
                    httpServletRequest.getRequestDispatcher("/error").forward(httpServletRequest,httpServletResponse);
                }
            }
        }
    }

    @Override
    public void destroy() {
    }



}
