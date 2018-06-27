package com.xyauto.qa.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.mcp.validate.annotation.Check;
import com.xyauto.qa.cloud.AssistService;
import com.xyauto.qa.cloud.CarService;
import com.xyauto.qa.cloud.QuestionService;
import com.xyauto.qa.cloud.UserService;
import com.xyauto.qa.cons.CommonCons;
import com.xyauto.qa.cons.ViewKeyCons;
import com.xyauto.qa.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by shiqm on 2017/3/7.
 */

@Controller
public class HomeController extends BaseController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private AssistService assistService;

    @Autowired
    private UserService userService;

    @Autowired
    private TemplateUtils templateUtils;

    @Autowired
    private CitySessionUtil citySessionUtil;

    @Autowired
    private UserAgentUtil userAgentUtil;

    @Autowired
    private CarService carService;


    /**
     * 首页加载的数据
     *
     * @param map
     * @return
     */
    @RequestMapping("/")
    String home(HttpServletRequest request, ModelMap map) {
        if (!userAgentUtil.mobileRequest(request)) {
            return "redirect:" + userAgentUtil.PC_INDEX;
        }
//        ResultArr resultArr = JSON.parseObject(userService.getHomeExperts(), ResultArr.class);
//        map.addAttribute("expertsRes", resultArr.getData());
        Result expertUsers = JSON.parseObject(assistService.getHomeBannerList(CommonCons.Block_Flag.USER_RECOMMENDEXPERT), Result.class);
        JSONArray tempExperts = expertUsers.getData().getJSONArray("content");
        JSONArray expertsForPage = new JSONArray();
        for (int i = 0; i < tempExperts.size(); i++) {
            expertsForPage.add(JSON.parseObject(userService.getUserDesc(tempExperts.getString(i))).get("data"));
        }
        map.addAttribute("expertsRes", expertsForPage);

        //推荐话题 （topic.recommend)
        Result topicRecommend = JSON.parseObject(assistService.getHomeBannerList(CommonCons.Block_Flag.TOPIC_RECOMMEND), Result.class);
        map.addAttribute("topicRecommend", topicRecommend.getData());

        //广告 （adver.home)
        Result adverHome = JSON.parseObject(assistService.getHomeBannerList(CommonCons.Block_Flag.ADVER_HOME), Result.class);
        map.addAttribute("adverHome", adverHome.getData());

        try {
            Result result = JSON.parseObject(assistService.complex("0", this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), Result.class);
            DateCalUtil.transTimestamp(result.getData(), true);
            map.addAttribute("questionRes", result.getData());
        } catch (Exception e) {
            e.printStackTrace();
        }

        Result result = JSON.parseObject(assistService.getHomeBannerList(CommonCons.Block_Flag.MOBILE_BANNER), Result.class);
        map.addAttribute("bannerRes", result.getData());
        //获取省份
        result = JSON.parseObject(assistService.getProvinceList(), Result.class);
        map.addAttribute("provinceRes", result.getData());
        map.addAttribute("uid", this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID));
        //每次定位
        citySessionUtil.resetCity(request);
        return "wenda_index";
    }

    /**
     * @return
     */
    @RequestMapping("/delete")
    String delete() {
        return "mywenda_delete";
    }


    /**
     * Ajax获取首页翻页的推荐问题数据
     *
     * @param nextNax
     * @return
     */
    @RequestMapping(value = "getHomeQuestion", method = RequestMethod.POST)
    @ResponseBody
    JSONResult getHomeQuestion(@Check(required = false, defaultValue = "0") String nextNax) {
        Result result = JSON.parseObject(assistService.complex(nextNax, this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID)), Result.class);
        DateCalUtil.transTimestamp(result.getData(), true);
        JSONResult jsonResult = templateUtils.parse(ViewKeyCons.INDEX_QUESTION, result.getData());
        if (jsonResult.isDone()) {
            jsonResult.setHasMore(result.getData().getInteger("has_more"));
            jsonResult.setNextMax(result.getData().getString("next_max"));
        }
        return jsonResult;
    }

    /**
     * 活动
     *
     * @return
     */
    @RequestMapping(value = "/enlist")
    String enlist(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, ModelMap map, String attach_id) {
        if (this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID).equals(CommonCons.Status_Flag.OUT_SESSION)) {
            // 未登录 跳入登录页
            return "redirect:" + "http://i.m.qichedaquan.com/user/login?businessplatform=1&callback=" + httpServletRequest.getRequestURL() + "?attach_id=" + attach_id;
        }
        Result result = JSON.parseObject(questionService.getAttach(attach_id), Result.class);
        try {
            JSONObject jsonObject = result.getData();
            JSONObject tempContent = jsonObject.getJSONArray("content").getJSONObject(0);
            JSONObject sign_infoObj = tempContent.getJSONObject("sign_info");
            map.put("sign_infoObj", sign_infoObj.getJSONArray("time"));
        } catch (Exception e) {
            map.put("sign_infoObj", null);
        }
        map.put("attObj", result.getData());
        return "wenda_enlist";
    }


    /**
     * 话题列表
     *
     * @return
     */
    @RequestMapping(value = "/subjects")
    String subjects(ModelMap map) {
        Result result = JSON.parseObject(assistService.getHomeBannerList(CommonCons.Block_Flag.TOPIC_ALL), Result.class);
        map.put("subjects", result.getData());
        return "wenda_brilliant";
    }


    /**
     * 话题列表
     *
     * @return
     */
    @RequestMapping(value = "/advisers")
    String advisers(ModelMap map, HttpServletRequest request, Integer city_id, Integer brand_id, String brand_name, String city_name) {
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
        //获取省份
        Result result = JSON.parseObject(assistService.getProvinceList(), Result.class);
        map.addAttribute("provinceRes", result.getData());
        //每次定位
        citySessionUtil.resetCity(request);
        if (StringUtils.isEmpty(city_id)) {
            city_name = httpSession.getAttribute(CommonCons.Session_Flag.CLIENT_CITY).toString();
            city_id = Integer.parseInt(httpSession.getAttribute(CommonCons.Session_Flag.CLIENT_CITY_ID).toString());
        }
        Integer cityId = city_id;
        com.mcp.fastcloud.util.Result users = userService.getPageUserList(new HashMap() {{
            put("page", CommonCons.Page_Flag.PAGE_NUMBER);
            put("limit", CommonCons.Page_Flag.PAGE_LIMIT);
            put("type", CommonCons.User_Type_Flag.USER_TYPE_ADVISER);
            if (cityId != null) {
                put("city_id", cityId);
            }
            if (brand_id != null) {
                put("brand_id", brand_id);
            }
        }});
        map.put("advisers", users.getData());
        map.put("city_id", city_id);
        map.put("brand_id", brand_id);
        map.put("brand_name", StringUtils.isEmpty(brand_name) ? null : brand_name);
        map.put("city_name", StringUtils.isEmpty(city_name) ? null : city_name);
        map.put("uid", this.getUserIdSession(CommonCons.Session_Flag.SESSION_UID));
        return "wenda_adviser";
    }


    /**
     * 存活
     *
     * @return
     */
    @RequestMapping(value = "info")
    @ResponseBody
    String info() {
        return "ok";
    }


}
