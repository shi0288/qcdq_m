<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <title>汽车大全</title>
<#include "pubmodule/common_top.ftl" />
    <link rel="stylesheet" href="${cssPath}/wenda_enlist.css">
</head>
<body>
<#include "pubmodule/wenda_pubHeadNav.ftl" />
<div class="wenda_page">
    <!-- 标题 -->
<#assign  head_title="活动报名" />
<#include "pubmodule/wenda_pubHead.ftl" />
    <p class="title">请填写您的报名信息</p>
    <div class="content">
        <form action="./createActivity" id="filter_form" method="post">
            <input type="hidden" value="${(attObj.attach_id)!''}" name="attach_id" id="attach_id"/>
            <ul>
                <li>
                    <span>姓名：</span><input type="text" name="username" id="name" placeholder="请填写真实姓名"
                                           maxlength="5"/>
                    <img src="http://static.qcdqcdn.com/wap/img/input_delete.png" class="delete">
                </li>
                <li class="sex_li">
                    <span>称呼：</span>
                    <label for="man" class="active">先生</label>
                    <label for="lady">女士</label>
                    <input type="radio" value="男" id="man" name="sex" checked class="hide">
                    <input type="radio" value="女" id="lady" name="sex" class="hide">
                </li>
                <li>
                    <span>手机：</span><input type="text" name="mobile" id="mobile" maxlength="11"  placeholder="请填写手机号码">
                    <span class="warn"><em></em>请输入正确的手机号，在进行报名</span>
                    <img src="http://static.qcdqcdn.com/wap/img/input_delete.png" class="delete">
                </li>
            <#if (sign_infoObj)??>
                <li>
                    <input type="hidden" name="time" id="timeValue">
                    <span>时间：</span><input type="button" id="timeInput" value="请选择参加时间">
                </li>
            </#if>
            </ul>
            <div class="submit"  disabled="true" >报名</div>
        </form>
    </div>

    <!--问答时间弹层-->
    <div class="cycle_module">
        <ul>
        <#if (sign_infoObj)??>
            <#list sign_infoObj as item>
                <li>${(item)!''}</li>
            </#list>
        </#if>
        </ul>
    </div>
    <div class="mask_area">
        <div class="mask"></div>
        <div class="mask_jt"></div>
    </div>
</div>
<script type="text/javascript" src='${jsPath}/wdhtml/wenda_enlist.js'></script>

</body>

</html>