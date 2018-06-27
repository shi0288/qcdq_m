package com.xyauto.qa.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;
import com.mcp.fastcloud.util.Result;
import com.xyauto.qa.cloud.CommentService;
import com.xyauto.qa.cons.CommonCons;
import com.xyauto.qa.cons.ViewKeyCons;
import com.xyauto.qa.util.DateCalUtil;
import com.xyauto.qa.util.JSONResult;
import com.xyauto.qa.util.TemplateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by shiqm on 2017-11-27.
 */

@Controller
@RequestMapping("comment")
public class CommentController extends BaseController {


    @Autowired
    private CommentService commentService;

    @Autowired
    private TemplateUtils templateUtils;

    /**
     * Ajax 添加 删除攒
     *
     * @param comment_id
     * @param checked
     * @return
     */
    @RequestMapping(value = "agree", method = RequestMethod.POST)
    @ResponseBody
    String addAgree(String comment_id, Boolean checked) {
        Result result;
        if (checked) {
            result = commentService.agree(comment_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID));
        } else {
            //如果未登录则不进行删除赞
            if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
                //约定10001为未登录状态，不在进行继续点赞的页面变化
                return "10001";
            } else {
                result = commentService.disAgree(comment_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID));
            }
        }
        return String.valueOf(result.getCode());
    }


    /**
     * 创建评论
     *
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    String add(String answer_id, String content, String city_id, String reply_uid, String reply_comment_id, String attachs) {
        // 判断用户未登录
        JSONObject jsonObject = new JSONObject();
        if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
            jsonObject.put("msg", "账号未登录");
            return jsonObject.toString();
        }
        if (StringUtils.isEmpty(answer_id)) {
            jsonObject.put("msg", "回复ID不能为空");
            return jsonObject.toString();
        }
        Map<String, Object> params = new HashMap<>();
        params.put("answer_id", answer_id);
        params.put("content", DateCalUtil.nullOrBlankLine(content));
        params.put("city_id", city_id);
        params.put("uid", this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID));
        params.put("reply_uid", reply_uid);
        params.put("reply_comment_id", reply_comment_id);
        params.put("attachs", attachs);
        Result result = commentService.add(params);
        if (result.getCode() == 10000) {
            jsonObject.put("code", 10000);
            return jsonObject.toString();
        } else {
            jsonObject.put("msg", result.getMsg());
            return jsonObject.toString();
        }

    }


    /**
     * 举报问题
     */
    @RequestMapping(value = "report", method = RequestMethod.POST)
    @ResponseBody
    String report(String comment_id, String reason) {
        String uid = this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID);
        Result result = commentService.report(new HashMap() {{
            put("comment_id", comment_id);
            put("reason", reason);
            put("uid", uid);
        }});
        return String.valueOf(result.getCode());
    }


    /**
     * 举报问题
     */
    @RequestMapping(value = "del", method = RequestMethod.POST)
    @ResponseBody
    String del(String comment_id) {
        String uid = this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID);
        Result result = commentService.del(new HashMap() {{
            put("comment_id", comment_id);
            put("uid", uid);
        }});
        return String.valueOf(result.getCode());
    }

    /**
     * 获取ajax列表
     */
    @RequestMapping(value = "list", method = RequestMethod.POST)
    @ResponseBody
    JSONResult getComments(int page,String answer_id) {
        String uid = this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID);
        Result result = commentService.list(new HashMap(){{
            put("uid", uid);
            put("limit",20);
            put("page",page);
            put("answer_id",answer_id);
        }});
        JSONResult jsonResult = templateUtils.parse(ViewKeyCons.COMMENT_LIST,  DateCalUtil.transTimestamp(result.getData(), false));
        if (jsonResult.isDone()) {
            jsonResult.setCount(JSON.parseObject(result.getData().toString()).getInteger("count"));
        }
        return jsonResult;
    }


}
