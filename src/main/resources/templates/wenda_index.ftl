<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
    <title>汽车保养_汽车维护维修_各类车型疑难杂症专业解答-问答-手机汽车大全 </title>
    <meta name="description" content="如果您遇到汽车保养、维护维修、改装、买车、选车等各类问题，均可以登录汽车大全网问答频道寻求解答，各类汽车知识尽在汽车大全网。"/>
    <meta name="keywords" content="汽车保养,汽车维护维修,汽车改装,买车注意事项,选车问题，汽车问答,汽车知识,汽车大全网"/>
<#include "pubmodule/common_top.ftl" />
    <link rel="stylesheet" href="${cssPath}/wenda_index.css">
    <link rel="stylesheet" href="${cssPath}/swiper-3.4.1.min.css">
    <link rel="stylesheet" href="${cssPath}/jquery.fancybox.css">
</head>
<body>
<#include "pubmodule/wenda_pubHeadNav.ftl" />
<!-- 问答首页 -->
<div class="wenda_page">
    <!-- 标题 -->
<#assign  head_title="问答" />
<#include "pubmodule/wenda_pubHead.ftl" />
    <!-- 轮播图 -->
    <div class="swiper_banner">
        <div class="swiper_box swiper-container">
            <ul class="swiper-wrapper clearfix">
            <#if (bannerRes.content)??>
                <#list bannerRes.content as banner>
                    <#if (banner_index<3)>
                        <li class="swiper-slide">
                            <a track="xym_ask_banner:${banner_index+1}"
                               href="${(banner.url)!'javascript:void(0);'}">
                                <img onerror="nofind()" src="${(banner.img)!''}">
                                <p>${(banner.title)!''}</p>
                            </a>
                        </li>
                    <#else>
                        <#break>
                    </#if>
                </#list>
            </#if>
            </ul>
        </div>
    <#--<div class="index_dian swiper-pagination"></div>-->
        <div class="swiper_num swiper-pagination-fraction">
        <#--<span class="swiper-pagination-current">1</span>-->
            <#--/-->
            <#--<span class="swiper-pagination-total">${(bannerRes.content?size)!''}</span>-->
        </div>
    </div>
    <!--推荐话题-->
    <div class="brilliant">
        <h3 class="module_title"><span>精彩栏目</span><a href="/subjects" class="more">更多<img
                src="http://static.qcdqcdn.com/wap/img/rightjt.png"></a></h3>
        <ul class="subject_list">
        <#if (topicRecommend.content)?? && (topicRecommend.content?size>0)>
            <#list topicRecommend.content as topic>
                <#if (topic_index >=4 )>
                    <#break>
                </#if>
                <#--<#if (topic_index ==2 )>-->
                    <#--<li track="m_ask_topicclick:${topic_index+1}"-->
                        <#--style="background-image: url(http://img1.qcdqcdn.com/group1/M00/17/56/o4YBAFp1Hw6AXwyFAACSiT2gtSc774.png)"-->
                        <#--onclick="window.location.href='./issues?title=报价单&subject=报价单'">-->
                    <#--</li>-->
                <#--<#else>-->
                    <li track="m_ask_topicclick:${topic_index+1}"
                        style="background-image: url(${(topic.newimg)!''})" <#if (topic.title)??>
                        onclick="window.location.href='./issues?title=${(topic.title)!''}&subject=${(topic.subject)!''}'"<#else>
                        onclick="window.location.href='./issues?subject=${(topic.subject)!''}'"</#if>>
                    </li>
                <#--</#if>-->
            </#list>
        </#if>
        </ul>
    </div>
    <!-- 间隔条 -->
    <div class="bg_bar"></div>
    <!-- 推荐内容 -->
    <div class="recommend_content">
        <h3 class="module_title"><span>推荐内容</span><a href="./issues" class="more">更多<img src="/img/rightjt.png"></a>
        </h3>
        <div class="recom_content_list">
        <#include "fragment/question_index.ftl" />
        </div>
    <#if questionRes.has_more==1>
        <div class="load_more_module">
            <a href="javascript:void(0);" tagVal="${(questionRes.next_max)!''}" class="load_more">加载更多<img
                    src="/img/down.png"></a>
            <a href="javascript:void(0);" class="loading"><span></span><span></span><span></span></a>
            <a href="./issues" class="more query_all_question">查看全部问题<img src="/img/arrow_right_blue.png"></a>
        </div>
    <#else>
        <div class="load_more_module">
            <a href="./issues" style="display: block;" class="more query_all_question">
                查看全部问题
                <img src="/img/arrow_right_blue.png">
            </a>
        </div>
    </#if>
    <#include "pubmodule/wenda_pubBottom.ftl" />
    <#include "pubmodule/wenda_levitate.ftl" />
    </div>
    <!-- 回到顶部 -->
    <div class="go_top" id="goTop"><span></span> <i></i></div>


    <!-- load图标弹层 -->
    <div class="load_mask">
        <span></span>
        <img src="http://static.qcdqcdn.com/wap/img/load_w.png">
    </div>

    <!-- 遮罩层 -->
    <div class="mask"></div>

    <div class="tanceng_tip">
        <div class="some_fixed_tips review_tips"></div>
    </div>

    <!-- 右侧省市遮罩层 -->
    <div class="mask_area">
        <div class="mask"></div>
        <div class="mask_jt"></div>
    </div>

    <!-- 评论 -->
<#include "fragment/comment.ftl" />
<#include "fragment/address.ftl" />
    <input type="hidden" value="" id="question_id"/>
    <input type="hidden" value="" id="attachs_val"/>
    <input type="hidden" value="${(clientCityId)!''}" id="city_id"/>

    <script src="${jsPath}/jquery.circliful.js"></script>
    <script src="${jsPath}/jquery.fancybox.js"></script>
    <script type="text/javascript" src='${jsPath}/swiper-3.4.1.min.js'></script>
    <script type="text/javascript" src='${jsPath}/wdhtml/swiper-init.js'></script>
    <script type="text/javascript" src='${jsPath}/wdhtml/wenda_index.js'></script>

    <input type="hidden" id="friend_title" value="汽车大全-问答"/>
    <input type="hidden" id="friend_img" value=""/>
    <input type="hidden" id="friend_link" value="https://h5.qichedaquan.com/ask/"/>

    <input type="hidden" id="people_title" value="汽车大全-问答"/>
    <input type="hidden" id="people_desc" value="点击查看详情"/>
    <input type="hidden" id="people_img" value=""/>
    <input type="hidden" id="people_link" value="https://h5.qichedaquan.com/ask/"/>

    <input type="hidden" id="qq_title" value="汽车大全-问答"/>
    <input type="hidden" id="qq_desc" value="点击查看详情"/>
    <input type="hidden" id="qq_img" value=""/>
    <input type="hidden" id="qq_link" value="https://h5.qichedaquan.com/ask/"/>

    <input type="hidden" id="weibo_title" value="汽车大全-问答 网页链接 分享自 @行圆汽车大全"/>
    <input type="hidden" id="weibo_desc" value="点击查看详情"/>
    <input type="hidden" id="weibo_img" value=""/>
    <input type="hidden" id="weibo_link" value="https://h5.qichedaquan.com/ask/"/>

    <input type="hidden" id="qZone_title" value="汽车大全-问答"/>
    <input type="hidden" id="qZone_desc" value="点击查看详情"/>
    <input type="hidden" id="qZone_img" value=""/>
    <input type="hidden" id="qZone_link" value="https://h5.qichedaquan.com/ask/"/>


</body>

<script>
    $(function () {
        $('body').off('click', '.load_more_module .load_more');
        var pagenum = 1;
        $('body').on('click', '.load_more_module .load_more', function () {
            var self = $(this);
            var nextMax = self.attr("tagVal");
            self.hide();
            $('.loading').css('display', 'block');
            var cond = {};
            cond.nextMax = nextMax;
            $.localAjax('./getHomeQuestion', cond, function (result) {
                if (result.done) {
                    pagenum++;
                    $('.loading').hide();
                    $('.load_more_module').before($(result.htmlNode));
                    if (result.has_more == 1 && pagenum <= 5) {
                        $('.load_more').css('display', 'block');
                        $('.load_more').attr("tagVal", result.nextMax);
                    } else {
                        $('.query_all_question').css('display', 'block');
                    }
                }
            });
        })
    });

</script>

</html>
