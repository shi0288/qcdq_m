<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />

<#include "pubmodule/common_top.ftl" />
    <script src="${jsPath}/sliderMenu.js"></script>
    <title>汽车大全-问答</title>
    <link rel="stylesheet" href="${cssPath}/base.css">
    <link rel="stylesheet" href="${cssPath}/wenda_quotation.css">
</head>

<body>
<div class="interlocution_publish_page ">
    <!-- 标题 -->
<#assign  head_title="找TA报价" />
<#include "pubmodule/wenda_pubHead.ftl" />

    <form action="./createInquiry" method="post" enctype="multipart/form-data" id="filter_form">
        <div class="pub_header">
            <p>您正在向车顾问&nbsp ${(user.name)!''} &nbsp索要报价</p>
            <div class="person">
                <dl class="clearfix">
                    <dt>
                        <img src="${(user.avatar)!'/img/user_default_title.png'}" onerror="nofindUser()"
                             class="expert_photo">
                        <span class="person_sign"></span>
                    </dt>
                    <dd class="per_name">
                    ${(user.name)!''}
                    </dd>
                    <dd class="per_city">
                        <span class="location">${(user.citys[0].name)!''}</span>
                        <span>${(user.word)!''}</span>
                    </dd>
                </dl>
            </div>
        </div>
        <div class="pub_section">
            <div class="chose_car clearfix" id="chooseCar">
                <div>意向车款：</div>
                <div class="intention has_border" id="choiceType">
                    <span>仅可选择车顾问当前所售车款</span>
                    <img src="http://static.qcdqcdn.com/wap/img/rightjt.png">
                </div>
                <div></div>
                <div class="intention">
                    <span class="price">官方指导价：<i>--万</i></span>
                </div>
            </div>
            <div class="chose_car" id="city">
                <div>提车城市：</div>
                <div class="intention">
                    <span id="cityValue">仅可选择车顾问服务范围内地区</span>
                    <img src="http://static.qcdqcdn.com/wap/img/rightjt.png">
                </div>
            </div>

            <div class="chose_car plate">
                <div>上牌城市：</div>
                <label for="buy_car"><span class="q_select">与提车城市相同</span></label><input type="radio" value="0"
                                                                                      class="hide"
                                                                                      id="buy_car"
                                                                                      name="register_city_id" checked>
                <label for="use_car"><span>与提车城市不同</span></label><input type="radio" class="hide" value="1" id="use_car"
                                                                      name="register_city_id">
            </div>

            <div class="chose_car">
                <div>手机号码：</div>
                <div class="intention phoneNumber">
                    <input type="text" value="${(phone)!''}" <#if (phone)??>tagVal="nocode"  readonly </#if> name="phone"
                           id="phone" placeholder="请输入手机号"
                           maxlength="11">
                    <img  <#if (phone)??>style="display: block"</#if>
                          src="http://static.qcdqcdn.com/wap/img/pancil.png">
                </div>
            </div>
            <div class="chose_car" <#if (phone)??>style="display: none"</#if>>
                <div>验证码：</div>
                <div class="intention identifying">
                    <input type="text" name="code" id="code" placeholder="请输入验证码" maxlength="6">
                    <span>获取验证码</span>
                </div>
            </div>
        </div>
        <div class="pub_footer">
            <input type="button" id="submit_but" value="提 交">
            <p>
                报价是由经过认证的真实汽车经销商为您提供。 <br>
                汽车大全不会泄露您的联系方式。
            </p>
        </div>
        <input type="hidden" value="${(user.uid)!''}" name="uid" id="uid"/>
        <input type="hidden"  tagVal="向车顾问 ${(user.name)!''} 索要了报价单: <br>询价车型: <br>" value="" name="content" id="content"/>
        <input type="hidden" value="" name="car_id"  id="car_id"/>
        <input type="hidden" value="" name="city_id"  id="city_id"/>
        <input type="hidden" value="" name="inquiry" id="inquiry"/>
        <input type="hidden" value="${(reply_answer_id)!''}" name="reply_answer_id" id="reply_answer_id"/>
        <input type="hidden" value="${(reply_uid)!''}" name="reply_uid" id="reply_uid"/>
        <input type="hidden" value="${(question_id)!''}" name="question_id" id="question_id"/>
    </form>
</div>

<!--toast-->
<div class="wd_toast">
    <span></span>
</div>


<!--alert success-->
<div class="alert_success">
    <div>
        <img src="http://static.qcdqcdn.com/wap/img/wd_owner.png" alt="">
        <h3>提交成功</h3>
        <p>车顾问会尽快给您报价</p>
        <span onclick="window.location.href='./answer/${(question_id)!''}'">返回问答详情</span>
    </div>
</div>


<!--再次报价弹框-->
<div class="alert_again">
    <div>
        <p>修改手机号</p>
        <div class="phone_agein"><input type="text" id="updatePhone" placeholder="请输入手机号" maxlength="11"><span></span>
        </div>
        <div class="code_agein">
            <input type="text" id="updateCode" placeholder="请输入验证码" maxlength="6">
            <span class="wait task_code">获取验证码</span>
        </div>
        <div class="btn_again">
            <span class="cancel">取消</span>
            <span class="confirm">确认</span>
        </div>
    </div>
</div>


<!-- 右侧省份层 --><!-- 右侧市层-->
<div class="right_module_province">
    <div class="province_scroll_module">
        <div class="other_province" id="otherProvince">
        <#if (provinceRes)??>
            <#list provinceRes?keys as key>
                <dl>
                    <dt>${(key)!''}</dt>
                    <#list provinceRes[key] as province>
                        <dd tagVal="${(province.provinceid)!''}"><span>${(province.provincename)!''}</span><i></i></dd>
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

<script src="${jsPath}/wenda_quotation.js"></script>
<script src="${jsPath}/wenda_issues.js"></script>
<script src="${jsPath}/wdhtml/wenda_quotation_assist.js"></script>

<script>


</script>
</body>
</html>
