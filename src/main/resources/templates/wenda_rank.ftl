<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
<#include "pubmodule/common_top.ftl" />
    <title>汽车大全-我的答题数</title>
    <link rel="stylesheet" href="http://static.qcdqcdn.com/wap/css/wenda_rank.css">
</head>
<body>
<#include "pubmodule/wenda_pubHeadNav.ftl" />
<!-- 标题 -->
<#assign  head_title="我的答题数" />
<#include "pubmodule/wenda_pubHead.ftl" />

<!-- 答题数 -->
<div class="rank_page">
    <!-- 答题数 -->
    <div class="answer_msg">
        <dl class="clearfix">
            <dt>
                <a href="#">
                    <img onerror="nofind()" src="${(user.avatar)!'/img/user_default_title.png'}">
                </a>
            <#if user.type==2>
                <i class="zhuanjia"></i>
            <#elseif user.type==1>
                <i class="biaobing"></i>
            </#if>
            </dt>
            <dd>
                <p class="name">${(user.name)!''}</p>
                <p class="num">
                    总计答题数：<span>${(user.answer_count)!''}</span>
                    本周答题：<span>${(user.week_answer_count)!''}</span>
                </p>
            </dd>
        </dl>
        <#if !(user.yesterday_rank)?? || user.yesterday_rank==0>
            <!-- 用户未上榜显示 -->
            <#if user.type==1 || user.type==2>
                <div class="wsb" style="display: block;" ></div>
            </#if>
        <#else>
            <!-- 用户上榜显示 -->
            <div class="shangbang"><span>NO.${user.yesterday_rank}</span></div>
        </#if>
        <ul class="clearfix">
            <li><span>${(user.day_answer_count)!''}</span>今日答题</li>
            <li><span>${(user.day_first_answer_count)!''}</span>今日抢0</li>
            <li><span>${(user.yesterday_answer_count)!''}</span>昨日答题</li>
            <li><span>${(user.yesterday_first_answer_count)!''}</span>昨日抢0</li>
        </ul>
    </div>
    <!-- 排行榜 -->
    <div class="rank_area">
        <h2 class="rank_title">昨日答题排行榜</h2>
        <ul class="rank_tab clearfix">
            <#if user.is_official==1 || user.type==2 >
                <li  class="active"><a href="#">专家</a></li>
                <li><a href="#">标兵</a></li>
                <#else>
                    <li ><a href="#">专家</a></li>
                    <li  class="active"><a href="#">标兵</a></li>
            </#if>

        </ul>
        <div class="rank_list clearfix">
            <ul class="zhuanjia_list"   <#if user.is_official==1 || user.type==2 > style="display: block" <#else>style="display: none"  </#if>  >
            <#if (expertRank)??>
                <#list expertRank as e>
                    <li class="clearfix"><em>${e_index+1}</em>
                        <p><img src="${(e.user.avatar)!''}" alt=""><span>${(e.user.name)!''}</span><i>${(e.question_count)!''}</i></p>
                    </li>
                </#list>
            </#if>
            </ul>
            <ul class="biaobing_list" <#if user.is_official==1 || user.type==2 > style="display: none" <#else>style="display: block"  </#if>  >
            <#if (biaoRank)??>
                <#list biaoRank as e>
                    <li class="clearfix"><em>${e_index+1}</em>
                        <p><img src="${(e.user.avatar)!''}" alt=""><span>${(e.user.name)!''}</span><i>${(e.question_count)!''}</i></p>
                    </li>
                </#list>
            </#if>
            </ul>
        </div>
    </div>

    <!-- 间隔条 -->
    <div class="bg_bar"></div>

    <div class="small_nav">
        <a href="http://m.qichedaquan.com/">首页</a><img src="http://static.qcdqcdn.com/wap/img/back_rightjt.png">
        <a href="http://i.m.qichedaquan.com/">个人中心</a><img src="http://static.qcdqcdn.com/wap/img/back_rightjt.png">
        <a href="http://ask.m.qichedaquan.com/user">我的问答</a><img src="http://static.qcdqcdn.com/wap/img/rightjt.png">
        <span>我的答题数</span>
    </div>

    <!-- 底部版权 -->
    <div class="video_fte">
        <p><span class="colora4">©&nbsp;&nbsp;2017&nbsp;&nbsp;汽车大全</span></p>
    </div>

</div>

<!-- 回到顶部 -->
<div class="go_top" id="goTop"><span></span> <i></i></div>
<script src="http://static.qcdqcdn.com/wap/js/wenda_rank.js"></script>
</body>

</html>
