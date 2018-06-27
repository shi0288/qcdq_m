package com.xyauto.qa.cloud;

import com.mcp.fastcloud.annotation.ServerName;
import feign.Param;
import feign.RequestLine;

/**
 * Created by shiqm on 2017-05-22.
 */

@ServerName(value = "qcdq-car-server")
public interface CarService {

    /**
     * 获取车系信息
     * @return
     */
    @RequestLine("GET /carparm/queryCarparam?serialid={serialid}&salestate=1&version=1.0&method=car.querySerialCarYearGeneral")
    String getHotmaster(@Param("serialid") String serialid);



    /**
     * 获取车款信息
     * @return
     */
    @RequestLine("GET /carmaster/seriallist/{id}?version=1.0&method=car.getmasterserial")
    String getCarmaster(@Param("id") String id);


    /**
     * 获取品牌信息
     * @return
     */
    @RequestLine("GET /carmaster/masterlist?version=1.0&method=car.getallmaster&nostopsale=1")
    String getCarBrand();

}
