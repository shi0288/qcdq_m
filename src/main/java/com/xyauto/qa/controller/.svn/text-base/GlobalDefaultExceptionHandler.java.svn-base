package com.xyauto.qa.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by shiqm on 2017/3/11.
 */


/**
 * 全局的异常处理（程序运行时异常）
 */

@ControllerAdvice
public class GlobalDefaultExceptionHandler {


    @ExceptionHandler(value = Exception.class)
    public ModelAndView defaultErrorHandler(HttpServletRequest req, HttpServletResponse httpServletResponse, Exception e)  {
        httpServletResponse.setStatus(404);
        return new ModelAndView("forward:/error");
    }
}
