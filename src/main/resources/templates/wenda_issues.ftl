<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
    <title><#if (series_name)?? && (category_name)?? && (category_name !='全部类型')>${(series_name)!''}${(category_name)!''}
        相关问题<#elseif (series_name)??>${(series_name)!''}
        相关问题<#elseif (category_name)?? && (category_name !='全部类型')>${(category_name)!''}相关问题<#else>汽车问答</#if>
        －手机汽车大全</title>
    <meta name="description"
          content="汽车大全问答，行圆汽车大全汽车问答专区，包含各大品牌各类汽车问答，权威专家告诉您如何选车买车，汽车保养及汽车使用常见问题。上行圆汽车大全汽车问答，让汽车生活更简单！"/>
    <meta name="keywords" content="汽车问答，如何选车买车，汽车如何保养，汽车常见问题，汽车大全"/>
<#include "pubmodule/common_top.ftl" />
    <link rel="stylesheet" href="${cssPath}/wenda_issues.css">
    <link rel="stylesheet" href="${cssPath}/jquery.fancybox.css">
</head>

<body>

<#include "pubmodule/wenda_pubHeadNav.ftl" />
<!-- 问题库 -->
<div class="issues_page">

    <!-- 标题 -->
<#assign  head_title="内容库" />
<#if (answer_count)??>
    <#assign  head_title="0解答" />
</#if>
<#include "pubmodule/wenda_pubHead.ftl" />

<#if !(answer_count)??>
    <!-- nav -->
    <#if (subject)??>
        <#if  ((questionRes.background)?? && questionRes.background=='') ||  ((questionRes.is_default_bg)?? && questionRes.is_default_bg==1)>
            <div class="subject">
                <div class="no">
                    <#if (title)??>${(title)!''}<#else>${(subject)!''}</#if>
                </div>
            </div>
        <#else>
            <div class="subject">
                <a href="javascript:void(0);" style="background-image: url(${questionRes.background})">
                </a>
                <div class="sub_des">
                    <span class="hezi">
                    ${questionRes.count}
                    </span>
                    <span class="fire">
                    ${questionRes.pv}
                    </span>
                    <span class="sub_share" id="share">
                    分享
                    </span>
                </div>
            </div>
        </#if>
    <#else>
        <div class="answer_enter">
            <a href="./issues?answer_count=0" class="clearfix">
                <img src="http://static.qcdqcdn.com/wap/img/wd_zero.png" alt="">
                <p>
                    <span class="title">我来回答</span>
                    <span class="detail">消灭0解答，专治各种疑难杂症！</span>
                </p>
                <i></i>
            </a>
        </div>
        <div class="nav_list clearfix">
            <a href="javascript:void(0);" id="buyCar"
               <#if (category_name)?? && (category_name !='全部类型')>class="checked"</#if>>
                <#if (category_name)??>
                ${(category_name)!''}
                <#else>
                    全部类型
                </#if>
                <i></i>
            </a>
            <a href="javascript:void(0);" id="choiceType" <#if (series_name)??>class="checked"</#if>>
                <#if (series_name)??>
                ${(series_name)!''}
                <#else>
                    全部车型
                </#if>
                <i></i>
            </a>
            <#if (category_id)?? || (category_name)?? || (series_id)?? || (series_name)??>
                <a href="./issues" class="reset">重置</a>
            <#else>
                <a href="javascript:void(0);" class="reset disable">重置</a>
            </#if>
        </div>
    </#if>
</#if>

    <!-- 推荐内容 -->
    <div class="recommend_content">
    <#include "fragment/question_issues.ftl" />
    <#if (questionRes.count>questionRes.limit)>
        <div class="load_more_module">
            <a href="javascript:void(0);" class="load_more">加载更多<img src="/img/down.png"></a>
            <a href="javascript:void(0);" class="loading"><span></span><span></span><span></span></a>
        </div>
    </#if>
    </div>

<#assign cur_module_name="内容库" />
<#if (answer_count)??>
    <#assign  cur_module_name="0解答" />
</#if>
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

<!-- 右侧抽屉品牌 -->
<div class="right_brand_module">
    <!-- 品牌车型列表 -->
    <div class="brand_type">
        <div class="brand_list">
        <#if (brandRes)??>
            <#list brandRes?keys as key>
                <div id="char_nav_${key}" class="letter_title"><span>${key}</span></div>
                <div class="brand_box">
                    <ul>
                        <#list brandRes[key] as brand>
                            <li brand_id="${brand.id}" brand_name="${(brand.name)!''}" brand_logo="${(brand.logo)!''}">
                                <a href="javascript:void(0);">
                                    <i><img onerror="nofind()" src="${(brand.logo)!''}"></i>
                                    <span class="brand_name">${(brand.name)!''}</span>
                                </a>
                            </li>
                        </#list>
                    </ul>
                </div>
            </#list>
        </#if>
        </div>
        <div class="letter_list">
            <ul>
            <#list brandRes?keys as key>
                <li><a <#if key_index==0> class="checked" </#if> href="#char_nav_${(key)!''}">${(key)!''}</a></li>
            </#list>
            </ul>
        </div>
        <div class="letter_alert">
            <span>H</span>
        </div>
    </div>
</div>

<!-- 右侧车款模块 -->
<div class="right_type_module">
    <div class="car_type_module">
    </div>
</div>

<!-- 右侧问题类型 -->
<div class="right_issues_module">
    <div class="issues_list">
        <ul>
            <li>
                <a href="./issues?category_name=全部类型<#if (series_id)??>&series_id=${series_id}</#if><#if (series_name)??>&series_name=${series_name}</#if>">全部类型</a>
            </li>
        <#if (categoryRes)??>
            <#list categoryRes as category>
                <li>
                    <a href="./issues?category_id=${(category.id)!''}&category_name=${(category.name)!''}<#if (series_id)??>&series_id=${series_id}</#if><#if (series_name)??>&series_name=${series_name}</#if>"
                        <#if (category_id)?? && category_id==category.id>
                       class="current" </#if>>
                    ${(category.name)!''}
                    </a>
                </li>
            </#list>
        </#if>
        </ul>
    </div>
</div>


<script src="${jsPath}/wenda_issues.js"></script>
<script src="${jsPath}/jquery.circliful.js"></script>
<script src="${jsPath}/jquery.fancybox.js"></script>
<script src="${jsPath}/shareWenda.js"></script>

<input type="hidden" value="${(category_id)!''}" name="category_id" id="category_id"/>
<input type="hidden" value="${(category_name)!''}" name="category_name" id="category_name"/>
<input type="hidden" value="${(series_id)!''}" name="series_id" id="series_id"/>
<input type="hidden" value="${(series_name)!''}" name="series_name" id="series_name"/>
<input type="hidden" value="${(subject)!''}" name="subject" id="subject"/>
<input type="hidden" value="${(answer_count)!''}" name="answer_count" id="answer_count"/>

<script type="text/javascript" src='${jsPath}/wdhtml/wenda_issues.js'></script>


<input type="hidden" id="friend_title"
       value="汽车大全-<#if (series_name)?? && (category_name)?? && (category_name !='全部类型')>${(series_name)!''}${(category_name)!''}类型问题<#elseif (series_name)??>${(series_name)!''}全部问题<#elseif (category_name)?? && (category_name !='全部类型')>${(category_name)!''}类型问题<#else>全部问题</#if>"/>
<input type="hidden" id="friend_img" value=""/>
<input type="hidden" id="friend_link"
       value="https://h5.qichedaquan.com/ask/<#if series_id??>?series_id=${(series_id)!''}</#if>"/>

<input type="hidden" id="people_title"
       value="汽车大全-<#if (series_name)?? && (category_name)?? && (category_name !='全部类型')>${(series_name)!''}${(category_name)!''}类型问题<#elseif (series_name)??>${(series_name)!''}全部问题<#elseif (category_name)?? && (category_name !='全部类型')>${(category_name)!''}类型问题<#else>全部问题</#if>"/>
<input type="hidden" id="people_desc" value="点击查看详情"/>
<input type="hidden" id="people_img" value=""/>
<input type="hidden" id="people_link"
       value="https://h5.qichedaquan.com/ask/<#if series_id??>?series_id=${(series_id)!''}</#if>"/>

<input type="hidden" id="qq_title"
       value="汽车大全-<#if (series_name)?? && (category_name)?? && (category_name !='全部类型')>${(series_name)!''}${(category_name)!''}类型问题<#elseif (series_name)??>${(series_name)!''}全部问题<#elseif (category_name)?? && (category_name !='全部类型')>${(category_name)!''}类型问题<#else>全部问题</#if>"/>
<input type="hidden" id="qq_desc" value="点击查看详情"/>
<input type="hidden" id="qq_img" value=""/>
<input type="hidden" id="qq_link"
       value="https://h5.qichedaquan.com/ask/<#if series_id??>?series_id=${(series_id)!''}</#if>"/>

<input type="hidden" id="weibo_title"
       value="汽车大全-<#if (series_name)?? && (category_name)?? && (category_name !='全部类型')>${(series_name)!''}${(category_name)!''}类型问题  网页链接 分享自 @行圆汽车大全<#elseif (series_name)??>${(series_name)!''}全部问题  网页链接 分享自 @行圆汽车大全<#elseif (category_name)?? && (category_name !='全部类型')>${(category_name)!''}类型问题  网页链接 分享自 @行圆汽车大全<#else>全部问题  网页链接 分享自 @行圆汽车大全</#if>"/>
<input type="hidden" id="weibo_desc" value="点击查看详情"/>
<input type="hidden" id="weibo_img" value=""/>
<input type="hidden" id="weibo_link"
       value="https://h5.qichedaquan.com/ask/<#if series_id??>?series_id=${(series_id)!''}</#if>"/>

<input type="hidden" id="qZone_title"
       value="汽车大全-<#if (series_name)?? && (category_name)?? && (category_name !='全部类型')>${(series_name)!''}${(category_name)!''}类型问题<#elseif (series_name)??>${(series_name)!''}全部问题<#elseif (category_name)?? && (category_name !='全部类型')>${(category_name)!''}类型问题<#else>全部问题</#if>"/>
<input type="hidden" id="qZone_desc" value="点击查看详情"/>
<input type="hidden" id="qZone_img" value=""/>
<input type="hidden" id="qZone_link"
       value="https://h5.qichedaquan.com/ask/<#if series_id??>?series_id=${(series_id)!''}</#if>"/>


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

<#assign shareUrl=base+'/issues?subject='+subject+'&utm_source=webshare&utm_campaign=mask' />


<!-- 分享参数  微信 h5-->
<input id="weixinid" type="hidden"
       value="${(shareUrl)!''}">
<!-- 分享参数  qq-->
<div id="share_qq" style="display: none;">
    <input class="sharetitleid" type="hidden"
           value="${(questionRes.share.qq.title)!''}">
    <input class="sharelurlid" type="hidden"
           value="${(shareUrl)!''}">
    <input class="sharecontentid" type="hidden"
           value="${(questionRes.share.qq.sub_title)!''}">
    <input class="sharepicid" type="hidden"
           value="${(questionRes.share.qq.cover)!''}">
</div>

<!-- 分享参数  qq空间-->
<div id="share_qq_zone" style="display: none;">
    <input class="sharetitleid" type="hidden"
           value="${(questionRes.share.qqzone.title)!''}">
    <input class="sharelurlid" type="hidden"
           value="${(shareUrl)!''}">
    <input class="sharecontentid" type="hidden"
           value="${(questionRes.share.qq.sub_title)!''}">
    <input class="sharepicid" type="hidden"
           value="${(questionRes.share.qq.cover)!''}">
</div>
<!-- 分享参数  sina-->
<div id="share_sina" style="display: none;">
    <input class="sharetitleid" type="hidden" value="${(questionRes.share.weibo.title)!''}">
    <input class="sharelurlid" type="hidden"
           value="${(shareUrl)!''}">
    <input class="sharecontentid" type="hidden"
           value="${(questionRes.share.qq.sub_title)!''}">
    <input class="sharepicid" type="hidden"
           value="${(questionRes.share.qq.cover)!''}">
</div>


</body>
</html>
