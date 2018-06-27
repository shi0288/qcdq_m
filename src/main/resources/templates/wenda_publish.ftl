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
    <title>提问-手机汽车大全</title>
    <link rel="stylesheet" href="${cssPath}/wenda_publish.css">
</head>

<body>
<div class="interlocution_publish_page ">
    <!-- 标题 -->
<#assign  head_title="提问" />
<#if (type)??>
    <#assign  head_title="分享帖" />
</#if>
<#include "pubmodule/wenda_pubHead.ftl" />

    <form action="./createQuestion" method="post" enctype="multipart/form-data" id="filter_form">
        <input type="hidden" name="special_id" value="${(special_user.uid)!''}"/>
    <#if (type)??>
        <input type="hidden" name="type" id="_type" value="1"/>
    </#if>
        <div class="pub_header">
        <#if (special_user)??>
            <p>向
                <#if special_user.type==2>
                    问答专家
                <#elseif special_user.type==3>
                    车顾问
                <#else>
                    问答标兵
                </#if>
                <span>${(special_user.name)!''}</span>提问：</p>
        </#if>
            <textarea id="textarea" name="content" class="publish_area"
                      placeholder="<#if (type)??>图文并茂地发表你的想法<#else>请输入您的问题，平均十分钟收到解答</#if>">${(inputValue)!''}<#if subject??>#${subject}#</#if></textarea>
            <div class="publish_img2">
                <label for="choose_img"><img src="/img/publish_add.jpg" alt=""></label>
            </div>
        </div>
        <div class="city clearfix">
            <div class="publish_img">
                <input type="file" id="choose_img" name="file" accept="image/gif,image/jpeg,image/x-png">
                <label for="choose_img"><img src="http://static.qcdqcdn.com/wap/img/publish_add.png" alt=""></label>
            </div>
            <div class="p_dec" id="subject"><img src="http://static.qcdqcdn.com/wap/img/pub_vate.png"></div>
            <div class="current_city" id="city">
                <span id="cityValue" class="dealer_city">您在哪里？</span>
                <img src="http://static.qcdqcdn.com/wap/img/close_down.png" class="init_city">
            </div>
        </div>
        <div class="pub_section">
            <div class="publish_bound clearfix">
                <div class="p_dec">关联车型：</div>
                <div class="fl">
                <#if (seriesObj)??>
                    <span class="cho_car" tagval="${(seriesObj.id)}">${(seriesObj.name)!''}<img src="/img/delete_red.png"
                                                                                                alt=""></span>
                </#if>
                    <span id="choiceType">✚ 关联车型</span>
                </div>
            </div>
        </div>
        <input type="hidden" value="<#if (seriesObj)??>${(seriesObj.id)}</#if>" name="cars" id="cars_val"/>
        <input type="hidden" value="" name="attachs" id="attachs_val"/>
        <input type="hidden" value="${(clientCityId)!''}" name="city_id" id="city_id"/>
        <div class="pub_footer">
            <input type="button" id="submit_but" value="提 交"/>
        </div>
    </form>
</div>

<!--话题-->
<div class="subject_module public_module">
    <p>热门话题</p>
    <ul>
    <#if (popularRes.content)??>
        <#list popularRes.content as popular>
            <li>#${(popular.title)!''}#</li>
        </#list>
    </#if>
    </ul>
</div>
<!-- 右侧省份层 --><!-- 右侧市层-->
<img src="/img/double_jt.png" class="slider_btn">
<div class="right_module_province">
    <div class="province_scroll_module">
        <dl class="current_province">
            <dt>当前定位城市</dt>
        <#if (clientCity)??>
            <dd class="current" tagVal="${(clientCityId)!''}">${(clientCity)!''}</dd>
        <#else>
            <dd style="display: block;" class="no_get">无法获取</dd>
        </#if>
        </dl>
        <div class="other_province" id="otherProvince">
        <#if (provinceRes)??>
            <#list provinceRes?keys as key>
                <dl>
                    <dt>${(key)!''}</dt>
                    <#list provinceRes[key] as province>
                        <dd tagVal="${(province.id)!''}"><span>${(province.name)!''}</span><i></i></dd>
                    </#list>
                </dl>
            </#list>
        </#if>
        </div>
    </div>
</div>
<div class="right_module_city">
    <ul>

    </ul>
</div>
<!-- 遮罩层 -->
<div class="mask_area">
    <div class="mask"></div>
    <div class="mask_jt"></div>
</div>

<div class="tanceng_tip">
    <div class="some_fixed_tips review_tips points_tip"></div>
</div>
<!--loading-->
<div class="up_load"><span></span>上传中...</div>
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
        <div class="letter_alert"><span>H</span></div>
    </div>
</div>
<!-- 右侧车款模块 -->
<div class="right_type_module">
    <div class="car_type_module">
    </div>
</div>

<#include "pubmodule/wenda_pubHeadNav.ftl" />


<script src="${jsPath}/wenda_publish.js"></script>
<script src="${jsPath}/wenda_issues.js"></script>
<script src="/js/ajaxfileupload.js"></script>
<script type="text/javascript" src='${jsPath}/wdhtml/wenda_publish.js'></script>

</body>
</html>
