<#if (userFavorite.count>userFavorite.limit)>
<!--加载更多-->
<div class="load_more_module">
    <a href="javascript:void(0);" tagVal="favorite" class="load_more load_user_more">加载更多
        <img src="/img/down.png"/>
    </a>
    <a href="javascript:void(0);" class="loading">
        <span></span><span></span><span></span>
    </a>
    <a href="javascript:void(0);" class="no_more" >没有更多了...</a>
</div>
<#elseif (userFavorite.list?size==0)>
<!--没有内容时显示-->
<div class="ans_empty" style="display: block;"><img src="/img/ans_empty.png"></div>
</#if>