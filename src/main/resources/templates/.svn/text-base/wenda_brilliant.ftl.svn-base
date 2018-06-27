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
    <link rel="stylesheet" href="${cssPath}/wenda_brilliant.css">
</head>
<body>
<#include "pubmodule/wenda_pubHeadNav.ftl" />
<div class="nav_mask"></div>
<div class="container">
    <!-- 标题 -->
<#assign  head_title="精彩栏目" />
<#include "pubmodule/wenda_pubHead.ftl" />

    <ul>
    <#if (subjects.content)??>
        <#list subjects.content as item>
            <#--<#if (item_index ==2 )>-->
                <#--<li>-->
                    <#--<a href="/issues?title=报价单&subject=报价单">-->
                        <#--<div style="background-image: url(http://img1.qcdqcdn.com/group1/M00/17/56/o4YBAFp1Hv6AKxuAAADyBNYBAZ4577.png)"></div>-->
                        <#--<p>报价单</p>-->
                    <#--</a>-->
                <#--</li>-->
            <#--</#if>-->
            <li>
                <a href="<#if (item.title)??>/issues?title=${(item.title)!''}&subject=${(item.subject)!''}<#else>/issues?subject=${(item.subject)!''}</#if>">
                    <div style="background-image: url(${(item.cover)!''})"></div>
                    <p>${(item.subject)!''}</p>
                </a>
            </li>
        </#list>
    </#if>
    </ul>

</div>
</body>

</html>