package com.xyauto.qa.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.mcp.validate.annotation.Check;
import com.xyauto.qa.cloud.*;
import com.xyauto.qa.cons.CommonCons;
import com.xyauto.qa.cons.ViewKeyCons;
import com.xyauto.qa.core.annotation.TransKey;
import com.xyauto.qa.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * Created by shiqm on 2017/3/9.
 */

@Controller
public class QuestionController extends BaseController {


    @Autowired
    private QuestionService questionService;

    @Autowired
    private AssistService assistService;

    @Autowired
    private TemplateUtils templateUtils;

    @Autowired
    private CitySessionUtil citySessionUtil;

    @Autowired
    private UserAgentUtil userAgentUtil;

    @Autowired
    private CarService carService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private SearchService searchService;

    @Autowired
    private CommentService commentService;


    /**
     * 问题列表加载的数据
     *
     * @param map
     * @return
     */
    @RequestMapping("/issues")
    String issues(ModelMap map, HttpServletRequest request, String category_id, String category_name, String series_id, String series_name, String subject, String title, Integer answer_count) {
        Result result = null;
        if (StringUtils.isEmpty(subject)) {
            result = JSON.parseObject(questionService.getPageRecentQuestionList(CommonCons.Page_Flag.PAGE_LIMIT, CommonCons.Page_Flag.PAGE_NUMBER, category_id, series_id, answer_count, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), Result.class);
        } else {
//            if(subject.equals("报价单")){
//                return "forward:/quotations";
//            }
            result = JSON.parseObject(questionService.getPageSubjectQuestionList(CommonCons.Page_Flag.PAGE_LIMIT, CommonCons.Page_Flag.PAGE_NUMBER, subject, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), Result.class);
        }
        DateCalUtil.transTimestamp(result.getData(), true);
        map.addAttribute("questionRes", result.getData());
        ResultArr resultArr = JSON.parseObject(questionService.getCategoryList(), ResultArr.class);
        map.addAttribute("categoryRes", resultArr.getData());
        map.addAttribute("category_id", category_id);
        map.addAttribute("category_name", category_name);
        map.addAttribute("series_id", series_id);
        map.addAttribute("subject", subject);
        map.addAttribute("title", title);
        map.addAttribute("answer_count", answer_count);
        if (!StringUtils.isEmpty(series_id)) {
            result = JSON.parseObject(questionService.getSeriesDesc(series_id), Result.class);
            if (result.getData() != null && result.getData().containsKey("name")) {
                String name = result.getData().getString("name");
                map.addAttribute("series_name", name);
            }
        }
        if (answer_count == null) {
            //获取品牌列表
            result = JSON.parseObject(questionService.getBrandList(), Result.class);
        } else {
            result = JSON.parseObject(assistService.getProvinceList(), Result.class);
            map.addAttribute("provinceRes", result.getData());
        }

        map.addAttribute("brandRes", result.getData());
        //获取省份
        result = JSON.parseObject(assistService.getProvinceList(), Result.class);
        map.addAttribute("provinceRes", result.getData());
        //每次定位
        citySessionUtil.resetCity(request);
        return "wenda_issues";
    }


    /**
     * 问题列表加载的数据
     *
     * @param map
     * @return
     */
    @RequestMapping("/quotations")
    String quotations(ModelMap map, HttpServletRequest request) {
        Result result = JSON.parseObject(questionService.getPageSubjectQuestionList(0, 0, "报价单", "0"), Result.class);
        map.addAttribute("subject", result.getData());
        result = JSON.parseObject(questionService.quotationList(
                new HashMap() {{
                    put("max", 0);
                    put("limit", 20);
                }}
        ), Result.class);
        DateCalUtil.transTimestamp(result.getData(), true);
        map.addAttribute("questionRes", result.getData());
        citySessionUtil.resetCity(request);
        return "wenda_quotation_list";
    }


    /**
     * 进入问题页面
     *
     * @param question_id
     * @return
     */
    @RequestMapping("/answer")
    ModelAndView answer(HttpServletRequest request,
                        HttpServletResponse response,
                        String question_id,
                        String msg_id,
                        @Check(required = false, defaultValue = "1") int sort
    ) {
        return this.answerOther(request, response, question_id, msg_id, sort);
    }

    /**
     * 进入问题页面
     *
     * @param question_id
     * @return
     */
    @RequestMapping("/answer/{question_id}")
    ModelAndView answerOther(HttpServletRequest request,
                             HttpServletResponse response,
                             @PathVariable("question_id") String question_id,
                             String msg_id,
                             @Check(required = false, defaultValue = "1") int sort
    ) {
        if (!userAgentUtil.mobileRequest(request)) {
            ModelAndView map = new ModelAndView("redirect:" + userAgentUtil.PC_QUESTION_DETAIL + question_id);
            return map;
        }
        String question_key = new String(question_id);
        ResultData resultData = JSON.parseObject(assistService.getRealQuestionId(question_id), ResultData.class);
        if (resultData.getData() == null || "".equals(resultData.getData())) {
        } else {
            question_id = resultData.getData();
        }
        Result result = JSON.parseObject(questionService.getQuestionDesc(question_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), msg_id), Result.class);
        if (result.getData() == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return new ModelAndView("forward:/error");
        }
        DateCalUtil.transTimestampObj(result.getData(), true);
        ModelAndView map = new ModelAndView("wenda_answer");
        JSONObject qData = result.getData();
        map.addObject("question", result.getData());
        result = JSON.parseObject(questionService.getPageQuestionAnswerList(CommonCons.Page_Flag.PAGE_LIMIT, CommonCons.Page_Flag.PAGE_NUMBER, question_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), sort), Result.class);
        DateCalUtil.transTimestamp(result.getData(), false);
        map.addObject("answerRes", result.getData());
        map.addObject("sort", sort);

        //获取省份
        result = JSON.parseObject(assistService.getProvinceList(), Result.class);
        map.addObject("provinceRes", result.getData());
        //每次定位
        citySessionUtil.resetCity(request);
        //报名增加内容
        try {
            if (qData.containsKey("attach_type") && qData.getIntValue("attach_type") == 6) {
                JSONObject activityContent = qData.getJSONArray("activity").getJSONObject(0).getJSONArray("content").getJSONObject(0);
                Long startTime = activityContent.getLong("start_time");
                Long endTime = activityContent.getLong("end_time");
                map.addObject("sign_status", DateCalUtil.timeExpire(startTime, endTime));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //获取点赞用户
        com.mcp.fastcloud.util.Result r = questionService.questionAgreeUserList(question_id, 7);
        map.addObject("agreeUserList", JSON.parseObject(r.getData().toString()).getJSONArray("list"));
        map.addObject("question_key", question_key);
        return map;
    }


    /**
     * Ajax获取问题翻页的最新问题数据
     *
     * @param page
     * @return
     */
    @RequestMapping(value = "getIssuesQuestion", method = RequestMethod.POST)
    @ResponseBody
    JSONResult getIssuesQuestion(int page, String category_id, String series_id, String subject, Integer answer_count) {
        Result result = null;
        if (StringUtils.isEmpty(subject)) {
            result = JSON.parseObject(questionService.getPageRecentQuestionList(CommonCons.Page_Flag.PAGE_LIMIT, page, category_id, series_id, answer_count, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), Result.class);
        } else {
            result = JSON.parseObject(questionService.getPageSubjectQuestionList(CommonCons.Page_Flag.PAGE_LIMIT, page, subject, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), Result.class);
        }
        DateCalUtil.transTimestamp(result.getData(), true);
        JSONResult jsonResult = templateUtils.parse(ViewKeyCons.ISSUES_QUESTION, result.getData());
        if (jsonResult.isDone()) {
            jsonResult.setCount(result.getData().getInteger("count"));
        }
        return jsonResult;
    }


    /**
     * Ajax根据品牌ID获取车系
     *
     * @param brand_id
     * @return
     */
    @RequestMapping(value = "getSeries", method = RequestMethod.POST)
    @ResponseBody
    String getSeriesListByBrandId(String brand_id) {
        ResultArr resultArr = JSON.parseObject(questionService.getSeriesListByBrandId(brand_id), ResultArr.class);
        return resultArr.getData().toString();
    }


    /**
     * Ajax根据品牌ID获取车系
     *
     * @param brand_id
     * @return
     */
    @RequestMapping(value = "getRSeries", method = RequestMethod.POST)
    @ResponseBody
    JSONResult getRSeriesListByBrandId(String brand_id) {
        JSONObject jsonObject = JSON.parseObject(carService.getCarmaster(brand_id));
        JSONResult jsonResult = templateUtils.parse(ViewKeyCons.SERIES_LIST, jsonObject.getJSONObject("data"));
        return jsonResult;
    }

    /**
     * Ajax根据品牌ID获取车系
     *
     * @param series_id
     * @return
     */
    @RequestMapping(value = "getRCars", method = RequestMethod.POST)
    @ResponseBody
    JSONResult getRCars(String series_id) {
        JSONObject jsonObject = JSON.parseObject(carService.getHotmaster(series_id));
        try {
            List<JSONObject> collection = JSONObject.parseArray(jsonObject.getJSONObject("data").getString("datas"), JSONObject.class);
            if (collection.size() == 0) {
            } else {
                Collections.sort(collection, new CarCompare());
                JSONResult jsonResult = templateUtils.parse(ViewKeyCons.CAR_LIST, collection);
                return jsonResult;
            }
        } catch (Exception e) {
        }
        JSONResult temp = new JSONResult();
        temp.setDone(false);
        return temp;
    }


    /**
     * 通过问题ID获取回复列表
     *
     * @param page
     * @param question_id
     * @return
     */
    @TransKey
    @RequestMapping(value = "getAnswersByQuestionId", method = RequestMethod.POST)
    @ResponseBody
    JSONResult getAnswersByQuestionId(int page, @TransKey String question_id, @Check(required = false, defaultValue = "1") int sort) {
        Result result = JSON.parseObject(questionService.getPageQuestionAnswerList(CommonCons.Page_Flag.PAGE_LIMIT, page, question_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), sort), Result.class);
        DateCalUtil.transTimestamp(result.getData(), false);
        JSONResult jsonResult = templateUtils.parse(ViewKeyCons.ANSWER_LIST, result.getData(), this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID));
        if (jsonResult.isDone()) {
            jsonResult.setCount(result.getData().getInteger("count"));
        }
        return jsonResult;
    }


    /**
     * Ajax 添加 删除收藏
     *
     * @param question_id
     * @param checked
     * @return
     */
    @TransKey
    @RequestMapping(value = "addFavorite", method = RequestMethod.POST)
    @ResponseBody
    String addFavorite(@TransKey String question_id, Boolean checked) {
        Result result;
        if (checked) {
            result = JSON.parseObject(questionService.favoriteQuestion(question_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), Result.class);
        } else {
            result = JSON.parseObject(questionService.unFavoriteQuestion(question_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), Result.class);
        }
        return String.valueOf(result.getCode());
    }


    /**
     * Ajax 添加 删除攒
     *
     * @param answer_id
     * @param checked
     * @return
     */
    @RequestMapping(value = "addAgree", method = RequestMethod.POST)
    @ResponseBody
    String addAgree(String answer_id, Boolean checked) {
        ResultData result;
        if (checked) {
            result = JSON.parseObject(questionService.agreeAnswer(answer_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), ResultData.class);

        } else {
            //如果未登录则不进行删除赞
            if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
                //约定10001为未登录状态，不在进行继续点赞的页面变化
                return "10001";
            } else {
                result = JSON.parseObject(questionService.unAgreeAnswer(answer_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), ResultData.class);
            }
        }
        return String.valueOf(result.getCode());
    }


    /**
     * Ajax 添加 删除攒
     *
     * @param question_id
     * @param checked
     * @return
     */
    @TransKey
    @RequestMapping(value = "addAgreeQuestion", method = RequestMethod.POST)
    @ResponseBody
    String addAgreeQuestion(@TransKey String question_id, Boolean checked) {
        ResultData result;
        if (checked) {
            result = JSON.parseObject(questionService.agreeQuestion(question_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), ResultData.class);
        } else {
            //如果未登录则不进行删除赞
            if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
                //约定10001为未登录状态，不在进行继续点赞的页面变化
                return "10001";
            } else {
                result = JSON.parseObject(questionService.disAgreeQuestion(question_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), ResultData.class);
            }
        }
        return String.valueOf(result.getCode());
    }


    /**
     * 举报问题
     *
     * @param question_id
     * @param reason
     * @return
     */
    @TransKey
    @RequestMapping(value = "reportQuestion", method = RequestMethod.POST)
    @ResponseBody
    String reportQuestion(@TransKey String question_id, String reason) {
        ResultData result = JSON.parseObject(questionService.reportQuestion(question_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), reason), ResultData.class);
        return String.valueOf(result.getCode());
    }


    /**
     * 删除回复
     *
     * @return
     */
    @RequestMapping(value = "delAnswer", method = RequestMethod.POST)
    @ResponseBody
    String delAnswer(String answer_id) {
        ResultData result = JSON.parseObject(questionService.delAnswer(answer_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), ResultData.class);
        return String.valueOf(result.getCode());
    }


    /**
     * 删除问题
     *
     * @return
     */
    @RequestMapping(value = "delQuestion", method = RequestMethod.POST)
    @ResponseBody
    @TransKey
    String delQuestion(@TransKey String question_id) {
        ResultData result = JSON.parseObject(questionService.delQuestion(question_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), ResultData.class);
        return String.valueOf(result.getCode());
    }


    /**
     * 举报回复
     *
     * @param answer_id
     * @param reason
     * @return
     */
    @RequestMapping(value = "reportAnswer", method = RequestMethod.POST)
    @ResponseBody
    String reportAnswer(String answer_id, String reason) {
        ResultData result = JSON.parseObject(questionService.reportAnswer(answer_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), reason), ResultData.class);
        return String.valueOf(result.getCode());
    }

    @RequestMapping(value = "createActivity", method = RequestMethod.POST)
    @ResponseBody
    String createActivity(String username, String sex, String time, String mobile, String attach_id) {
        String uid = null;
        if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
            //约定10001为未登录状态，不在进行继续点赞的页面变化
            return "10001";
        } else {
            uid = this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID);
        }
        Result result = JSON.parseObject(questionService.getAttach(attach_id), Result.class);
        boolean timeReq = false;
        boolean direct = false;
        try {
            JSONObject jsonObject = result.getData();
            JSONObject tempContent = jsonObject.getJSONArray("content").getJSONObject(0);
            if ("indirect".equals(tempContent.getString("sign"))) {
                direct = true;
            }
            if (tempContent.containsKey("sign_info")) {
                JSONObject sign_infoObj = tempContent.getJSONObject("sign_info");
                if (sign_infoObj != null && sign_infoObj.containsKey("time") && sign_infoObj.getJSONArray("time").size() > 0) {
                    timeReq = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("code", "10002");
            jsonObject.put("msg", "该活动不存在");
            return jsonObject.toJSONString();
        }

        if (direct) {
            if (StringUtils.isEmpty(username)) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("code", "10002");
                jsonObject.put("msg", "姓名不能为空");
                return jsonObject.toJSONString();
            }
            if (StringUtils.isEmpty(sex)) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("code", "10002");
                jsonObject.put("msg", "性别不能为空");
                return jsonObject.toJSONString();
            }
            if (timeReq && StringUtils.isEmpty(time)) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("code", "10002");
                jsonObject.put("msg", "时间不能为空");
                return jsonObject.toJSONString();
            }
            if (StringUtils.isEmpty(mobile)) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("code", "10002");
                jsonObject.put("msg", "手机不能为空");
                return jsonObject.toJSONString();
            }
            JSONObject sendInfo = new JSONObject();
            sendInfo.put("username", username);
            sendInfo.put("sex", sex);
            sendInfo.put("mobile", mobile);
            if (timeReq) {
                sendInfo.put("time", time);
            }
            return questionService.enlistActivity(uid, sendInfo.toJSONString(), attach_id);
        } else {
            return questionService.enlistActivity(uid, "", attach_id);
        }


    }


    /**
     * Ajax 获取文章
     *
     * @param dataId
     * @return
     */
    @RequestMapping(value = "getNewsUrl", method = RequestMethod.POST)
    @ResponseBody
    String getNewsUrl(
            @Check Integer dataId,
            @Check(defaultValue = "1") Integer type
    ) {
        Result result = JSON.parseObject(newsService.getHtmlUrl(dataId, 4, type), Result.class);
        JSONObject jsonObject = new JSONObject();
        if (result.getCode() == 10000) {
            jsonObject.put("code", 10000);
            jsonObject.put("msg", "成功");
            jsonObject.put("data", result.getData());
            return jsonObject.toString();
        }
        jsonObject.put("code", "9999");
        jsonObject.put("msg", "获取地址出错");
        return jsonObject.toJSONString();
    }


    /**
     * 通过问题ID获取回复列表
     *
     * @param question_id
     * @return
     */
    @TransKey
    @RequestMapping(value = "getAnswersList", method = RequestMethod.POST)
    @ResponseBody
    JSONResult getAnswersList(@TransKey String question_id, @Check(required = false, defaultValue = "1") int sort) {
        Result result = JSON.parseObject(questionService.getPageQuestionAnswerList(CommonCons.Page_Flag.PAGE_LIMIT, CommonCons.Page_Flag.PAGE_NUMBER, question_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), sort), Result.class);
        DateCalUtil.transTimestamp(result.getData(), false);
        JSONResult jsonResult = templateUtils.parse(ViewKeyCons.ANSWER_ALL, result.getData(), this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID));
        return jsonResult;
    }


    @RequestMapping(value = "search/jsonp", method = RequestMethod.GET)
    @ResponseBody
    String getSearch(
            @Check(value = "keyword") String keyword,
            @Check(value = "pageNum", number = true) int pageNum,
            @Check(value = "version") String version,
            @Check(value = "callback", required = true) String callback
    ) {
        return searchService.getUserInfo(keyword, version, pageNum, callback);
    }


    /**
     * 进入回答详情页面
     *
     * @return
     */
    @RequestMapping("/answer_detail")
    ModelAndView answer_detail(
            HttpServletRequest request,
            HttpServletResponse response,
            @Check(value = "answer_id") String answer_id
    ) {
        return this.answer_detail_other(request, response, answer_id);
    }


    /**
     * 进入回答详情页面
     *
     * @return
     */
    @RequestMapping("/answer_detail/{answer_id}")
    ModelAndView answer_detail_other(
            HttpServletRequest request,
            HttpServletResponse response,
            @PathVariable("answer_id") String answer_id
    ) {

        if (answer_id == null) {
            ModelAndView map = new ModelAndView("redirect:/delete");
            return map;
        }

        if (!userAgentUtil.mobileRequest(request)) {
            ModelAndView map = new ModelAndView("redirect:" + userAgentUtil.PC_QUESTION_DETAIL_ANS + answer_id);
            return map;
        }
        ModelAndView map = new ModelAndView("wenda_ans_detail");
        String uid = this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID);
        com.mcp.fastcloud.util.Result result = questionService.getAnswerDesc(answer_id, uid);
        if (result == null || result.getCode() == 30001 || result.getData() == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return new ModelAndView("forward:/error");
        }
        map.addObject("answer", DateCalUtil.transTimestampObj(result.getData(), false));
        Result question = JSON.parseObject(questionService.getQuestionDesc(JSON.parseObject(result.getData().toString()).getString("question_id"), uid, null), Result.class);
        DateCalUtil.transTimestampObj(question.getData(), true);
        map.addObject("question", question.getData());
        com.mcp.fastcloud.util.Result commentListResult = commentService.list(new HashMap() {{
            put("uid", uid);
            put("answer_id", answer_id);
            put("page", 1);
            put("limit", 20);
        }});
        map.addObject("commentList", DateCalUtil.transTimestamp(commentListResult.getData(), false));
        citySessionUtil.resetCity(request);
        //获取省份
        Result provinceRes = JSON.parseObject(assistService.getProvinceList(), Result.class);
        map.addObject("provinceRes", provinceRes.getData());
        return map;
    }


    @RequestMapping(value = "/attach/{key}", method = RequestMethod.GET)
    public String attachInfo(
            HttpServletRequest request,
            @PathVariable("key") Object key,
            Integer type,
            @Check(defaultValue = "0") int index,
            Map<String, Object> model) {
        if (!userAgentUtil.mobileRequest(request)) {
            return "redirect:" + userAgentUtil.PC_ATTACH + "/" + key + "?type=" + type + "&index=" + index;
        }
        if (type == 1) {
            String question_key = new String(key.toString());
            String question_id = "";
            ResultData resultData = JSON.parseObject(assistService.getRealQuestionId(question_key), ResultData.class);
            if (resultData.getData() == null || "".equals(resultData.getData())) {
                question_id = key.toString();
            } else {
                question_id = resultData.getData();
            }
            Result result = JSON.parseObject(questionService.getQuestionDesc(question_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), null), Result.class);
            model.put("data", result.getData());
        } else if (type == 2) {
            com.mcp.fastcloud.util.Result result = questionService.getAnswerDesc(key.toString(), "0");
            model.put("data", result.getData());
        } else if (type == 3) {
            com.mcp.fastcloud.util.Result result = commentService.get(key.toString());
            model.put("data", result.getData());
        }
        model.put("type", type);
        model.put("index", index);
        return "show_image";
    }


}
