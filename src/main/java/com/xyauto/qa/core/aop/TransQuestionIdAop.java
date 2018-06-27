package com.xyauto.qa.core.aop;

import com.alibaba.fastjson.JSON;
import com.xyauto.qa.cloud.AssistService;
import com.xyauto.qa.core.annotation.TransKey;
import com.xyauto.qa.util.ResultData;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.lang.reflect.Parameter;

/**
 * ID和key直接的转换，采用注解方式实现，不影响业务逻辑
 * <p>
 * Created by shiqm on 2017/3/14.
 */

@Component
@Aspect
public class TransQuestionIdAop {


    @Autowired
    private AssistService assistService;


    @Pointcut("@annotation(com.xyauto.qa.core.annotation.TransKey)")
    public void point() {
    }

    @Around("point()")
    public Object intercept(ProceedingJoinPoint pjp) {
        MethodSignature signature = (MethodSignature) pjp.getSignature();
        Method method = signature.getMethod();
        Parameter[] parameters = method.getParameters();
        Object[] args = pjp.getArgs();
        for (int i = 0; i < parameters.length; i++) {
            Parameter parameter = parameters[i];
            if (parameter.isAnnotationPresent(TransKey.class)) {
                if (args[i] instanceof String) {
                    String question_id = (String) args[i];
                    ResultData resultData = JSON.parseObject(assistService.getRealQuestionId(question_id), ResultData.class);
                    if (resultData.getData() == null || "".equals(resultData.getData()) || "0".equals(resultData.getData())) {
                        question_id = null;
                    } else {
                        question_id = resultData.getData();
                    }
                    if (question_id != null) {
                        args[i] = question_id;
                    }
                }
            }
        }
        Object retVal = null;
        try {
            retVal = pjp.proceed(args);
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        return retVal;
    }

}
