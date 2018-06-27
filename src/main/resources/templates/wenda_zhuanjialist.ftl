<!DOCTYPE html>
<html>
<head>
    <title>汽车行业大咖为您解答汽车相关知识-问答-手机汽车大全</title>
    <meta name="description" content="汽车大全网汇集了行业内一线领域专家，涉及汽车各个品牌、车系等领域，为您的爱车提供专业、靠谱专业知识—汽车大全问答。" />
    <meta name="keywords" content="汽车行业专家、汽车大全专家团队、行圆汽车大全、专家团队简介" />
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
    <#include "pubmodule/common_top.ftl" />
    <link rel="stylesheet" href="${cssPath}/wenda_zhuanjialist.css">
    <link rel="stylesheet" href="${cssPath}/swiper-3.4.1.min.css"/>
</head>
<body>
<#include "pubmodule/wenda_pubHeadNav.ftl" />
<div class="wrap">
    <!-- 标题 -->
<#assign  head_title="问答" />
<#include "pubmodule/wenda_pubHead.ftl" />
    <!--banner-->
    <div class="expertList_banner">
        <img src="/img/expertList_banner.jpg">
    </div>
    <!--特邀专家-->
    <div class="invite">
        <p class="line"></p>
        <h3 class="invite_expert">特邀专家</h3>
        <div class="swiper-container invite_expert_box">
            <ul class="swiper-wrapper invite_expert_ul clearfix">
            <#list  expertsRes as e>
                <li class="swiper-slide invite_li">
                    <dl>
                        <a href="javascript:void(0);">
                            <dt>
                                <img  class="click_img" onerror="nofind()" tagVal="./user?uid=${e.uid}"
                                     src="${(e.avatar)!'/img/user_default_title.png'}">
                                <img src="/img/expert.png" class="expert_sign">
                            </dt>
                            <dd class="invite_expert_name">${(e.name)!''}</dd>
                            <dd>
                                <button onclick="window.location.href='./publish?special_id=${e.uid}'"
                                        class="invite_answer_btn">提问
                                </button>
                            </dd>
                        </a>
                    </dl>
                    <span class="arrow-down"></span>
                    <div class="sc-content">
                        <span>${(e.word)!''}</span>
                        <p>${(e.intro)!''}</p>
                    </div>
                </li>
            </#list>
            </ul>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="expert_news">
                <p class="expert_news_text1"></p>
                <span class="left_sign"></span>
                <p class="expert_news_text2">
                </p>
                <span class="right_sign"></span>
            </div>
        </div>
    </div>

    <!--专家招募-->
    <div class="expert_recruit">
        <img src="/img/expert_recruit.png" onclick="window.location.href='https://h5.qichedaquan.com/h5_special/expertHeroPost.html'" class="recruit_img">
        <div class="list">
            <p class="line"></p>
            <h3 class="invite_expert">专家列表</h3>
            <ul class="list_content clearfix">
                <#list userRes.list as user>
                    <li>
                        <a href="javascript:void(0);">
                            <img  onerror="nofind()" onclick="window.location.href='./user?uid=${user.uid}'" src="${(user.avatar)!'/img/user_default_title.png'}">
                            <span class="expert_name">${(user.name)!''}</span>
                            <span class="expert_position">${(user.word)!''}</span>
                            <button onclick="window.location.href='./publish?special_id=${user.uid}'"
                                    class="answer_btn">提问</button>
                        </a>
                    </li>
                </#list>
            </ul>
        </div>
    </div>
    <!--footer-->
    <div class="video_fte">
        <p><span class="colora4">©&nbsp;&nbsp;2017&nbsp;&nbsp;汽车大全</span></p>
    </div>
</div>
</body>
<script src='${jsPath}/swiper-3.4.1.min.js'></script>
<script src='${jsPath}/zhuanjialist.js'></script>

</html>
