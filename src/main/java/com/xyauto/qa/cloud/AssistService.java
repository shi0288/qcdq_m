package com.xyauto.qa.cloud;

import com.mcp.fastcloud.annotation.ServerName;
import com.mcp.fastcloud.util.Result;
import com.xyauto.qa.core.ForwardedForInterceptor;
import feign.Headers;
import feign.Param;
import feign.RequestLine;

import java.io.File;

/**
 * Created by shiqm on 2017/3/9.
 */

@ServerName(value = "QCDQ-QA-SERVER", applyClass = ForwardedForInterceptor.class)
public interface AssistService {

    /**
     * 获取块信息
     * @param name
     * @return
     */
    @RequestLine("GET /v1.0/block/get?name={name}")
    String getHomeBannerList(@Param("name") String name);

    /**
     * 上传单个图片
     * @param attach
     * @return
     */
    @RequestLine("POST /v1.0/attach/upload")
    @Headers("Content-Type: multipart/form-data")
    String uploadFile(@Param("attach") File attach);


    /**
     * 获取块信息
     * @param key
     * @return
     */
    @RequestLine("GET /v1.1/question/key2id?key={key}")
    String getRealQuestionId(@Param("key") String key);


    /**
     * 通过经纬度或者IP定位城市
     * @param lng
     * @param lat
     * @param ip
     * @return
     */
    @RequestLine("GET /v1.1/location?lng={lng}&lat={lat}&ip={ip}")
    String getCity(@Param("lng") String lng, @Param("lat") String lat, @Param("ip") String ip);


    /**
     * 获取省列表
     * @return
     */
    @RequestLine("GET /v1.1/province/list")
    String getProvinceList();


    /**
     * 通过省份ID获取城市列表
     * @return
     */
    @RequestLine("GET /v1.1/city/list?province_id={province_id}")
    String getCityListByProvinceId(@Param("province_id") String province_id);



    /**
     * 通过用户ID获取车款列表
     * @return
     */
    @RequestLine("GET /v1.1/broker/car/list?uid={uid}")
    Result getBrokerCarList(@Param("uid") String uid);


    /**
     * 通过用户ID获取城市列表
     * @return
     */
    @RequestLine("GET /v1.1/broker/city/list?uid={uid}")
    Result getBrokerCityList(@Param("uid") String uid);


    /**
     * 获取验证码
     * @return
     */
    @RequestLine("GET /v1.1/broker/sms/getinquirycode?phone={phone}")
    Result getinquirycode(@Param("phone") String phone);



    /**
     * 验证手机验证码
     * @return
     */
    @RequestLine("GET /v1.1/broker/sms/verifyinquirycode?phone={phone}&code={code}")
    Result verifyinquirycode(@Param("phone") String phone,@Param("code") String code);



    /**
     * 确认报价单
     * @return
     */
    @RequestLine("GET /v1.1/broker/quotation/agree?comment_id={comment_id}&uid={uid}")
    Result quotationAgree(@Param("comment_id") String comment_id,@Param("uid") String uid);

    /**
     * 通过用户ID获取车顾问手机
     * @return
     */
    @RequestLine("GET /v1.1/broker/service/phone?uid={uid}")
    Result getBrokerPhone(@Param("uid") String uid);


    /**
     * 首页推荐
     * @return
     */
    @RequestLine("GET /question/list/complex?max={max}&uid={uid}")
    String complex(@Param("max")String max,@Param("uid")String uid);

}
