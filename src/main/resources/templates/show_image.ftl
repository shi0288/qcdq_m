<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,spanail=no" name="format-detection">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
<#include "pubmodule/common_top.ftl" />
    <title>
    <#if (question.title)?? && question.title!=''>
        <#if (question.title)?length gt 30 >
        ${question.title?substring(0,30)}
        <#else>
        ${(question.title)!''}
        </#if>
    <#else>
        <#if (question.webtitle)?? && question.webtitle?length gt 30>
        ${question.webtitle?substring(0,30)}
        <#else>
            <#if (question.webtitle)??>
            ${(question.webtitle)!''}
            <#else>
                <#if (question.ycontent)?? && question.ycontent?length gt 30>
                ${question.ycontent?substring(0,30)}
                <#else>
                ${(question.ycontent)!''}
                </#if>
            </#if>
        </#if>
    </#if>-${(data.user.name)!''}-问答-汽车大全
    </title>
    <link rel="stylesheet" href="http://static.qcdqcdn.com/wap/css/base.css">
    <link rel="stylesheet" href="http://static.qcdqcdn.com/wap/css/wenda_answerImg.css">
    <link rel="stylesheet" href="http://static.qcdqcdn.com/wap/css/swiper-3.4.1.min.css">
</head>

<body>
<div class="show_picture" style="display: block;">
    <!-- 标题 -->
<#assign  head_title="查看图片" />
<#include "pubmodule/wenda_pubHead.ftl" />
    <div class="swiper-container">
        <div class="swiper-wrapper">
        <#if type==1 && data.is_html==1>
            <#if (data["pics"]??)>
                <#list data["pics"] as pic>
                    <div class="swiper-slide">
                        <div class="zoom">
                            <img data-src="${(pic)!''}" class="swiper-lazy">
                        </div>
                        <div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
                    </div>
                </#list>
            </#if>
        <#else>
            <#if (data["attachs"]??)>
                <#list data["attachs"] as attach>
                    <div class="swiper-slide">
                        <div class="zoom">
                            <img data-src="${(attach.url)!''}" class="swiper-lazy">
                        </div>
                        <div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
                    </div>
                </#list>
            </#if>
        </#if>
        </div>
    </div>
</div>

<div class="footer">
    <span class="page_num swiper-pagination-fraction">
        <i class="swiper-pagination-current">${(index+1)!'1'}</i>
        /
        <span class="swiper-pagination-total">
        <#if (data["attachs"])??>${(data["attachs"]?size)!''}</#if>
        </span>
    </span>
<#if type??>
    <#if type==1>
        <div><a href="/answer/${data.key}">查看原帖</a></div>
    <#elseif type==2>
        <div><a href="/answer_detail/${data.answer_id}">查看原帖</a></div>
    <#elseif type==3>
        <div><a href="/answer_detail/${data.answer_id}">查看原帖</a></div>
    </#if>
</#if>
    <span class="download"></span>
</div>

<#include "pubmodule/wenda_pubHeadNav.ftl" />

<input type="hidden" value="${(index)!'0'}" id="image_index"/>
<script src="http://static.qcdqcdn.com/wap/js/jquery-3.1.1.min.js"></script>
<script src="http://static.qcdqcdn.com/wap/js/components/swiper.js"></script>
<script src="http://static.qcdqcdn.com/wap/js/wenda_bigImage.js?v=20171130"></script>
<script src="http://static.qcdqcdn.com/wap/js/pinchzoom.js"></script>

</body>
</html>
