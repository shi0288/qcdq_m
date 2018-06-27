//package com.xyauto.qa.controller;
//
//import com.alibaba.fastjson.JSON;
//import com.mcp.fastcloud.util.Result;
//import com.xyauto.qa.cons.ApiCons;
//import com.xyauto.qa.cloud.*;
//import com.xyauto.qa.cons.CommonCons;
//import com.xyauto.qa.util.ResultArr;
//import com.xyauto.qa.util.TemplateUtils;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import java.io.File;
//import java.util.HashMap;
//import java.util.Map;
//
///**
// * Created by shiqm on 2017/3/8.
// */
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
//public class HomeControllerTest {
//
//    @Autowired
//    private QuestionService questionService;
//
//    @Autowired
//    private AssistService assistService;
//
//    @Autowired
//    private UserService userService;
//
//    @Autowired
//    private ApiCons apiCons;
//
//    @Autowired
//    private TemplateUtils templateUtils;
//
//    @Autowired
//    private CarService carService;
//
//    @Autowired
//    private NewsService newsService;
//
//    @Autowired
//    private SearchService searchService;
//
//    @Autowired
//    private CommentService commentService;
//
//
//
//    @Test
//    public void testHome() throws Exception {
//
//        Result users = userService.getPageUserList(new HashMap() {{
//            put("page", 2);
//            put("limit", 20);
//            put("type", CommonCons.User_Type_Flag.USER_TYPE_ADVISER);
//        }});
//        System.out.println(users.getData());
//
//        // System.out.println(questionService.getPageQuestionAnswerList(20,1,"1"));
////        System.out.println(userService.getUserDesc("62446"));
//
//        //FileInputStream fileInputStream=new FileInputStream(file);
//
//
////        System.out.println(questionService.createQuestion("1", "abcd", 1L));
////        System.out.println(questionService.createAnswer("1", "abcd", 1L));
////          System.out.println(assistService.uploadFile(file));
//        //System.out.println(questionService.favoriteQuestion("75",2L));
////        System.out.println(questionService.unFavoriteQuestion("75",1L));
//        try {
////            System.out.println(questionService.getPageQuestionAnswerList(20,1,"2",1L));
//
//
////            TestService testService = baseService.cc();
////            System.out.println(userService.getHomeExperts());
////
//////
////            System.out.println(userService.getUserDesc("50747"));
////
//
////            Map<String, Object> map = new HashMap<String, Object>();
////            Result result = JSON.parseObject(questionService.getPageRecommendQuestionList(20,2), Result.class);
//
////            System.out.println(questionService.getPageRecommendQuestionList(20,1,"1"));
////
//////            System.out.println(apiCons.getSign());
//////            System.out.println(apiCons.getApp_id());
//////            System.out.println(apiCons.getServer_name());
////
////            File file = new File("D://logo.png");
////            System.out.println(assistService.uploadFile(file));
//            // System.out.println(assistService.getRealQuestionId("3MbYFziqIrI3JV7Znai2qi2e"));
//////            System.out.println(ApiCons.APP_ID);
////
////
////            System.out.println(questionService.getQuestionDesc("63427","0",null));
////            System.out.println(questionService.getAttach("7229"));
////            System.out.println(questionService.getSeriesDesc("2047"));
////            System.out.println(questionService.getPageRecommendQuestionList(20,1));
////            System.out.println(questionService.getPageRecentQuestionList(20,2,null,"2306"));
////            System.out.println(questionService.getCategoryList());
////            System.out.println(questionService.getBrandList());
////            System.out.println(questionService.getSeriesListByBrandId("1"));
////            System.out.println(questionService.getPageUserQuestionList(20,1,"50941"));
////            System.out.println(questionService.getPageUserAnswerList(20,1,"37","33"));
////            System.out.println(questionService.getPageQuestionAnswerList(20,1,"61619","33"));
////            System.out.println(questionService.getPageUserFavoriteList(20,1,"33"));
////            System.out.println(questionService.getPageUserSpecialList(20,1,"1"));
//
////            System.out.println(questionService.questionAgreeUserList("61619", 7));
////            System.out.println(questionService.getAnswerDesc("48764", "0"));
////            System.out.println(assistService.verifyinquirycode("13321176503", "23424"));
////            System.out.println(assistService.quotationAgree("13321176503", "23424"));
//
//
//
//
//            //ResultArr userArr = JSON.parseObject(questionService.questionAgreeUserList("61619", 7), ResultArr.class);
//
//
//           // System.out.println(userArr.toString());
//
//            //File[] files=new File[]{file};
////            System.out.println(questionService.createQuestionNoPic("1","sxxewwefwfwe","1","1",null,null,null,"group1/M00/01/50/o4YBAFjcvpKAfTm2AADcl1aAJi8506.jpg,group1/M00/01/B2/oYYBAFjcvqCASvOeAADWb7wH1VE157.jpg","1"));
////            System.out.println(questionService.createQuestionNoPicTest("1","xxxxxcv","1","1",null,null,null,"group1/M00/01/50/o4YBAFjcvpKAfTm2AADcl1aAJi8506.jpg,group1/M00/01/B2/oYYBAFjcvqCASvOeAADWb7wH1VE157.jpg"));
////            System.out.println(questionService.createAnswerNoPic("8018","abcddddddd","33","3101",null,null,"11111"));
////            System.out.println(questionService.favoriteQuestion("33","1"));
////            System.out.println(questionService.unFavoriteQuestion("33","1"));
////            System.out.println(questionService.agreeAnswer("220","33"));
//
////            System.out.println(questionService.unAgreeAnswer("33","1"));
////            System.out.println(questionService.reportQuestion("33","1","sjfdlsdjfljsdk"));
//
//
////            System.out.println(questionService.reportAnswer("7265","0","广告"));
////            System.out.println(questionService.delQuestion("33","1"));
////            System.out.println(questionService.delAnswer("33","1"));
//
////            System.out.println(userService.getPageUserList(1,20,CommonCons.User_Type_Flag.USER_TYPE_EXPERT));
////            System.out.println(templateUtils.parse(ViewKeyCons.INDEX_QUESTION, result.getData()));
//
////            System.out.println(assistService.getHomeBannerList(CommonCons.Block_Flag.MOBILE_BANNER));
//
////            ErrorController
//
//
////            System.out.println(assistService.getHomeBannerList(CommonCons.Block_Flag.POPULAR_TOPIC));
//
////            System.out.println(questionService.getPageSubjectQuestionList(1,3,"大老师"));
////            System.out.println(carService.getCarmaster("1"));
////            System.out.println(carService.getHotmaster("2382"));
//
////            System.out.println(carService.getCarBrand());
////            System.out.println(questionService.yesterdayRank("1"));
////            System.out.println(questionService.yesterdayRank("2"));
//
////            System.out.println(questionService.questionAgreeUserList("28198",6));
//
//
////            System.out.println(newsService.getHtmlUrl(7932,4,1));
////            System.out.println(newsService.getHtmlUrl(7932,3,1));
////            System.out.println(newsService.getHtmlUrl(7932,2,1));
////            System.out.println(newsService.getHtmlUrl(7932,1,1));
//
//
////            System.out.println(searchService.getUserInfo("12","1.0",1));
////            System.out.println(assistService.getBrokerCarList("163"));
////            System.out.println(assistService.getBrokerCityList("163"));
////            System.out.println(assistService.getinquirycode("13321176503"));
//
//
////            System.out.println(commentService.get("804"));
//
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        System.in.read();
//    }
//}