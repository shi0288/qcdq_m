<!DOCTYPE html>
<html>
<head>
    <title>汽车问答车顾问-【${user["name"]}<#if (user.word)?? && user.word!=''> ${(user.word)!''} </#if>】-手机汽车大全</title>
    <meta name="description" content="汽车问答车顾问-【${user["name"]}<#if (user.word)?? && user.word!=''> ${(user.word)!''} </#if>】-手机汽车大全"/>
    <meta name="keywords" content="汽车大全问答车顾问,${user["name"]},<#if (user.word)?? && user.word!=''>${(user.word)!''},</#if>手机汽车大全问答"/>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
<#include "pubmodule/common_top.ftl" />
    <script src="${jsPath}/wenda_hiswenda.js"></script>
    <link rel="stylesheet" href="${cssPath}/mywenda_biaobing.css">
    <script src="${jsPath}/wenda_answer.js"></script>
    <link rel="stylesheet" href="${cssPath}/swiper-3.4.1.min.css">
    <script src="${jsPath}/components/swiper.js"></script>
    <link rel="stylesheet" href="${cssPath}/jquery.fancybox.css">
</head>
<body>
<div class="wrap">
    <!-- 头部 -->
<#assign  head_title="我的问答" />
<#include "pubmodule/wenda_pubHead.ftl" />
    <!--标兵问答-->
    <div class="ans_biaobing">
        <dl class="clearfix">
            <dt>
                <img onerror="nofindUser()" src="${(user.avatar)!'/img/user_default_title.png'}" class="expert_photo">
                <span class="ans_agent_sign"></span>
            </dt>
            <dd class="ans_expert_news ans_first_dd">
                <span class="ans_expert_name">${(user.name)!''}</span>
                <span class="ans_expert_city">${(user.citys[0].name)!''}</span>
            </dd>
            <dd class="ans_expert_news">${(user.word)!''}</dd>
            <dd class="ans_expert_news">
                <span onclick="window.location.href='/integray'" class="integral">积分：<i><#if (userPoints.sum)??>${userPoints.sum?string('#.##')} </#if></i></span>
                <span onclick="window.location.href='/rank'" class="ans_total">今日答题：<i>${(user.day_answer_count)!''}</i></span>
            </dd>
        </dl>
    </div>

    <!--提问、回答、关注、待解决-->
    <div class="swiper-container ans_expert_answer">
        <ul class="ans_expert_type mywenda_expert_type">
            <li class="ans_active"><a href="javascript:void(0);">我发表的</a></li>
            <li><a href="javascript:void(0);">我回复的</a></li>
            <li><a href="javascript:void(0);">我关注的</a></li>
            <li><a href="javascript:void(0);">待解决</a></li>
        </ul>
        <div class="swiper-wrapper ans_expert_main">
            <!--提问-->
            <div class="swiper-slide ans_expert_content">
            <#include "fragment/question_user.ftl" />
            <#include "fragment/question_user_bottom.ftl" />
            </div>
            <!--回答-->
            <div class="swiper-slide ans_expert_content">
            <#include "fragment/answer_user.ftl" />
            <#include "fragment/answer_user_bottom.ftl" />
            </div>
            <!--关注-->
            <div class="swiper-slide ans_expert_content">
            <#include "fragment/favorite_user.ftl" />
            <#include "fragment/favorite_user_bottom.ftl" />
            </div>
            <!--待解决-->
            <div class="swiper-slide ans_expert_content">
            <#include "fragment/special_user.ftl" />
            <#include "fragment/special_user_bottom.ftl" />
            </div>
        </div>
    </div>

<#assign cur_module_name="我的问答" />
<#include "pubmodule/wenda_pubBottomPerson.ftl" />

</div>
<#include "pubmodule/wenda_pubHeadNav.ftl" />


<!-- 回到顶部 -->
<div class="go_top" id="goTop"><span></span> <i></i></div>
<input type="hidden" value="${(user.uid)!''}" name="uid" id="uid"/>

<!-- 遮罩层 -->
<div class="mask"></div>
<!-- 右侧省市遮罩层 -->
<div class="mask_area">
    <div class="mask"></div>
    <div class="mask_jt"></div>
</div>

<input type="hidden" value=""  id="question_id"/>
<input type="hidden" value="" id="attachs_val" />
<input type="hidden" value="${(clientCityId)!''}" id="city_id"/>

<!-- load图标弹层 -->
<div class="load_mask">
    <span></span>
    <img src="http://static.qcdqcdn.com/wap/img/load_w.png">
</div>
<script src="${jsPath}/jquery.circliful.js"></script>

<#include  "fragment/user_comment.ftl"  />


<input  type="hidden"  id="friend_title"  value="给你推荐这个汽车大全${(user.name)!''}，向Ta提问吧" />
<input  type="hidden"  id="friend_img"  value="${(user.avatar)!''}" />
<input  type="hidden"  id="friend_link"  value="https://h5.qichedaquan.com/ask/user?uid=${(user.uid)!''}" />

<input  type="hidden"  id="people_title"  value="汽车问答标兵${(user.name)!''}在汽车大全问答的主页" />
<input  type="hidden"  id="people_desc"  value="点击向他提问吧" />
<input  type="hidden"  id="people_img"  value="${(user.avatar)!''}" />
<input  type="hidden"  id="people_link"  value="https://h5.qichedaquan.com/ask/user?uid=${(user.uid)!''}" />

<input  type="hidden"  id="qq_title"  value="汽车问答标兵${(user.name)!''}在汽车大全问答的主页" />
<input  type="hidden"  id="qq_desc"  value="点击向他提问吧" />
<input  type="hidden"  id="qq_img"  value="${(user.avatar)!''}" />
<input  type="hidden"  id="qq_link"  value="https://h5.qichedaquan.com/ask/user?uid=${(user.uid)!''}" />

<input  type="hidden"  id="weibo_title"  value="汽车问答标兵${(user.name)!''}在汽车大全问答的主页 向他提问 网页链接 分享自 @行圆汽车大全" />
<input  type="hidden"  id="weibo_desc"  value="点击向他提问吧" />
<input  type="hidden"  id="weibo_img"  value="${(user.avatar)!''}" />
<input  type="hidden"  id="weibo_link"  value="https://h5.qichedaquan.com/ask/user?uid=${(user.uid)!''}" />

<input  type="hidden"  id="qZone_title"  value="汽车问答标兵${(user.name)!''}在汽车大全问答的主页" />
<input  type="hidden"  id="qZone_desc"  value="点击向他提问吧" />
<input  type="hidden"  id="qZone_img"  value="${(user.avatar)!''}" />
<input  type="hidden"  id="qZone_link"  value="https://h5.qichedaquan.com/ask/user?uid=${(user.uid)!''}" />


</body>
<script type="text/javascript" src="${jsPath}/jquery.fancybox.js"></script>
<script type="text/javascript" src='${jsPath}/wdhtml/wenda_my.js'></script>
</html>