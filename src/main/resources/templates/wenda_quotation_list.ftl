<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
    <title>汽车问答－手机汽车大全</title>
    <meta name="description"
          content="汽车大全问答，行圆汽车大全汽车问答专区，包含各大品牌各类汽车问答，权威专家告诉您如何选车买车，汽车保养及汽车使用常见问题。上行圆汽车大全汽车问答，让汽车生活更简单！"/>
    <meta name="keywords" content="汽车问答，如何选车买车，汽车如何保养，汽车常见问题，汽车大全"/>
<#include "pubmodule/common_top.ftl" />
    <link rel="stylesheet" href="${cssPath}/wenda_quotation_list.css">
    <link rel="stylesheet" href="${cssPath}/jquery.fancybox.css">
</head>

<body>

<#include "pubmodule/wenda_pubHeadNav.ftl" />
<!-- 问题库 -->
<div class="issues_page">
    <!-- 标题 -->
<#assign  head_title="内容库" />
<#include "pubmodule/wenda_pubHead.ftl" />

    <!-- nav -->
    <!--有封面时候-->
    <div class="subject">
        <a href="javascript:void(0);" style="background-image: url(http://img1.qcdqcdn.com/group1/M00/17/56/o4YBAFp1HuuAS7F0AAhSMRc6hco791.png)">
        </a>
        <div class="sub_des">
                <span class="hezi">
                ${(questionRes.count)!'0'}
                </span>
            <span class="fire">
            ${subject.pv}
                </span>
            <span  data-img="http://img1.qcdqcdn.com/group1/M00/17/56/o4YBAFp1HuuAS7F0AAhSMRc6hco791.png"
                   data-title="#买车那些事#NO.33买车看起来是非常迷茫的事，毕竟买辆车... --福禄小金刚的评论"
                   data-weibo=""
                   data-sub="sssssssssssssssssssssssss"
                   data-url="http://ask.m.qichedaquan.com/quotations"  class="sub_share" id="share">
                    分享
             </span>
        </div>
    </div>

<#include "fragment/comment.ftl" />
<#include "fragment/address.ftl" />
    <input type="hidden" value="" jump_page="2" id="question_id"/>
    <input type="hidden" value="" id="attachs_val"/>
    <input type="hidden" value="${(clientCityId)!''}" id="city_id"/>
    <div class="quo_list">
    <#include "fragment/quotation_list.ftl" />
    </div>

<#if questionRes.has_more==1>
    <div class="load_more_module">
        <a href="javascript:void(0);" tagVal="${(questionRes.next_max)!''}" class="load_user_more">加载更多<img src="http://ask.m.qichedaquan.com/img/down.png"></a>
        <a href="javascript:void(0);" class="loading"><span></span><span></span><span></span></a>
        <a href="javascript:void(0);" class="no_more">没有更多了...</a>
    </div>
</#if>

<#assign cur_module_name="内容库" />
<#include "pubmodule/wenda_pubBottom.ftl" />
<#include "pubmodule/wenda_levitate.ftl" />
</div>

<!-- 回到顶部 -->
<div class="go_top" id="goTop"><span></span> <i></i></div>

<!-- 遮罩层 -->
<div class="mask_area">
    <div class="mask"></div>
    <div class="mask_jt"></div>
</div>

<!-- 遮罩层 -->
<div class="mask"></div>


<script src="${jsPath}/wenda_issues.js"></script>
<script src="${jsPath}/jquery.circliful.js"></script>
<script src="${jsPath}/jquery.fancybox.js"></script>
<script src="${jsPath}/shareWenda.js"></script>
<script src="${jsPath}/wenda_quotation_list.js"></script>

<!-- 底部分享弹层-->
<div class="zsh_shareLayer">
    <div class="share_box clearfix">
    </div>
    <button type="button" class="zsh_cancel">取消</button>
</div>

<!-- 微信分享如果是safari浏览器-->
<div class="zsh_sf_mask"></div>
<div class="zsh_sf_layer wx_share_tip">
    <span class="zsh_sf_arrowDown"></span>
    <span class="zsh_sf_wx"></span>
    <p>1、在Safari浏览器中点击“<img src="/img/share_img1.jpg" class="share_img1">”</p>
    <p>2、在弹出的浮层中点击更多“<img src="/img/share_img2.jpg" class="share_img2">”</p>
    <p>3、微信设置为“<img src="/img/share_img3.jpg" class="share_img3">”状态</p>
    <p>4、完成以上操作即可查看“微信”图标</p>
    <p>
        <img src="/img/share_img4.jpg" class="share_img4">
        <img src="/img/share_img4.jpg" class="share_img4">
        <img src="/img/share_img5.jpg" class="share_img5">
        <img src="/img/share_img2.jpg" class="share_img2">
        点击完成分享
    </p>
</div>

<div class="share_wenda">
    <input type="text" class="title">
    <input type="text" class="url">
    <input type="text" class="qq">
    <input type="text" class="weibo">
    <input type="text" class="pic">
</div>


</body>
</html>
