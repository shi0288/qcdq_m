<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
<#include "pubmodule/common_top.ftl" />
    <script src="${jsPath}/sliderMenu.js"></script>
    <title>汽车大全-报价单|${(comment.quotation[0].content[0].car_name)!''}</title>
    <link rel="stylesheet" href="${cssPath}/base.css">
    <link rel="stylesheet" href="${cssPath}/wenda_offering.css">
</head>

<body>
<!-- 标题 -->
<#assign  head_title="报价单" />
<#include "pubmodule/wenda_pubHead.ftl" />
<div class="container">
    <!-- 标题 -->
    <img src="<#if (comment.quotation[0].content[0].imgqr)?? >${(comment.quotation[0].content[0].imgqr)!''}<#else>${(comment.quotation[0].content[0].img)!''}</#if>" alt="">
</div>

<#if (uid)?? && comment.uid==uid>
    <#if comment.quotation[0].content[0].agree==0>
    <div class="pub_footer">
        <input type="button" track="m_quotation_bjorderclick"  id="submit" tagVal="${(comment.comment_id)!''}" value="接近我的预期，希望和TA联系">
    </div>
    <#else>
    <div class="fix_person" style="bottom: 0px;">
        <p>车顾问已取得您的联系方式，您也可以主动联系TA</p>
        <dl class="clearfix person">
            <dt>
                <img onerror="nofindUser()" src="${(user.avatar)!'/img/user_default_title.png'}" class="expert_photo">
                <span class="person_sign"></span>
            </dt>
            <dd class="per_name">
            ${(user.name)!''}
            </dd>
            <dd class="btn_phone">
                <a href="tel: ${(brokerPhone)!''}">致电车顾问</a>
            </dd>
        </dl>
    </div>
    </#if>
</#if>

<#include "pubmodule/wenda_pubHeadNav.ftl" />


<script src="${jsPath}/shareWenda.js"></script>


<input type="hidden" id="friend_title" value="汽车大全-报价单|${(comment.quotation[0].content[0].car_name)!''}"/>
<input type="hidden" id="friend_img" value="<#if (comment.quotation[0].content[0].imgqr)?? >${(comment.quotation[0].content[0].imgqr)!''}<#else>${(comment.quotation[0].content[0].img)!''}</#if>"/>
<input type="hidden" id="friend_link" value="http://ask.m.qichedaquan.com/offering?comment_id=${(comment.comment_id)!''}"/>

<input type="hidden" id="people_title" value="汽车大全-报价单"/>
<input type="hidden" id="people_desc" value="${(comment.quotation[0].content[0].car_name)!''}"/>
<input type="hidden" id="people_img" value="<#if (comment.quotation[0].content[0].imgqr)?? >${(comment.quotation[0].content[0].imgqr)!''}<#else>${(comment.quotation[0].content[0].img)!''}</#if>"/>
<input type="hidden" id="people_link" value="http://ask.m.qichedaquan.com/offering?comment_id=${(comment.comment_id)!''}"/>

<input type="hidden" id="qq_title" value="汽车大全-报价单"/>
<input type="hidden" id="qq_desc" value="${(comment.quotation[0].content[0].car_name)!''}"/>
<input type="hidden" id="qq_img" value="<#if (comment.quotation[0].content[0].imgqr)?? >${(comment.quotation[0].content[0].imgqr)!''}<#else>${(comment.quotation[0].content[0].img)!''}</#if>"/>
<input type="hidden" id="qq_link" value="http://ask.m.qichedaquan.com/offering?comment_id=${(comment.comment_id)!''}"/>

<input type="hidden" id="weibo_title" value="汽车大全-报价单|${(comment.quotation[0].content[0].car_name)!''} 网页链接 分享自 @行圆汽车大全"/>
<input type="hidden" id="weibo_desc" value="${(comment.quotation[0].content[0].car_name)!''}"/>
<input type="hidden" id="weibo_img" value="<#if (comment.quotation[0].content[0].imgqr)?? >${(comment.quotation[0].content[0].imgqr)!''}<#else>${(comment.quotation[0].content[0].img)!''}</#if>"/>
<input type="hidden" id="weibo_link" value="http://ask.m.qichedaquan.com/offering?comment_id=${(comment.comment_id)!''}"/>

<input type="hidden" id="qZone_title" value="汽车大全-报价单"/>
<input type="hidden" id="qZone_desc" value="${(comment.quotation[0].content[0].car_name)!''}"/>
<input type="hidden" id="qZone_img" value="<#if (comment.quotation[0].content[0].imgqr)?? >${(comment.quotation[0].content[0].imgqr)!''}<#else>${(comment.quotation[0].content[0].img)!''}</#if>"/>
<input type="hidden" id="qZone_link" value="http://ask.m.qichedaquan.com/offering?comment_id=${(comment.comment_id)!''}"/>
<script src="${jsPath}/wenda_offering.js"></script>
</body>
</html>
