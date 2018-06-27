
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <title>汽车大全</title>
    <meta name="description" content="如果您遇到汽车保养、维护维修、改装、买车、选车等各类问题，均可以登录汽车大全网问答频道寻求解答，各类汽车知识尽在汽车大全网。">
    <meta name="keywords" content="汽车保养,汽车维护维修,汽车改装,买车注意事项,选车问题，汽车问答,汽车知识,汽车大全网">
<#include "pubmodule/common_top.ftl" />
    <link rel="stylesheet" type="text/css" href="${cssPath}/jquery.fancybox.css" media="screen" />
    <link rel="stylesheet" href="${cssPath}/wenda_search.css">
</head>
<body>
<div class="search_title">
    <div class="search_input">
        <div>
            <img src="${imgPath}/ask_search_blue.png" alt="">
            <form>
                <input type="search" placeholder="请输入您想找的问题" id="mainSearch" maxlength="50">
            </form>
            <span class="delInput" style="display: inline;"></span>
        </div>
        <p>取消</p>
    </div>
    <div class="search_history">
        <p class="history_title">搜索历史</p>
        <ul>

        </ul>
        <p class="history_remove">清空搜索历史</p>
    </div>
</div>
<div class="search_result">
    <ul>

    </ul>
    <a href="javascript:void(0);" class="loading"><img src="${imgPath}/load_icon.png"></a>
    <div class="empty">
        <img src="${imgPath}/delete_content.png" alt="">
        <p>抱歉没有找到相关内容</p>
        <span>直接提问</span>
    </div>
</div>
<div class="go_top" id="goTop"> <span></span> <i></i></div>
<script id="ask_history" type="text/x-dot-template">
    {{~it:value:index}}
    <li>
        {{=value}}
        <span class="delHistory"></span>
    </li>
    {{~}}
</script>
<script id="ask_result" type="text/x-dot-template">
    {{~it:value:index}}
    <li>
        <span data-id="{{=value.key}}">{{=value.content}}</span>
    </li>
    {{~}}
</script>
<script src="${jsPath}/wenda_search.js"></script>
</body>
</html>