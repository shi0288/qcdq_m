package com.xyauto.qa.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.mcp.fastcloud.util.Result;
import com.mcp.validate.annotation.Check;
import com.xyauto.qa.cloud.QuestionService;
import com.xyauto.qa.cloud.UserService;
import com.xyauto.qa.cons.CommonCons;
import com.xyauto.qa.cons.ViewKeyCons;
import com.xyauto.qa.util.DateCalUtil;
import com.xyauto.qa.util.JSONResult;
import com.xyauto.qa.util.TemplateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

/**
 * Created by shiqm on 2018-01-30.
 */

@RestController
public class AjaxController extends BaseController{


    @Autowired
    private UserService userService;

    @Autowired
    private TemplateUtils templateUtils;

    @Autowired
    private QuestionService questionService;


    @RequestMapping(value = "getAdvisers", method = RequestMethod.POST)
    @ResponseBody
    JSONResult getAdvisers(
            @Check(defaultValue = "1") Integer page,
            @Check(defaultValue = "20") Integer limit,
            Integer brand_id,
            Integer city_id) {
        Result users = userService.getPageUserList(new HashMap() {{
            put("page", page);
            put("limit", limit);
            put("type", CommonCons.User_Type_Flag.USER_TYPE_ADVISER);
            if (city_id != null) {
                put("city_id", city_id);
            }
            if (brand_id != null) {
                put("brand_id", brand_id);
            }
        }});
        JSONResult jsonResult = templateUtils.parse(ViewKeyCons.ADVISER_USER_LIST, users.getData(),this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID));
        JSONObject jsonObject = JSON.parseObject(users.getData().toString());
        jsonResult.setCount(jsonObject.getInteger("count"));
        return jsonResult;
    }

    /**
     *
     * @return
     */
    @RequestMapping("/getQuotations")
    @ResponseBody
    JSONResult getQuotations(String max) {
        com.xyauto.qa.util.Result result = JSON.parseObject(questionService.quotationList(
                new HashMap() {{
                    put("max", max);
                    put("limit", 20);
                }}
        ), com.xyauto.qa.util.Result.class);
        DateCalUtil.transTimestamp(result.getData(), true);
        JSONResult jsonResult = templateUtils.parse(ViewKeyCons.QUOTATION_LIST, result.getData());
        jsonResult.setNextMax(result.getData().getString("next_max"));
        jsonResult.setHasMore(result.getData().getInteger("has_more"));
        return jsonResult;
    }



}
