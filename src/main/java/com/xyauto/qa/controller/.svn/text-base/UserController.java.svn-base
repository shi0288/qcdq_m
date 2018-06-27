package com.xyauto.qa.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.mcp.validate.annotation.Check;
import com.xyauto.qa.cloud.*;
import com.xyauto.qa.cons.CommonCons;
import com.xyauto.qa.cons.UserConstant;
import com.xyauto.qa.cons.ViewKeyCons;
import com.xyauto.qa.core.annotation.TransKey;
import com.xyauto.qa.util.*;
import com.xyauto.qa.util.cache.ICacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.*;

/**
 * Created by shiqm on 2017/3/9.
 */


@Controller
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private QuestionService questionService;

    @Autowired
    private AssistService assistService;

    @Autowired
    private TemplateUtils templateUtils;

    @Autowired
    private ImageHelper imageHelper;

    @Autowired
    private CitySessionUtil citySessionUtil;

    @Autowired
    private UserAgentUtil userAgentUtil;

    @Autowired
    private CarService carService;

    @Autowired
    private PointsService pointsService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private CookieManager cookieManager;

    @Autowired
    @Qualifier("redis_cache")
    private ICacheService cache;


    /**
     * 根据用户ID进入用户详情页
     *
     * @param uid
     * @return
     */
    @RequestMapping("/user")
    String userDesc(HttpServletRequest request, ModelMap map, String uid) {
        if (!userAgentUtil.mobileRequest(request)) {
            return "redirect:" + userAgentUtil.PC_EXPERT + uid;
        }
        //获取用户信息
        if (uid == null) {
            if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
                // 未登录 跳入登录页
                return "redirect:" + CommonCons.Config_Flag.URL_LOGIN;
            } else {
                uid = this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID);
            }
        }
        //增加判断是否点击的用户自己的信息
        boolean whois = false;
        if (!this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
            if (uid.equals(this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID))) {
                whois = true;
            }
        }

        Result result = JSON.parseObject(userService.getUserDesc(uid), Result.class);
        JSONObject userObj = result.getData();
        map.addAttribute("user", userObj);

        //获取省份
        result = JSON.parseObject(assistService.getProvinceList(), Result.class);
        map.addAttribute("provinceRes", result.getData());
        //每次定位
        citySessionUtil.resetCity(request);

        //获取问题
        result = JSON.parseObject(questionService.getPageUserQuestionList(CommonCons.Page_Flag.PAGE_LIMIT, CommonCons.Page_Flag.PAGE_NUMBER, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), uid), Result.class);
        DateCalUtil.transTimestamp(result.getData(), true);
        map.addAttribute("userQuestion", result.getData());
        int userType = userObj.getInteger("type");
        int is_official = userObj.getInteger("is_official");

        if (whois) {
            //获取回答
            result = JSON.parseObject(questionService.getPageUserAnswerList(CommonCons.Page_Flag.PAGE_LIMIT, CommonCons.Page_Flag.PAGE_NUMBER, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), uid), Result.class);
            DateCalUtil.transTimestamp(result.getData(), false);
            map.addAttribute("userAnswer", result.getData());
            //增加官方人员
            if (is_official == 1) {
                result = JSON.parseObject(questionService.getPageUserFavoriteList(CommonCons.Page_Flag.PAGE_LIMIT, CommonCons.Page_Flag.PAGE_NUMBER, uid), Result.class);
                DateCalUtil.transTimestamp(result.getData(), true);
                map.addAttribute("userFavorite", result.getData());
                return "mywenda_guanfang";
            }
            //获取积分
            result = JSON.parseObject(pointsService.getUserInfo(uid), Result.class);
            map.addAttribute("userPoints", result.getData());
            switch (userType) {
                //专家详情
                case CommonCons.User_Type_Flag.USER_TYPE_EXPERT:
                    //获取关注
                    result = JSON.parseObject(questionService.getPageUserFavoriteList(CommonCons.Page_Flag.PAGE_LIMIT, CommonCons.Page_Flag.PAGE_NUMBER, uid), Result.class);
                    DateCalUtil.transTimestamp(result.getData(), true);
                    map.addAttribute("userFavorite", result.getData());
                    //获取待解决
                    result = JSON.parseObject(questionService.getPageUserSpecialList(CommonCons.Page_Flag.PAGE_LIMIT, CommonCons.Page_Flag.PAGE_NUMBER, uid), Result.class);
                    DateCalUtil.transTimestamp(result.getData(), true);
                    map.addAttribute("userSpecial", result.getData());
                    return "mywenda_zhuanjia";
                //标兵详情
                case CommonCons.User_Type_Flag.USER_TYPE_EXAMPLE:
                    //获取关注
                    result = JSON.parseObject(questionService.getPageUserFavoriteList(CommonCons.Page_Flag.PAGE_LIMIT, CommonCons.Page_Flag.PAGE_NUMBER, uid), Result.class);
                    DateCalUtil.transTimestamp(result.getData(), true);
                    map.addAttribute("userFavorite", result.getData());
                    //获取待解决
                    result = JSON.parseObject(questionService.getPageUserSpecialList(CommonCons.Page_Flag.PAGE_LIMIT, CommonCons.Page_Flag.PAGE_NUMBER, uid), Result.class);
                    DateCalUtil.transTimestamp(result.getData(), true);
                    map.addAttribute("userSpecial", result.getData());
                    return "mywenda_biaobing";
                //车顾问详情
                case CommonCons.User_Type_Flag.USER_TYPE_ADVISER:
                    //获取关注
                    result = JSON.parseObject(questionService.getPageUserFavoriteList(CommonCons.Page_Flag.PAGE_LIMIT, CommonCons.Page_Flag.PAGE_NUMBER, uid), Result.class);
                    DateCalUtil.transTimestamp(result.getData(), true);
                    map.addAttribute("userFavorite", result.getData());
                    //获取待解决
                    result = JSON.parseObject(questionService.getPageUserSpecialList(CommonCons.Page_Flag.PAGE_LIMIT, CommonCons.Page_Flag.PAGE_NUMBER, uid), Result.class);
                    DateCalUtil.transTimestamp(result.getData(), true);
                    map.addAttribute("userSpecial", result.getData());
                    return "mywenda_guwen";
                //其余进普通详情
                default:
                    //获取关注
                    result = JSON.parseObject(questionService.getPageUserFavoriteList(CommonCons.Page_Flag.PAGE_LIMIT, CommonCons.Page_Flag.PAGE_NUMBER, uid), Result.class);
                    DateCalUtil.transTimestamp(result.getData(), true);
                    map.addAttribute("userFavorite", result.getData());
                    return "mywenda_putong";
            }
        } else {
            //获取回答
            result = JSON.parseObject(questionService.getPageUserAnswerList(CommonCons.Page_Flag.PAGE_LIMIT, CommonCons.Page_Flag.PAGE_NUMBER, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), uid), Result.class);
            DateCalUtil.transTimestamp(result.getData(), false);
            map.addAttribute("userAnswer", result.getData());
            //增加官方人员
            if (is_official == 1) {
                return "hiswenda_guanfang";
            }
            switch (userType) {
                //专家详情
                case CommonCons.User_Type_Flag.USER_TYPE_EXPERT:
                    return "hiswenda_zhuanjia";
                //标兵详情
                case CommonCons.User_Type_Flag.USER_TYPE_EXAMPLE:
                    return "hiswenda_biaobing";
                //车顾问详情
                case CommonCons.User_Type_Flag.USER_TYPE_ADVISER:
                    return "hiswenda_guwen";
                //其余进普通详情
                default:
                    return "hiswenda_putong";
            }
        }
    }


    /**
     * 排行榜
     */
    @RequestMapping(value = "/rank")
    String enlist(ModelMap map) {
        if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
            // 未登录 跳入登录页
            return "redirect:" + CommonCons.Config_Flag.URL_LOGIN_RANK;
        }
        Result result = JSON.parseObject(userService.getUserDesc(this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), Result.class);
        JSONObject userObj = result.getData();
        map.addAttribute("user", userObj);
        ResultArr resultArr = JSON.parseObject(questionService.yesterdayRank("1"), ResultArr.class);
        map.addAttribute("biaoRank", resultArr.getData());
        resultArr = JSON.parseObject(questionService.yesterdayRank("2"), ResultArr.class);
        map.addAttribute("expertRank", resultArr.getData());
        return "wenda_rank";
    }

    /**
     * 进入专家列表
     */
    @RequestMapping(value = "/experts")
    String goExpertsList(ModelMap map) {
        ResultArr resultArr = JSON.parseObject(userService.getHomeExperts(), ResultArr.class);
        map.addAttribute("expertsRes", resultArr.getData());
        Result result = JSON.parseObject(
                userService.getPageUserList(
                        CommonCons.Page_Flag.PAGE_NUMBER,
                        CommonCons.Page_Flag.PAGE_LIMIT_EXPERT,
                        CommonCons.User_Type_Flag.USER_TYPE_EXPERT), Result.class);
        map.addAttribute("userRes", result.getData());
        return "wenda_zhuanjialist";
    }

    /**
     * 进入提问页面
     *
     * @param map
     * @return
     */
    @RequestMapping(value = "/publish")
    String publish(ModelMap map, HttpServletRequest request, String special_id, String series_id, String type, String inputValue, String subject) {
        if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
            //未登录
            if (!StringUtils.isEmpty(special_id)) {
                return "redirect:" + CommonCons.Config_Flag.URL_LOGIN_PUBLIC + "?special_id=" + special_id;
            }
            if (!StringUtils.isEmpty(type)) {
                return "redirect:" + CommonCons.Config_Flag.URL_LOGIN_PUBLIC + "?type=" + type;
            }
            if (!StringUtils.isEmpty(subject)) {
                try {
                    subject = URLEncoder.encode(subject, "utf-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                return "redirect:" + CommonCons.Config_Flag.URL_LOGIN_PUBLIC + "?subject=" + subject;
            }
            if (!StringUtils.isEmpty(inputValue)) {
                try {
                    inputValue = URLEncoder.encode(inputValue, "utf-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                return "redirect:" + CommonCons.Config_Flag.URL_LOGIN_PUBLIC + "?inputValue=" + inputValue;
            }
            return "redirect:" + CommonCons.Config_Flag.URL_LOGIN_PUBLIC;
        }
        //获取品牌
        Result result = JSON.parseObject(questionService.getBrandList(), Result.class);
        map.addAttribute("brandRes", result.getData());
//        //获取类型
//        ResultArr resultArr = JSON.parseObject(questionService.getCategoryList(), ResultArr.class);
//        map.addAttribute("categoryRes", resultArr.getData());
        if (special_id != null) {
            //当指向专家提问时
            result = JSON.parseObject(userService.getUserDesc(special_id), Result.class);
            map.addAttribute("special_user", result.getData());
        }
        //获取省份
        result = JSON.parseObject(assistService.getProvinceList(), Result.class);
        map.addAttribute("provinceRes", result.getData());
        //获取话题
        result = JSON.parseObject(assistService.getHomeBannerList(CommonCons.Block_Flag.POPULAR_TOPIC), Result.class);
        map.addAttribute("popularRes", result.getData());
        map.addAttribute("subject", subject);
        if (!StringUtils.isEmpty(series_id)) {
            result = JSON.parseObject(questionService.getSeriesDesc(series_id), Result.class);
            map.addAttribute("seriesObj", result.getData());
        }
        if (!StringUtils.isEmpty(type)) {
            map.addAttribute("type", type);
        }
        if (!StringUtils.isEmpty(inputValue)) {
            map.addAttribute("inputValue", inputValue);
        }
        //每次定位
        citySessionUtil.resetCity(request);
        return "wenda_publish";
    }

    /**
     * 进入发布投票页面
     *
     * @param map
     * @return
     */
    @RequestMapping(value = "/vote")
    String vote(ModelMap map, HttpServletRequest request) {
        if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
            //未登录
            return "redirect:" + CommonCons.Config_Flag.URL_LOGIN_VOTE;
        }
        //获取品牌
        ResultArr resultBrands = JSON.parseObject(carService.getCarBrand(), ResultArr.class);
        JSONArray brandsArr = JSON.parseArray(resultBrands.getData().toString());
        Map brandMap = new HashMap();
        for (int i = 0; i < brandsArr.size(); i++) {
            JSONObject brandTemp = brandsArr.getJSONObject(i);
            if (brandMap.containsKey(brandTemp.getString("initial"))) {
                JSONArray brandArrTemp = (JSONArray) brandMap.get(brandTemp.getString("initial"));
                brandArrTemp.add(brandTemp);
            } else {
                JSONArray brandArrTemp = new JSONArray();
                brandArrTemp.add(brandTemp);
                brandMap.put(brandTemp.getString("initial"), brandArrTemp);
            }
        }
        map.addAttribute("brandRes", brandMap);
//        //获取类型
//        ResultArr resultArr = JSON.parseObject(questionService.getCategoryList(), ResultArr.class);
//        map.addAttribute("categoryRes", resultArr.getData());
        //获取省份
        Result result = JSON.parseObject(assistService.getProvinceList(), Result.class);
        map.addAttribute("provinceRes", result.getData());
        //获取话题
        result = JSON.parseObject(assistService.getHomeBannerList(CommonCons.Block_Flag.POPULAR_TOPIC), Result.class);
        map.addAttribute("popularRes", result.getData());

        result = JSON.parseObject(assistService.getHomeBannerList(CommonCons.Block_Flag.LABEL_QUESTION), Result.class);
        map.addAttribute("labelRes", result.getData());

        //每次定位
        citySessionUtil.resetCity(request);
        return "wenda_vote";
    }

    /**
     * 进入报价页面
     *
     * @param map
     * @return
     */
    @RequestMapping(value = "/quotation")
    String quotation(ModelMap map, HttpServletRequest request,
                     @Check(defaultValue = "0") String uid,
                     @Check String question_id,
                     @Check String reply_answer_id,
                     @Check String reply_uid
    ) {
        if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
            //未登录
            return "redirect:" + CommonCons.Config_Flag.URL_LOGIN_QUOTATION + "?uid=" + uid + "&question_id=" + question_id + "&reply_answer_id=" + reply_answer_id + "&reply_uid=" + reply_uid;
        }
        //判断进入的用户uid是0
        if (uid.equals(CommonCons.Status_Flag.OUT_SESSION)) {
            return "redirect:/user?uid=" + uid;
        }
        //判断进入的用户是官方或者非车顾问的情况
        Result result = JSON.parseObject(userService.getUserDesc(uid), Result.class);
        JSONObject userObj = result.getData();
        String is_official = userObj.getString("is_official");
        String type = userObj.getString("type");
        if ("1".equals(is_official) || !"3".equals(type)) {
            return "redirect:/user?uid=" + uid;
        }
        map.addAttribute("user", userObj);
        //获取品牌
        JSONArray brandsArr = JSON.parseArray(assistService.getBrokerCarList(uid).getData().toString());
        this.setSession("brandsArr", brandsArr);
        map.addAttribute("brandRes", AESUtil.groupData(brandsArr, "initial"));
        //获取省份
        JSONArray cityArr = JSON.parseArray(assistService.getBrokerCityList(uid).getData().toString());
        this.setSession("cityArr", cityArr);
        map.addAttribute("provinceRes", AESUtil.groupData(cityArr, "initial"));
        map.addAttribute("question_id", question_id);
        map.addAttribute("reply_answer_id", reply_answer_id);
        map.addAttribute("reply_uid", reply_uid);
        String key = "ask.m.inquiry.phone." + this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID);
        map.addAttribute("phone", cache.get(key));
        return "wenda_quotation";
    }


    /**
     * 获取用户回答列表
     *
     * @return
     */
    @RequestMapping(value = "getBrokerCitys", method = RequestMethod.POST)
    @ResponseBody
    Object getBrokerCitys(
            @Check String uid,
            @Check String province_id
    ) {
        JSONArray cityArr = null;
        if (this.getSession("cityArr") != null) {
            cityArr = JSON.parseArray(this.getSession("cityArr").toString());
        } else {
            cityArr = JSON.parseArray(assistService.getBrokerCityList(uid).getData().toString());
        }
        for (int i = 0; i < cityArr.size(); i++) {
            JSONObject jsonObject = cityArr.getJSONObject(i);
            if (province_id.equals(jsonObject.getString("provinceid"))) {
                return new com.mcp.fastcloud.util.Result(jsonObject.getJSONArray("citylist"));
            }
        }
        return new com.mcp.fastcloud.util.Result();
    }

    /**
     * 获取用户回答列表
     *
     * @return
     */
    @RequestMapping(value = "getBrokerBandList", method = RequestMethod.POST)
    @ResponseBody
    Object getBrokerBandList(
            @Check String uid,
            @Check String brand_id
    ) {
        JSONArray brandsArr = null;
        if (this.getSession("brandsArr") != null) {
            brandsArr = JSON.parseArray(this.getSession("brandsArr").toString());
        } else {
            brandsArr = JSON.parseArray(assistService.getBrokerCarList(uid).getData().toString());
        }
        for (int i = 0; i < brandsArr.size(); i++) {
            JSONObject jsonObject = brandsArr.getJSONObject(i);
            if (brand_id.equals(jsonObject.getString("id"))) {
                JSONResult jsonResult = templateUtils.parse(ViewKeyCons.SERIES_LIST, jsonObject);
                return jsonResult;
            }
        }
        return new com.mcp.fastcloud.util.Result();
    }

    /**
     * 获取用户回答列表
     *
     * @return
     */
    @RequestMapping(value = "getBrokerCarSerialList", method = RequestMethod.POST)
    @ResponseBody
    Object getCarSerialList(
            @Check String uid,
            @Check String brand_id,
            @Check String little_brand_id,
            @Check String series_id
    ) {
        JSONArray brandsArr = null;
        if (this.getSession("brandsArr") != null) {
            brandsArr = JSON.parseArray(this.getSession("brandsArr").toString());
        } else {
            brandsArr = JSON.parseArray(assistService.getBrokerCarList(uid).getData().toString());
        }
        for (int i = 0; i < brandsArr.size(); i++) {
            JSONObject jsonObject = brandsArr.getJSONObject(i);
            if (brand_id.equals(jsonObject.getString("id"))) {
                JSONArray carsArr = jsonObject.getJSONArray("brandList");
                for (int m = 0; m < carsArr.size(); m++) {
                    JSONObject item = carsArr.getJSONObject(m);
                    if (little_brand_id.equals(item.getString("id"))) {
                        JSONArray seriesArr = item.getJSONArray("carSerialList");
                        for (int n = 0; n < seriesArr.size(); n++) {
                            JSONObject seriesObj = seriesArr.getJSONObject(n);
                            if (series_id.equals(seriesObj.getString("id"))) {
                                try {
                                    List<JSONObject> collection = JSONObject.parseArray(seriesObj.getString("cars"), JSONObject.class);
                                    if (collection.size() == 0) {
                                    } else {
                                        Collections.sort(collection, new CarCompare());
                                        JSONResult jsonResult = templateUtils.parse(ViewKeyCons.BORKER_CAR_LIST, collection);
                                        return jsonResult;
                                    }
                                } catch (Exception e) {
                                }
                            }
                        }
                    }
                }
            }
        }
        return new com.mcp.fastcloud.util.Result();
    }


    /**
     * 创建回复
     *
     * @param question_id
     * @param city_id
     * @param reply_uid
     * @param reply_answer_id
     * @return
     */
    @RequestMapping(value = "createInquiry", method = RequestMethod.POST)
    @ResponseBody
    @TransKey
    String createInquiry(@TransKey String question_id, String content, String city_id, String reply_uid, String reply_answer_id, String attachs, String vote_id, @Check String inquiry, String quotation) {
        // 判断用户未登录
        JSONObject jsonObject = new JSONObject();
        if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
            jsonObject.put("msg", "账号未登录");
            return jsonObject.toString();
        }
        if (StringUtils.isEmpty(question_id)) {
            jsonObject.put("msg", "问题ID不能为空");
            return jsonObject.toString();
        }
        JSONObject inquiryObj = JSON.parseObject(inquiry);
        String city_id_temp = null;
        if (this.getSession(CommonCons.Session_Flag.CLIENT_CITY_ID) != null) {
            city_id_temp = this.getSession(CommonCons.Session_Flag.CLIENT_CITY_ID).toString();
        }
        String strRes = questionService.createAnswerNoPic(question_id, content.replaceAll("<br>", "\n"), this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), city_id_temp, reply_uid, reply_answer_id, vote_id, attachs, inquiryObj.toJSONString(), quotation);
        Result result = JSON.parseObject(strRes, Result.class);
        if (result.getCode() == 10000) {
            jsonObject.put("code", 10000);
            String key = "ask.m.inquiry.phone." + this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID);
            String phone = inquiryObj.getJSONArray("data").getJSONObject(0).getString("phone");
            if (cache.get(key) == null) {
                cache.set(key, phone);
            } else {
                if (!phone.equals(cache.get(key))) {
                    cache.set(key, phone);
                }
            }
            return jsonObject.toString();
        } else {
            jsonObject.put("msg", result.getMsg());
            return jsonObject.toString();
        }
    }

    @RequestMapping(value = "offering")
    Object offering(
            HttpServletRequest request,
            ModelMap map,
            String comment_id
    ) {
        if (!userAgentUtil.mobileRequest(request)) {
            ModelAndView redirectPc = new ModelAndView("redirect:" + userAgentUtil.PC_OFFERING + comment_id);
            return redirectPc;
        }
        com.mcp.fastcloud.util.Result result = commentService.get(comment_id);
        if (!this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
            JSONObject item = JSON.parseObject(result.getData().toString());
            try {
                if (item.getString("uid").equals(this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID))) {
                    JSONObject content = item.getJSONArray("quotation").getJSONObject(0).getJSONArray("content").getJSONObject(0);
                    if (content.getInteger("agree") == 1) {
                        map.addAttribute("brokerPhone", assistService.getBrokerPhone(content.getString("uid")).getData());
                        map.addAttribute("user", content.getJSONObject("user"));
                    }
                }
            } catch (Exception e) {
            }
        }
        map.addAttribute("comment", result.getData());
        return "wenda_offering";
    }


    @RequestMapping(value = "getMessage", method = RequestMethod.POST)
    @ResponseBody
    Object getMessage(
            @Check(mobile = true) String phone
    ) {
        String key = "ask.m.inquiry.phone." + this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID);
        if (cache.get(key) != null && cache.get(key).equals(phone)) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("code", 9999);
            jsonObject.put("msg", "此手机号已验证");
            return jsonObject;
        }
        return assistService.getinquirycode(phone);
    }


    @RequestMapping(value = "verifyinquirycode", method = RequestMethod.POST)
    @ResponseBody
    com.mcp.fastcloud.util.Result verifyinquirycode(
            @Check(mobile = true) String phone,
            @Check(number = true) String code
    ) {
        return assistService.verifyinquirycode(phone, code);
    }


    @RequestMapping(value = "commitOffering", method = RequestMethod.POST)
    @ResponseBody
    Object commitOffering(
            @Check String comment_id
    ) {
        return assistService.quotationAgree(comment_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID));
    }


    /**
     * 创建问题
     *
     * @param category_id
     * @param content
     * @param cars
     * @param special_id
     * @param city_id
     * @param attachs
     * @return
     */
    @RequestMapping(value = "/createQuestion", method = RequestMethod.POST)
    @ResponseBody
    String createQuestion(String category_id, String content, String cars, String special_id, String city_id, String attachs, String voteType, String closeTime, String[] topics, String[] carModes, String type, String[] tags) {
        // 判断用户未登录
        JSONObject jsonObject = new JSONObject();
        if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
            jsonObject.put("msg", "账号未登录");
            return jsonObject.toString();
        }
        if (StringUtils.isEmpty(content)) {
            jsonObject.put("msg", "内容不能为空");
            return jsonObject.toString();
        }
        if (content.length() < 10) {
            jsonObject.put("msg", "字数不得少10个");
            return jsonObject.toString();
        }
        if ("1".equals(type)) {
            if (content.length() > 2000) {
                jsonObject.put("msg", "最多输入2000字");
                return jsonObject.toString();
            }
        } else {
            if (content.length() > 500) {
                jsonObject.put("msg", "最多输入500字");
                return jsonObject.toString();
            }
        }

        String voteStr = null;
        if (!StringUtils.isEmpty(voteType)) {
            JSONObject dataObj = new JSONObject();
            dataObj.put("type", "vote");
            JSONArray dataArr = new JSONArray();
            dataObj.put("data", dataArr);
            if ("text".equals(voteType)) {
                tags = null; //话题投票没有标签
                if (topics == null || topics.length < 2) {
                    jsonObject.put("msg", "观点不能少于两项");
                    return jsonObject.toString();
                }
                for (int i = 0; i < topics.length; i++) {
                    if (topics[i] == null || "".equals(topics[i].replaceAll(" ", ""))) {
                        continue;
                    }
                    JSONObject temp = new JSONObject();
                    temp.put("type", "text");
                    temp.put("text", topics[i]);
                    dataArr.add(temp);
                }
                if (dataArr.size() < 2) {
                    jsonObject.put("msg", "观点不能少于两项");
                    return jsonObject.toString();
                }
            } else {
                if (carModes == null || carModes.length < 2) {
                    jsonObject.put("msg", "车型不能少于两项");
                    return jsonObject.toString();
                }
                for (int i = 0; i < carModes.length; i++) {
                    String[] voteCarArr = carModes[i].split("\\_");
                    JSONObject temp = new JSONObject();
                    temp.put("type", voteCarArr[0]);
                    temp.put("text", voteCarArr[1]);
                    temp.put("id", voteCarArr[2]);
                    dataArr.add(temp);
                }
                if (dataArr.size() < 2) {
                    jsonObject.put("msg", "车型不能少于两项");
                    return jsonObject.toString();
                }
            }
            dataObj.put("expire", closeTime);
            voteStr = dataObj.toJSONString();
        }
        String strRes = questionService.createQuestionNoPic(null, DateCalUtil.nullOrBlankLine(content), this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), cars, special_id, city_id, voteStr, attachs, type, org.apache.commons.lang.StringUtils.join(tags, ","));
        Result result = JSON.parseObject(strRes, Result.class);
        if (result.getCode() == 10000) {
            String questionKye = result.getData().getString("key");
            jsonObject.put("code", 10000);
            jsonObject.put("key", questionKye);
            return jsonObject.toString();
        } else {
            jsonObject.put("msg", result.getMsg());
            return jsonObject.toString();
        }
    }


    /**
     * 获取用户问题列表
     *
     * @param page
     * @param uid
     * @return
     */
    @RequestMapping(value = "getUserQuestion", method = RequestMethod.POST)
    @ResponseBody
    JSONResult getUserQuestion(int page, String uid) {
        Result result = JSON.parseObject(questionService.getPageUserQuestionList(CommonCons.Page_Flag.PAGE_LIMIT, page, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), uid), Result.class);
        DateCalUtil.transTimestamp(result.getData(), true);
        JSONResult jsonResult = templateUtils.parse(ViewKeyCons.USER_QUESTION, result.getData());
        if (jsonResult.isDone()) {
            jsonResult.setCount(result.getData().getInteger("count"));
        }
        return jsonResult;
    }

    /**
     * 获取用户回答列表
     *
     * @param page
     * @param uid
     * @return
     */
    @RequestMapping(value = "getUserAnswer", method = RequestMethod.POST)
    @ResponseBody
    JSONResult getUserAnswer(int page, @Check(defaultValue = "0") String uid) {
        Result result = JSON.parseObject(questionService.getPageUserAnswerList(CommonCons.Page_Flag.PAGE_LIMIT, page, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), uid), Result.class);
        DateCalUtil.transTimestamp(result.getData(), false);
        JSONResult jsonResult = templateUtils.parse(ViewKeyCons.USER_ANSWER, result.getData());
        if (jsonResult.isDone()) {
            jsonResult.setCount(result.getData().getInteger("count"));
        }
        return jsonResult;
    }

    /**
     * 获取用户关注列表
     *
     * @param page
     * @param uid
     * @return
     */
    @RequestMapping(value = "getUserFavorite", method = RequestMethod.POST)
    @ResponseBody
    JSONResult getUserFavorite(int page, String uid) {
        Result result = JSON.parseObject(questionService.getPageUserFavoriteList(CommonCons.Page_Flag.PAGE_LIMIT, page, uid), Result.class);
        DateCalUtil.transTimestamp(result.getData(), true);
        JSONResult jsonResult = templateUtils.parse(ViewKeyCons.USER_FAVORITE, result.getData());
        if (jsonResult.isDone()) {
            jsonResult.setCount(result.getData().getInteger("count"));
        }
        return jsonResult;
    }

    /**
     * 获取用户待解决列表
     *
     * @param page
     * @param uid
     * @return
     */
    @RequestMapping(value = "getUserSpecial", method = RequestMethod.POST)
    @ResponseBody
    JSONResult getUserSpecial(int page, String uid) {
        Result result = JSON.parseObject(questionService.getPageUserSpecialList(CommonCons.Page_Flag.PAGE_LIMIT, page, uid), Result.class);
        DateCalUtil.transTimestamp(result.getData(), true);
        JSONResult jsonResult = templateUtils.parse(ViewKeyCons.USER_SPECIAL, result.getData());
        if (jsonResult.isDone()) {
            jsonResult.setCount(result.getData().getInteger("count"));
        }
        return jsonResult;
    }


    /**
     * 创建回复
     *
     * @param question_id
     * @param content
     * @param city_id
     * @param reply_uid
     * @param reply_answer_id
     * @return
     */
    @TransKey
    @RequestMapping(value = "createAnswer", method = RequestMethod.POST)
    @ResponseBody
    String createAnswer(@TransKey String question_id, String content, String city_id, String reply_uid, String reply_answer_id, String attachs, String vote_id) {
        // 判断用户未登录
        JSONObject jsonObject = new JSONObject();
        if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
            jsonObject.put("msg", "账号未登录");
            return jsonObject.toString();
        }
        if (StringUtils.isEmpty(question_id)) {
            jsonObject.put("msg", "问题ID不能为空");
            return jsonObject.toString();
        }
        if (StringUtils.isEmpty(vote_id)) {
            if (StringUtils.isEmpty(content) && StringUtils.isEmpty(attachs)) {
                jsonObject.put("msg", "内容不能为空");
                return jsonObject.toString();
            }
            if (StringUtils.isEmpty(content.replaceAll("\\s*", "")) && StringUtils.isEmpty(attachs)) {
                jsonObject.put("msg", "内容不能为空");
                return jsonObject.toString();
            }
            if (content.length() > 2000) {
                jsonObject.put("msg", "最多输入2000字");
                return jsonObject.toString();
            }
        }
        String strRes = questionService.createAnswerNoPic(question_id, DateCalUtil.nullOrBlankLine(content), this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), city_id, reply_uid, reply_answer_id, vote_id, attachs);
        Result result = JSON.parseObject(strRes, Result.class);
        if (result.getCode() == 10000) {
            jsonObject.put("code", 10000);
            return jsonObject.toString();
        } else {
            jsonObject.put("msg", result.getMsg());
            return jsonObject.toString();
        }
    }


    @RequestMapping(value = "getVotePercent", method = RequestMethod.POST)
    @ResponseBody
    @TransKey
    JSONObject getVotePercent(@TransKey String question_id) {
        Result result = JSON.parseObject(questionService.getQuestionDesc(question_id, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID), null), Result.class);
        JSONObject res = new JSONObject();
        if (result.getData() == null) {
            res.put("code", 999);
            res.put("msg", "未获取问题详情");
            return res;
        }
        JSONObject questionObj = result.getData();
        JSONArray voteArray = questionObj.getJSONArray("vote");
        if (voteArray.size() == 1) {
            JSONObject vote = voteArray.getJSONObject(0);
            res.put("data", vote);
        }
        res.put("code", 10000);
        return res;
    }


    /**
     * 上传图片
     *
     * @param file
     * @return
     */
    @RequestMapping(value = "uploadPic", method = RequestMethod.POST)
    @ResponseBody
    String uploadPic(MultipartFile file) {
        if (file == null) {
            JSONObject obj = new JSONObject();
            obj.put("code", 3000);
            return obj.toString();
        }
        if (file.getSize() > CommonCons.Config_Flag.PICTURE_LIMIT_SIZE) {
            JSONObject obj = new JSONObject();
            obj.put("code", 2999);
            return obj.toString();
        }
        String originalName = file.getOriginalFilename();
        String fileType = imageHelper.getFileExt(originalName);
        boolean typeDone = false;
        for (String type : CommonCons.Config_Flag.PICTURE_TYPE) {
            if (type.toUpperCase().equals(fileType.toUpperCase())) {
                typeDone = true;
                break;
            }
        }

        if (!typeDone) {
            JSONObject obj = new JSONObject();
            obj.put("code", 2998);
            return obj.toString();
        }
        //校验类型
        File f = null;
        try {
            f = File.createTempFile("tmp", "." + fileType);
            file.transferTo(f);
            //压缩
            imageHelper.scaleImage(f, f, fileType);
            JSONObject obj = JSON.parseObject(assistService.uploadFile(f));
            String attach = obj.getString("data");
            if (attach.toLowerCase().startsWith("http") || attach.toLowerCase().startsWith("https")) {
            } else {
                if (attach.startsWith("/group1")) {
                    attach = "http://img1.qcdqcdn.com" + attach;
                }
                if (attach.startsWith("/group2")) {
                    attach = "http://img2.qcdqcdn.com" + attach;
                }
                if (attach.startsWith("group1")) {
                    attach = "http://img1.qcdqcdn.com/" + attach;
                }
                if (attach.startsWith("group2")) {
                    attach = "http://img2.qcdqcdn.com/" + attach;
                }
            }
            obj.put("data", attach);
            f.delete();
            return obj.toString();
        } catch (IOException e) {
            return null;
        }
    }


    /**
     * 获取用户待解决列表
     *
     * @param province_id
     * @return
     */
    @RequestMapping(value = "getCityList", method = RequestMethod.POST)
    @ResponseBody
    String getCityList(String province_id) {
        ResultArr resultArr = JSON.parseObject(assistService.getCityListByProvinceId(province_id), ResultArr.class);
        return resultArr.getData().toString();
    }

    /**
     * 记录城市定位
     *
     * @param city_id
     * @param city_name
     * @return
     */
    @RequestMapping(value = "setUserCity", method = RequestMethod.POST)
    @ResponseBody
    String setUserCity(String city_id, String city_name) {
        if (city_id == null) {
            return String.valueOf(false);
        }
        if (city_name == null) {
            return String.valueOf(false);
        }
        this.setSession(CommonCons.Session_Flag.CLIENT_CITY_ID, city_id);
        this.setSession(CommonCons.Session_Flag.CLIENT_CITY, city_name);
        return String.valueOf(true);
    }

    @RequestMapping(value = "integray")
    String integray(ModelMap map) {
        if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
        } else {
            Result result = JSON.parseObject(userService.getUserDesc(this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), Result.class);
            JSONObject userObj = result.getData();
            map.addAttribute("user", userObj);
        }
        return "wenda_integray";
    }

    @RequestMapping(value = "search")
    String search() {
        return "wenda_search";
    }


    @RequestMapping(value = "count")
    String biaobing_count(HttpServletRequest request, ModelMap map) {
        //获取用户信息
        String uid = null;
        if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
            // 未登录 跳入登录页
            return "redirect:" + CommonCons.Config_Flag.URL_LOGIN_COUNT;
        } else {
            uid = this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID);
        }
        Result result = JSON.parseObject(userService.getUserDesc(uid), Result.class);
        map.addAttribute("user", result.getData());
        map.addAttribute("report", userService.getReport(uid).getData());
        return "wenda_count";
    }

    @RequestMapping(value = "loginout")
    String loginout(HttpServletResponse response) {
        cookieManager.removeCookie(response, UserConstant.USER_SESSION_KEY);
        return "redirect:" + CommonCons.Config_Flag.URL_LOGIN_COUNT;
    }

}
