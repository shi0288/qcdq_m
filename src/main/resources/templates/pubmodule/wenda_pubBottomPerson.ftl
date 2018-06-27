<!--面包屑-->
<div class="crumbs">
    <a href="http://m.qichedaquan.com/">首页</a>
    <img src="/img/crumbs_arrow1.png">
    <a href="http://i.m.qichedaquan.com/">个人中心</a>
    <img src="/img/crumbs_arrow1.png">
<#if (cur_module_name)??>
    <a href="javascript:void(0);">
    ${(cur_module_name)!''}
    </a>
</#if>
</div>

<!--footer-->
<div class="video_fte">
    <p><span class="colora4">©&nbsp;&nbsp;2017&nbsp;&nbsp;汽车大全</span></p>
</div>

<#include "/pubmodule/wenda_pubTongji.ftl" />