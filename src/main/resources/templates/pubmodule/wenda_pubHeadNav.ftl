<!--顶部导航-->
<div class="pubHeadNav">
    <div class="logo_box">
        <h1 class="nav_logo"><a href="http://m.qichedaquan.com">汽车大全</a></h1>
    <#if (uid)??>
        <div class="login_photo">
            <a href="http://i.m.qichedaquan.com/personal/personalCenter"><img tagVal="${uid}" src="${(avatar)!'/img/login_photo.png'}"></a>
        </div>
    <#else>
        <a href="http://i.m.qichedaquan.com/user/login?businessplatform=1<#if (curUrl)??>&callback=${(curUrl)!''}</#if>" style="display: block;" class="login">登录</a>
    </#if>
    </div>
    <ul class="nav_type clearfix">
        <li><a track="m_home_navigationclick:1" href="http://m.qichedaquan.com">首页</a></li>
        <li><a track="m_home_navigationclick:2" href="http://car.m.qichedaquan.com/selbrands">选车</a></li>
        <li><a track="m_home_navigationclick:3" href="http://news.m.qichedaquan.com/xinche/">新车</a></li>
        <li><a track="m_home_navigationclick:4" href="http://news.m.qichedaquan.com/pingce/">评测</a></li>
        <li><a track="m_home_navigationclick:5" href="http://news.m.qichedaquan.com/daogou/">导购</a></li>
        <li><a track="m_home_navigationclick:6" href="http://pic.m.qichedaquan.com">图片</a></li>
        <li><a track="m_home_navigationclick:7" href="http://vm.auto.gmw.cn">视频</a></li>
        <li><a track="m_home_navigationclick:8" href="http://price.m.qichedaquan.com/">报价</a></li>
        <li><a track="m_home_navigationclick:9" href="http://jiangjia.m.qichedaquan.com/">降价</a></li>
        <li><a track="m_home_navigationclick:10" href="http://dealer.m.qichedaquan.com/">经销商</a></li>
        <li><a track="m_home_navigationclick:11" href="http://ask.m.qichedaquan.com">问答</a></li>
        <li><a track="m_home_navigationclick:12" href="http://u.m.qichedaquan.com">二手车</a></li>
    </ul>
</div>
<!--导航下面的半透明遮罩-->
<div class="nav_mask"></div>