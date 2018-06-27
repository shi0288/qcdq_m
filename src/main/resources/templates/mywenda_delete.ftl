<!DOCTYPE html>
<html>
<head>
    <title>汽车问答－手机汽车大全</title>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
<#include "pubmodule/common_top.ftl" />
    <link rel="stylesheet" href="${cssPath}/wenda_delete.css">
</head>
<body>

<!--导航下面的半透明遮罩-->
<div class="nav_mask"></div>
<!-- 问答首页 -->
<div class="wenda_page">
    <!-- 标题 -->
<#include "pubmodule/wenda_pubHead.ftl" />
    <div class="main">
        <img src="http://static.qcdqcdn.com/wap/img/delete_content.png" alt="">
        <p>该内容已删除</p>
        <div>
            <a href="http://ask.m.qichedaquan.com/"  class="to_index">返回问答首页</a>
            <a href="javascript:history.go(-1)"  class="back">返回上一页</a>
        </div>
    </div>
<#include "pubmodule/wenda_pubBottom.ftl" />
</div>

<#include "pubmodule/wenda_pubHeadNav.ftl" />
</body>
</html>