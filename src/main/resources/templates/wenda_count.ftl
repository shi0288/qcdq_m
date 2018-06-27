<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<#include "pubmodule/common_top.ftl" />
    <title>汽车大全</title>
    <link rel="stylesheet" href="http://static.qcdqcdn.com/wap/css/base.css">
    <link rel="stylesheet" href="http://static.qcdqcdn.com/wap/css/wenda_count.css">
</head>
<body>
<div class="header">
    我的答案统计
    <a href="/loginout">退出</a>
</div>
<div class="person">
    <div class="title">
        <span>答题统计日报</span>
    </div>
    <div class="user_icon">
        <a href="" class="user_photo">
            <img onerror="nofindUser()" src="${(user.avatar)!'/img/user_default_title.png'}">
        </a>
    <#if user.is_official==1>
        <img src="/img/guangfang1.png" class="level_title">
    <#else>
        <#if user.type==2>
            <img src="/img/expert.png" class="level_title">
        <#elseif user.type==1>
            <img src="/img/biaobing.png" class="level_title">
        <#elseif user.type==3>
            <img src="/img/guwen.png" class="level_title">
        </#if>
    </#if>
    </div>
    <div class="user_info">
        <p class="name">${(user.name)!''}</p>
        <p class="tote">总计答题：${(report.answer_count)!''}</p>
        <p class="week">本周答题：${(report.week_answer_count)!''}</p>
        <p class="effective">8-16点回复≥30字的有效答题数：${(report.today30_8_16)!''}</p>
        <p class="zero">抢0回复的有效答题数：${(report.day_first_answer_count)!''}</p>
    </div>
</div>
<ul class="content">
    <li>
        <span>统计</span><span>昨日</span><span>今日</span>
    </li>
    <li>
        <span>有效答题数</span><span>${(report.yesterday_answer_count)!''}</span><span>${(report.day_answer_count)!''}</span>
    </li>
    <li>
        <span>8-16点有效答题数</span><span>${(report.yesterday_8_16)!''}</span><span>${(report.today_8_16)!''}</span>
    </li>
    <li>
        <span>16-23点有效答题数</span><span>${(report.yesterday_16_23)!''}</span><span>${(report.today_16_23)!''}</span>
    </li>
    <li>
        <span>8-16点回复≥30字的有效答题数</span><span>${(report.yesterday30_8_16)!''}</span><span>${(report.today30_8_16)!''}</span>
    </li>
    <li>
        <span>16-23点回复≥30字的有效答题数</span><span>${(report.yesterday30_16_23)!''}</span><span>${(report.today30_16_23)!''}</span>
    </li>
    <li>
        <span>抢0回复的有效答题数</span><span>${(report.yesterday_first_answer_count)!''}</span><span>${(report.day_first_answer_count)!''}</span>
    </li>
</ul>
<div class="footer">
    注： <br>
    问题提取时间：今日0点-24点； <br>
    回答提取时间：今日0点-次日0点30分。
</div>
</body>
</html>