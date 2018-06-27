
<!DOCTYPE html>
<html>
<head>
    <title>汽车大全-我的问答</title>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<#include "pubmodule/common_top.ftl" />
    <link rel="stylesheet" href="${cssPath}/wenda_integray.css">
    <link rel="stylesheet" type="text/css" href="${cssPath}/jquery.fancybox.css" media="screen" />
</head>
<body>
<div class="wrap">
    <!-- 头部 -->
<#assign  head_title="我的问答" />
<#include "pubmodule/wenda_pubHead.ftl" />
    <div class="ask_integray">
        <p class="integray_total">当前累计积分：<i></i></p>
        <ul>
        </ul>
        <div class="load_more_module">
            <a class="load_more">加载更多<img src="/img/down.png"></a>
            <a class="loading"><img src="/img/load_icon.png"></a>
        </div>
    </div>
</div>
<#include "pubmodule/wenda_pubHeadNav.ftl" />
<!-- 回到顶部 -->
<div class="go_top" id="goTop"> <span></span> <i></i></div>

<input  type="hidden"  id="uid" value="${(user.token)!''}"  />
</body>
<script src="${jsPath}/jquery.fancybox.js"></script>
<script id="integray" type="text/x-dot-template">
    {{~it.content:value:index}}
    <li>
        <p>{{=value.detailedText}}</p>
        <span>{{=value.detailedTime}}</span>
        <div class="{{=it.help.bindClass(value.detailedNum)}}">{{=it.help.bindAttr(value.detailedNum)}}</div>
    </li>
    {{~}}
</script>
<script src="${jsPath}/wenda_integray.js"></script>
</html>

