<!DOCTYPE html>
<html>
<head>
    <title>汽车问答专家-【${user["name"]}<#if (user.word)?? && user.word!=''> ${(user.word)!''} </#if>】-手机汽车大全</title>
    <meta name="description" content="汽车问答专家-【${user["name"]}<#if (user.word)?? && user.word!=''> ${(user.word)!''} </#if>】-手机汽车大全"/>
    <meta name="keywords" content="汽车大全问答专家,${user["name"]},<#if (user.word)?? && user.word!=''>${(user.word)!''},</#if>手机汽车大全问答"/>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
    <#include "pubmodule/common_top.ftl" />
    <script src='${jsPath}/swiper-3.4.1.min.js'></script>
    <script src="${jsPath}/wenda_hiswenda.js"></script>
    <link rel="stylesheet" href="${cssPath}/hiswenda_zhuanjia.css">
    <script src="${jsPath}/wenda_answer.js"></script>
    <link rel="stylesheet" href="${cssPath}/swiper-3.4.1.min.css">
    <script src="${jsPath}/components/swiper.js"></script>
    <link rel="stylesheet" href="${cssPath}/jquery.fancybox.css">
</head>
<body>
<div class="wrap">
    <!-- 头部 -->
<#assign  head_title="TA的问答" />
<#include "pubmodule/wenda_pubHead.ftl" />

    <!--问答专家-->
    <div class="ans_Expert">
        <dl class="clearfix">
            <dt>
                <img  onerror="nofindUser()" src="${(user.avatar)!'/img/user_default_title.png'}" class="expert_photo">
            <#if user.is_official==1>
                <span class="ans_guanfang_sign"></span>
            <#else>
                <span class="ans_expert_sign"></span>
            </#if>
            </dt>
            <dd class="ans_expert_news ans_first_dd">
                <span class="ans_expert_name">${(user.name)!''}</span>
                <span class="ans_expert_city">${(user.citys[0].name)!''}</span>
                <img src="/img/wenda_share.png" class="ans_expert_share">
            </dd>
            <dd class="ans_expert_news">${(user.word)!''}</dd>
            <dd class="ans_expert_news">
            <#if (user.answer_count)?? && (user.answer_count>=10)>
                总计答题：<span class="ans_total">${(user.answer_count)!''}</span>
                本周答题：<span class="ans_thisweek">${(user.week_answer_count)!''}</span>
            </#if>
            </dd>
        </dl>
        <p class="ans_expert_introduce ans_over">
        ${(user.intro)!''}
        </p>
    </div>
    <!--提问回答-->
    <div class="swiper-container ans_expert_answer">
        <ul class="ans_expert_type">
            <li class="ans_active"><a href="javascript:void(0);">TA发表的</a></li>
            <li><a href="javascript:void(0);">TA回复的</a></li>
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
        </div>
    </div>

    <!--向TA提问按钮-->
    <div class="ans_ask">
        <button track="xym_home_asknow" class="ans_ask_btn" onclick="window.location.href='./publish?special_id=${user.uid}'">向TA提问</button>
    </div>

<#assign cur_module_name="TA的问答" />
<#include "pubmodule/wenda_pubBottomPerson.ftl" />
</div>

<#include "pubmodule/wenda_pubHeadNav.ftl" />


<!-- 回到顶部 -->
<div class="go_top" id="goTop"><span></span> <i></i></div>
<input type="hidden" value="${(user.uid)!''}" name="uid" id="uid"/>
<script type="text/javascript" src="${jsPath}/jquery.fancybox.js"></script>

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
<script src="${jsPath}/jquery.fancybox.js"></script>

<#include  "fragment/user_comment.ftl"  />

<!-- 分享弹层-->
<div class="zsh_shareLayer">
    <div class="share_box clearfix">
    </div>
    <button type="button" class="zsh_cancel">取消</button>
</div>

<!-- 微信分享如果是safari浏览器-->
<div class="zsh_sf_mask"></div>
<div class="zsh_sf_layer">
    <span class="zsh_sf_arrowDown"></span>
    <span class="zsh_sf_wx"></span>
    <p>1、在Safari浏览器中点击“<img src="/img/share_img1.jpg" class="share_img1">”</p>
    <p>2、在弹出的浮层中点击更多“<img src="/img/share_img2.jpg" class="share_img2">”</p>
    <p>3、微信设置为“<img src="/img/share_img3.jpg" class="share_img3">”状态</p>
    <p>4、完成以上操作即可查看“微信”图标</p>
    <p>
        <img src="/img/share_img4.jpg" class="share_img4">
        <img src="/img/share_img4.jpg" class="share_img4">
        <img src="/img/share_img5.jpg" class="share_img5" >
        <img src="/img/share_img2.jpg" class="share_img2">
        点击完成分享
    </p>
</div>

<!--半透明遮罩-->
<div class="mask2"></div>


<!-- 分享参数  微信 h5-->
<input id="weixinid" type="hidden" value="${base}/user?uid=${(user.uid)!''}">
<!-- 分享参数  qq-->
<div id="share_qq" style="display: none;">
    <input class="sharetitleid" type="hidden" value="给你推荐这个汽车大全问答专家${(user.name)!''}">
    <input class="sharelurlid" type="hidden" value="${base}/user?uid=${(user.uid)!''}">
    <input class="sharecontentid" type="hidden" value="点击向他提问吧">
    <input class="sharepicid" type="hidden" value="<#if (question.attachs)?? && (question.attachs?length>0)>${(question.attachs[0])!''}</#if>">
</div>


<!-- 分享参数  qq空间-->
<div id="share_qq_zone" style="display: none;">
    <input class="sharetitleid" type="hidden" value="给你推荐这个汽车大全问答专家${(user.name)!''}">
    <input class="sharelurlid" type="hidden" value="${base}/user?uid=${(user.uid)!''}">
    <input class="sharecontentid" type="hidden" value="给你推荐这个汽车大全问答专家${(user.name)!''},向Ta提问吧">
    <input class="sharepicid" type="hidden" value="<#if (question.attachs)?? && (question.attachs?length>0)>${(question.attachs[0])!''}</#if>">
</div>
<!-- 分享参数  sina-->
<div id="share_sina" style="display: none;">
    <input class="sharetitleid" type="hidden" value="给你推荐@行圆汽车大全问答专家${(user.name)!''}">
    <input class="sharelurlid" type="hidden" value="${base}/user?uid=${(user.uid)!''}">
    <input class="sharecontentid" type="hidden" value="给你推荐@行圆汽车大全问答专家${(user.name)!''},向他提问">
    <input class="sharepicid" type="hidden" value="<#if (question.attachs)?? && (question.attachs?length>0)>${(question.attachs[0])!''}</#if>">
</div>l

<script src="${jsPath}/shareWenda.js"></script>

<input  type="hidden"  id="friend_title"  value="给你推荐这个汽车大全问答专家${(user.name)!''}，向Ta提问吧" />
<input  type="hidden"  id="friend_img"  value="${(user.avatar)!''}" />
<input  type="hidden"  id="friend_link"  value="https://h5.qichedaquan.com/ask/user?uid=${(user.uid)!''}" />

<input  type="hidden"  id="people_title"  value="汽车专家${(user.name)!''}在汽车大全问答的主页" />
<input  type="hidden"  id="people_desc"  value="点击向他提问吧" />
<input  type="hidden"  id="people_img"  value="${(user.avatar)!''}" />
<input  type="hidden"  id="people_link"  value="https://h5.qichedaquan.com/ask/user?uid=${(user.uid)!''}" />

<input  type="hidden"  id="qq_title"  value="汽车专家${(user.name)!''}在汽车大全问答的主页" />
<input  type="hidden"  id="qq_desc"  value="点击向他提问吧" />
<input  type="hidden"  id="qq_img"  value="${(user.avatar)!''}" />
<input  type="hidden"  id="qq_link"  value="https://h5.qichedaquan.com/ask/user?uid=${(user.uid)!''}" />

<input  type="hidden"  id="weibo_title"  value="给你推荐这个汽车大全问答专家${(user.name)!''} 向他提问 网页链接 分享自 @行圆汽车大全" />
<input  type="hidden"  id="weibo_desc"  value="点击向他提问吧" />
<input  type="hidden"  id="weibo_img"  value="${(user.avatar)!''}" />
<input  type="hidden"  id="weibo_link"  value="https://h5.qichedaquan.com/ask/user?uid=${(user.uid)!''}" />

<input  type="hidden"  id="qZone_title"  value="汽车专家${(user.name)!''}在汽车大全问答的主页" />
<input  type="hidden"  id="qZone_desc"  value="点击向他提问吧" />
<input  type="hidden"  id="qZone_img"  value="${(user.avatar)!''}" />
<input  type="hidden"  id="qZone_link"  value="https://h5.qichedaquan.com/ask/user?uid=${(user.uid)!''}" />



</body>

</html>
