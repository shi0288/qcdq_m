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
    <title>投票-手机汽车大全</title>
    <link rel="stylesheet" href="${cssPath}/wenda_pub_vote.css">
    <link rel="stylesheet" href="${cssPath}/swiper-3.4.1.min.css">
    <script src="${jsPath}/swiper-3.4.1.min.js"></script>
</head>

<body>
<div class="interlocution_publish_page ">
    <!-- 标题 -->
<#assign  head_title="投票" />
<#include "pubmodule/wenda_pubHead.ftl" />

    <form action="./createQuestion" method="post" enctype="multipart/form-data" id="filter_form">
        <input type="hidden" name="special_id" value="${(special_user.uid)!''}"/>
        <div class="pub_header">
            <textarea id="textarea" name="content" class="publish_area" placeholder="朋友们，快来帮我投个票吧～"></textarea>
        </div>
        <div class="city clearfix">
            <div class="p_dec" id="subject"><img src="http://static.qcdqcdn.com/wap/img/pub_vate.png"></div>
        </div>

    <#if (labelRes)??>
        <p class="label_des">选择投票关键词快速发起投票（最多6个）</p>
        <div class="label">
            <#list labelRes.content as it>
                <label for="checked_${it_index}">${(it)!''}</label>
                <input type="checkbox" value="${(it)!''}" name="tags" id="checked_${it_index}" class="hide">
            </#list>
        </div>
    </#if>

        <div class="pub_section">
            <div class="swiper-container vote_model">
                <span class="tip">至少2个选项</span>
                <ul class="choose_type">
                    <li class="ty_active" tagVal="car" data-index="0"><a href="javascript:void(0);">车型投票</a></li>
                    <li data-index="1" tagVal="text"><a href="javascript:void(0);">观点投票</a></li>
                </ul>
                <div class="swiper-wrapper">
                    <!--车型投票-->
                    <div class="swiper-slide car_vote">
                        <ul>
                            <li>投票车型1</li>
                            <li>投票车型2</li>
                        </ul>
                        <div class="add_car add_vote">
                            <span id="choiceType" class="addType">✚ 添加车型</span>
                        </div>
                    </div>
                    <!--观点投票-->
                    <div class="swiper-slide point_vote">
                        <ul>
                            <li>
                                <input type="text" name="topics" disabled placeholder="输入观点1（最多20个字）" maxlength="20">
                                <img class='del' src='http://static.qcdqcdn.com/wap/img/close_down.png'>
                            </li>
                            <li>
                                <input type="text" name="topics" disabled placeholder="输入观点2（最多20个字）" maxlength="20">
                                <img class='del' src='http://static.qcdqcdn.com/wap/img/close_down.png'>
                            </li>
                        </ul>
                        <div class="add_point add_vote">
                            <span id="choiceVote" class="addType">✚ 添加观点</span>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="vote_cycle">
            <div class="vote_dec">投票周期:</div>
            <div class="vote_days vote_days_des" id="vote_days">
                <span>7天</span>
                <img src="http://static.qcdqcdn.com/wap/img/rightjt.png">
            </div>
        </div>
        <div class="vote_cycle">
            <div class="vote_dec">所在城市:</div>
            <div class="current_city vote_days" id="city">
            <#if (clientCity)??>
                <span id="cityValue" class="dealer_city">${(clientCity)!''}</span>
            <#else>
                <span id="cityValue" class="dealer_city">您在哪里？</span>
            </#if>
                <img src="http://static.qcdqcdn.com/wap/img/rightjt.png">
            </div>
        </div>
        <input type="hidden" value="${(clientCityId)!''}" name="city_id" id="city_id"/>
        <input type="hidden" value="car" name="voteType" id="voteType"/>
        <input type="hidden" value="7" name="closeTime" id="closeTime"/>
        <div class="seize"></div>
        <div class="pub_footer">
            <input type="button" id="submit_but" value="提 交"/>
        </div>
    </form>
</div>

<!--问答周期弹出层-->
<div class="cycle_module public_module" style="right: -100%;">
    <ul>
        <li tagVal="3">3天</li>
        <li tagVal="7" class="cyc_active">7天</li>
        <li tagVal="15">15天</li>
    </ul>
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
        <dl>
            <dd id="no_city">不显示位置</dd>
        </dl>
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
                            <li brand_id="${brand.id}" brand_name="${(brand.name)!''}"
                                brand_logo="${(brand.img100)!''}">
                                <a href="javascript:void(0);">
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
<div class="right_type_module">
</div>


<!-- 右侧车款模块 -->
<div class="right_disign_module">
</div>

<#include "pubmodule/wenda_pubHeadNav.ftl" />

<script src="${jsPath}/wenda_issues.js"></script>
<script src="${jsPath}/wenda_pub_vote.js"></script>
<script src="/js/ajaxfileupload.js"></script>
<script type="text/javascript" src='${jsPath}/wdhtml/wenda_vote.js'></script>
</body>
</html>
