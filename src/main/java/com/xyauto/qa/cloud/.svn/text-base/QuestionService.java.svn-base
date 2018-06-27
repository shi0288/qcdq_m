package com.xyauto.qa.cloud;

import com.mcp.fastcloud.annotation.ServerName;
import com.mcp.fastcloud.util.Result;
import com.xyauto.qa.core.ForwardedForInterceptor;
import feign.Headers;
import feign.Param;
import feign.QueryMap;
import feign.RequestLine;

import java.io.File;
import java.util.Map;

/**
 * Created by shiqm on 2017/3/7.
 */

@ServerName(value = "QCDQ-QA-SERVER", applyClass = ForwardedForInterceptor.class)
public interface QuestionService {

    /**
     * 问题详情
     *
     * @param question_id
     * @param uid
     * @return
     */
    @RequestLine("GET /v1.0/question/{question_id}?uid={uid}&msg_id={msg_id}")
    String getQuestionDesc(@Param("question_id") String question_id, @Param("uid") String uid, @Param("msg_id") String msg_id);

    /**
     * 回答详情
     *
     * @param answer_id
     * @param uid
     * @return
     */
    @RequestLine("GET /v1.0/answer/{answer_id}?uid={uid}")
    Result getAnswerDesc(@Param("answer_id") String answer_id, @Param("uid") String uid);

    /**
     * 获取首页推荐问题
     *
     * @param limit
     * @param page
     * @return
     */
    @RequestLine("GET /v1.0/question/plist/recommend?limit={limit}&page={page}&uid={uid}")
    String getPageRecommendQuestionList(@Param("limit") int limit, @Param("page") int page, @Param("uid") String uid);

    /**
     * 获取最新问题列表
     *
     * @param limit
     * @param page
     * @return
     */
    @RequestLine("GET /v1.0/question/plist?limit={limit}&page={page}&category_id={category_id}&series_id={series_id}&answer_count={answer_count}&uid={uid}")
    String getPageRecentQuestionList(@Param("limit") int limit, @Param("page") int page, @Param("category_id") String category_id, @Param("series_id") String series_id, @Param("answer_count") Integer answer_count, @Param("uid") String uid);


    /**
     * 获取最新问题列表
     *
     * @param limit
     * @param page
     * @return
     */
    @RequestLine("GET /v1.1/question/subject/plist?limit={limit}&page={page}&subject={subject}&uid={uid}")
    String getPageSubjectQuestionList(@Param("limit") int limit, @Param("page") int page, @Param("subject") String subject, @Param("uid") String uid);


    /**
     * 获取分类列表
     *
     * @return
     */
    @RequestLine("GET /v1.0/category/list")
    String getCategoryList();


    /**
     * 获取车系内容
     *
     * @param id
     * @return
     */
    @RequestLine("GET /v1.0/series/{id}")
    String getSeriesDesc(@Param("id") String id);


    /**
     * 获取品牌列表
     *
     * @return
     */
    @RequestLine("GET /v1.0/brand/list")
    String getBrandList();


    /**
     * 根据品牌ID获取车系
     *
     * @param brand_id
     * @return
     */
    @RequestLine("GET /v1.0/series/list?brand_id={brand_id}")
    String getSeriesListByBrandId(@Param("brand_id") String brand_id);


    /**
     * 根据用户ID获取提问列表
     *
     * @param limit
     * @param page
     * @param uid
     * @return
     */
    @RequestLine("GET /v1.0/question/plist/ask?uid={uid}&page={page}&limit={limit}&target_uid={target_uid}")
    String getPageUserQuestionList(@Param("limit") int limit, @Param("page") int page, @Param("uid") String uid, @Param("target_uid") String target_uid);


    /**
     * 根据用户ID获取回答列表
     *
     * @param limit
     * @param page
     * @param uid
     * @return
     */
    @RequestLine("GET /v1.0/answer/plist/answered?uid={uid}&page={page}&limit={limit}&view_uid={view_uid}")
    String getPageUserAnswerList(@Param("limit") int limit, @Param("page") int page, @Param("uid") String uid, @Param("view_uid") String view_uid);


    /**
     * 根据问题ID获取回答列表
     *
     * @param limit
     * @param page
     * @param question_id
     * @return
     */
    @RequestLine("GET /v1.1/answer/plist?question_id={question_id}&page={page}&limit={limit}&uid={uid}&sort={sort}")
    String getPageQuestionAnswerList(@Param("limit") int limit, @Param("page") int page, @Param("question_id") String question_id, @Param("uid") String uid, @Param("sort") int sort);


    /**
     * 根据用户ID获取关注列表
     *
     * @param limit
     * @param page
     * @param uid
     * @return
     */
    @RequestLine("GET /v1.0/question/plist/favorite?uid={uid}&page={page}&limit={limit}")
    String getPageUserFavoriteList(@Param("limit") int limit, @Param("page") int page, @Param("uid") String uid);


    /**
     * 根据用户ID获取待解决列表
     *
     * @param limit
     * @param page
     * @param uid
     * @return
     */
    @RequestLine("GET /v1.0/question/plist/special?uid={uid}&page={page}&limit={limit}")
    String getPageUserSpecialList(@Param("limit") int limit, @Param("page") int page, @Param("uid") String uid);


    /**
     * 发起提问
     *
     * @return
     */
    @RequestLine("POST /v1.0/question/add?category_id={category_id}&content={content}&uid={uid}&cars={cars}&special={special}&city_id={city_id}")
    @Headers("Content-Type: multipart/form-data")
    String createQuestion(@Param("category_id") String category_id,
                          @Param("content") String content,
                          @Param("uid") String uid,
                          @Param("cars") String cars,
                          @Param("special") String special,
                          @Param("city_id") String city_id,
                          @Param("attachs") File[] attachs);


    /**
     * 发起提问
     *
     * @return
     */
    @RequestLine("POST /v1.0/question/add1?category_id={category_id}&content={content}&uid={uid}&cars={cars}&special={special}&city_id={city_id}&vote={vote}&attachs={attachs}&type={type}&tags={tags}")
    String createQuestionNoPic(@Param("category_id") String category_id,
                               @Param("content") String content,
                               @Param("uid") String uid,
                               @Param("cars") String cars,
                               @Param("special") String special,
                               @Param("city_id") String city_id,
                               @Param("vote") String vote,
                               @Param("attachs") String attachs,
                               @Param("type") String type,
                               @Param("tags") String tags);


    /**
     * 发起回复
     *
     * @param question_id
     * @param content
     * @param uid
     * @return
     */
    @RequestLine("POST /v1.0/answer/add?question_id={question_id}&content={content}&uid={uid}&city_id={city_id}&reply_uid={reply_uid}&reply_answer_id={reply_answer_id}")
    @Headers("Content-Type: multipart/form-data")
    String createAnswer(@Param("question_id") String question_id,
                        @Param("content") String content,
                        @Param("uid") String uid,
                        @Param("city_id") String city_id,
                        @Param("reply_uid") String reply_uid,
                        @Param("reply_answer_id") String reply_answer_id,
                        @Param("attachs") File[] attachs);


    /**
     * 发起回复
     *
     * @param question_id
     * @param content
     * @param uid
     * @return
     */
    @RequestLine("POST /v1.0/answer/add1?question_id={question_id}&content={content}&uid={uid}&city_id={city_id}&reply_uid={reply_uid}&reply_answer_id={reply_answer_id}&vote_id={vote_id}&attachs={attachs}")
    String createAnswerNoPic(@Param("question_id") String question_id,
                             @Param("content") String content,
                             @Param("uid") String uid,
                             @Param("city_id") String city_id,
                             @Param("reply_uid") String reply_uid,
                             @Param("reply_answer_id") String reply_answer_id,
                             @Param("vote_id") String vote_id,
                             @Param("attachs") String attachs);

    /**
     * 发起回复
     *
     * @param question_id
     * @param content
     * @param uid
     * @return
     */
    @RequestLine("POST /v1.0/answer/add1?question_id={question_id}&content={content}&uid={uid}&city_id={city_id}&reply_uid={reply_uid}&reply_answer_id={reply_answer_id}&vote_id={vote_id}&attachs={attachs}&inquiry={inquiry}&quotation={quotation}")
    String createAnswerNoPic(@Param("question_id") String question_id,
                             @Param("content") String content,
                             @Param("uid") String uid,
                             @Param("city_id") String city_id,
                             @Param("reply_uid") String reply_uid,
                             @Param("reply_answer_id") String reply_answer_id,
                             @Param("vote_id") String vote_id,
                             @Param("attachs") String attachs,
                             @Param("inquiry") String inquiry,
                             @Param("quotation") String quotation);

    /**
     * 收藏问题
     *
     * @param question_id
     * @param uid
     * @return
     */
    @RequestLine("GET /v1.0/question/favorite?question_id={question_id}&uid={uid}")
    String favoriteQuestion(@Param("question_id") String question_id, @Param("uid") String uid);

    /**
     * 取消收藏问题
     *
     * @param question_id
     * @param uid
     * @return
     */
    @RequestLine("GET /v1.0/question/unfavorite?question_id={question_id}&uid={uid}")
    String unFavoriteQuestion(@Param("question_id") String question_id, @Param("uid") String uid);


    /**
     * 点赞回复
     *
     * @param answer_id
     * @param uid
     * @return
     */
    @RequestLine("GET /v1.1/answer/agree?answer_id={answer_id}&uid={uid}")
    String agreeAnswer(@Param("answer_id") String answer_id, @Param("uid") String uid);

    /**
     * 取消点赞回复
     *
     * @param answer_id
     * @param uid
     * @return
     */
    @RequestLine("GET /v1.1/answer/disagree?answer_id={answer_id}&uid={uid}")
    String unAgreeAnswer(@Param("answer_id") String answer_id, @Param("uid") String uid);


    /**
     * 举报问题
     *
     * @param question_id
     * @param uid
     * @param reason
     * @return
     */
    @RequestLine("GET /v1.1/question/report?question_id={question_id}&uid={uid}&reason={reason}")
    String reportQuestion(@Param("question_id") String question_id, @Param("uid") String uid, @Param("reason") String reason);


    /**
     * 删除问题
     *
     * @param question_id
     * @param uid
     * @return
     */
    @RequestLine("GET /v1.1/question/del?question_id={question_id}&uid={uid}")
    String delQuestion(@Param("question_id") String question_id, @Param("uid") String uid);


    /**
     * 删除回复
     *
     * @param answer_id
     * @param uid
     * @return
     */
    @RequestLine("GET /v1.1/answer/del?answer_id={answer_id}&uid={uid}")
    String delAnswer(@Param("answer_id") String answer_id, @Param("uid") String uid);

    /**
     * 举报回复
     *
     * @param answer_id
     * @param uid
     * @return
     */
    @RequestLine("GET /v1.1/answer/report?answer_id={answer_id}&uid={uid}&reason={reason}")
    String reportAnswer(@Param("answer_id") String answer_id, @Param("uid") String uid, @Param("reason") String reason);


    /**
     * 报名活动
     */
    @RequestLine("POST /v1.0/attach/activity/sign?uid={uid}&info={info}&attach_id={attach_id}")
    String enlistActivity(@Param("uid") String uid, @Param("info") String info, @Param("attach_id") String attach_id);


    /**
     * 获取活动详情
     */
    @RequestLine("GET /v1.0/attach/get?attach_id={attach_id}")
    String getAttach(@Param("attach_id") String attach_id);


    /**
     * 问题点赞
     */
    @RequestLine("GET /v1.0/question/agree?question_id={question_id}&uid={uid}")
    String agreeQuestion(@Param("question_id") String question_id, @Param("uid") String uid);

    /**
     * 问题点赞
     */
    @RequestLine("GET /v1.0/question/disagree?question_id={question_id}&uid={uid}")
    String disAgreeQuestion(@Param("question_id") String question_id, @Param("uid") String uid);


    /**
     * 问题点赞用户列表
     */
    @RequestLine("GET /v1.0/question/agree/user/list?question_id={question_id}&limit={limit}")
    Result questionAgreeUserList(@Param("question_id") String question_id, @Param("limit") Integer limit);


    /**
     * 昨日标兵，专家排行
     */
    @RequestLine("GET /v1.0/user/rank/yesterday?type={type}")
    String yesterdayRank(@Param("type") String type);



    /**
     * 报价单列表
     */
    @RequestLine("GET /v1.1/quotation/list")
    String quotationList(@QueryMap Map map);





}
