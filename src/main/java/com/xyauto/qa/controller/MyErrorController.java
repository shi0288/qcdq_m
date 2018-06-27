package com.xyauto.qa.controller;

import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by shiqm on 2017/3/21.
 */

@Controller
public class MyErrorController implements ErrorController {


    private static final String ERROR_PATH = "/error";

    @RequestMapping(ERROR_PATH)
    String handleError(){
        return "mywenda_404";
    }



    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }


}
