<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <title>汽车大全</title>
<#include "pubmodule/common_top.ftl" />
    <link rel="stylesheet" href="${cssPath}/wenda_adviser.css">
</head>
<body>
<#include "pubmodule/wenda_pubHeadNav.ftl" />
<div class="nav_mask"></div>
<div class="container">
    <!-- 标题 -->
<#assign  head_title="车顾问" />
<#include "pubmodule/wenda_pubHead.ftl" />
    <div class="chooseMod">
        <div class="choseSelect"><span><#if (brand_name)??>${(brand_name)!''}<#else>全部品牌</#if></span>
            <img src="http://static.qcdqcdn.com/wap/img/wd_arrow_bottom.png" alt="">
        </div>
        <div class="choseCity"><span><#if (city_name)??>${(city_name)!''}<#else>全部</#if></span>
            <img src="http://static.qcdqcdn.com/wap/img/wd_arrow_bottom.png" alt="">
        </div>
    </div>
    <ul>
    <#include "fragment/adviser_list.ftl" />
    </ul>
<#include "fragment/adviser_list_bottom.ftl" />
</div>

<#include "fragment/address.ftl" />

<div class="mask_area">
    <div class="mask"></div>
    <div class="mask_jt"></div>
</div>
<!-- 右侧抽屉品牌 -->
<div class="right_brand_module">
    <!-- 品牌车型列表 -->
    <div class="brand_type">
        <div class="brand_list">
        <#if (brandRes)??>
            <div class="brand_box">
                <ul>
                    <li>
                        <a href="/advisers?city_id=${(city_id)!''}&city_name=${(city_name)!''}">
                            <span class="brand_name">全部品牌</span>
                        </a>
                    </li>
                </ul>
            </div>
            <#list brandRes?keys as key>
                <div id="char_nav_${key}" class="letter_title"><span>${key}</span></div>
                <div class="brand_box">
                    <ul>
                        <#list brandRes[key] as brand>
                            <li>
                                <a href="/advisers?brand_id=${(brand.id)!''}&brand_name=${(brand.name)!''}&city_id=${(city_id)!''}&city_name=${(city_name)!''}">
                                    <i><img onerror="nofind()" src="${(brand.img100)!''}"></i>
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
<input type="hidden" value="1" id="wd_adviser"/>
<input type="hidden" value="${(brand_id)!''}" id="brand_adviser"/>
<input type="hidden" value="${(city_id)!''}" id="city_adviser"/>
<input type="hidden" value="${(city_name)!''}" id="city_name"/>
<input type="hidden" value="${(brand_name)!''}" id="brand_name"/>
<input type="hidden" value="${advisers.count}">
<input type="hidden" value="${advisers.limit}">
</body>
<script src="${jsPath}/wenda_adviser.js"></script>
</html>