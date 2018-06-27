<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <title>
    <#if (question.title)?? && question.title!=''>
        <#if (question.title)?length gt 30 >
        ${question.title?substring(0,30)}
        <#else>
        ${(question.title)!''}
        </#if>
    <#else>
        <#if (question.webtitle)?? && question.webtitle?length gt 30>
        ${question.webtitle?substring(0,30)}
        <#else>
            <#if (question.webtitle)??>
            ${(question.webtitle)!''}
            <#else>
                <#if (question.ycontent)?? && question.ycontent?length gt 30>
                ${question.ycontent?substring(0,30)}
                <#else>
                ${(question.ycontent)!''}
                </#if>
            </#if>
        </#if>
    </#if>
    <#if (question.category_name)??>
        -${question.category_name}
    </#if>
        -问答-手机汽车大全
    </title>
    <meta name="keywords" content="${question.keywords}"/>
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<#include "pubmodule/common_top.ftl" />
    <title>汽车大全-答案详情</title>
    <link rel="stylesheet" href="${cssPath}/wenda_answer.css">
    <link rel="stylesheet" href="${cssPath}/swiper-3.4.1.min.css">
    <link rel="stylesheet" type="text/css" href="${cssPath}/jquery.fancybox.css" media="screen"/>
</head>

<body>

<#include "pubmodule/wenda_pubHeadNav.ftl" />
<!-- 问答详情 -->
<div class="answer_page">
    <!-- 标题 -->
<#assign  head_title="答案详情" />
<#include "pubmodule/wenda_pubHead.ftl" />
    <!-- 正文 -->
    <div class="main_text_module">
        <div class="user_msg clearfix">
            <a href="/user?uid=${(answer.user.uid)!''}" class="publist_user clearfix">
                <img onerror="nofindUser()" src="${(answer.user.avatar)!'/img/user_default_title.png'}"
                     class="user_photo">
                <!--如果不是官方加类名relate_per-->
                <p class="publish_msg relate_per">
                    <span class="user_name">${(answer.user.name)!''}</span>
                <#if answer.user.is_official==1>
                <#else>
                    <#if answer.user.type==3>
                        <span class="time_area">${(answer.user.word)!''}</span>
                    </#if>
                </#if>
                </p>
            <#if answer.user.is_official==1>
                <img src="/img/guangfang1.png" class="level_title">
            <#else>
                <#if answer.user.type==2>
                    <img src="/img/expert.png" class="level_title">
                <#elseif answer.user.type==1>
                    <img src="/img/biaobing.png" class="level_title">
                <#elseif answer.user.type==3>
                    <img src="/img/guwen.png" class="level_title">
                </#if>
            </#if>
            </a>

        <#if answer.user.type==3  && answer.user.uid!=uid>
            <span class="want_do has_quotation want_answer_deal" tagVal="${(answer.answer_id)!''}">
                     <a href="javascript:void(0);"
                        tagVal="/quotation?uid=${(answer.uid)!''}&reply_answer_id=${(answer.answer_id)!''}&reply_uid=${(answer.uid)!''}"
                        class="toAskPrice">找TA报价</a>
                     <i class="delete_alarm">
                          <em></em>
                         <#if (uid)??>
                             <#if (answer.uid==uid)>
                                 <img style="display: inline-block;"
                                      src="/img/wd_delete.png" class="delete">
                             <#else>
                                 <img style="display: inline-block;"
                                      src="/img/alarm.png" class="alarm">
                             </#if>
                         <#else>
                             <img style="display: inline-block;"
                                  src="/img/alarm.png"
                                  class="alarm">
                         </#if>
                      </i>
				</span>
        <#else>
            <span class="want_do want_answer_deal" tagVal="${(answer.answer_id)!''}">
                     <i class="delete_alarm">
                          <em></em>
                         <#if (uid)??>
                             <#if (answer.uid==uid)>
                                 <img style="display: inline-block;"
                                      src="/img/wd_delete.png" class="delete">
                             <#else>
                                 <img style="display: inline-block;"
                                      src="/img/alarm.png" class="alarm">
                             </#if>
                         <#else>
                             <img style="display: inline-block;"
                                  src="/img/alarm.png"
                                  class="alarm">
                         </#if>
                      </i>
				</span>
        </#if>
        </div>
        <div class="content_main">
            <p class="recom_text">
            ${(answer.content)!''}
            </p>
        <#if (answer.attachs)??>
            <p class="recom_img">
                <#list answer.attachs as attach>
                    <#if attach.type==0>
                        <a href="/attach/${answer.answer_id}?type=2&index=${attach_index}" style='background-image: url("${(attach.url)!''}")'
                            data-type="image">
                            <img src="${(attach.smallUrl)!''}" alt="">
                        </a>
                    </#if>
                </#list>
            </p>
        </#if>
        <#if (answer.quotation)??>
            <#list answer.quotation as quotation>
                <#if (quotation_index>=1)><#break></#if>
                <p class="recom_img">
                    <a href="/offering?answer_id=${(answer.answer_id)!''}">
                        <img src="${(quotation.content[0].img)!''}" alt="">
                    </a>
                </p>
            </#list>
        </#if>

        </div>
        <div class="relate_ask">
            <!--普通-->
            <div class="relate_content">
                <p class="recom_text">
                <#if question.is_good==1>
                    <i>
                        精
                    </i>
                </#if>
                <#if question.attach_type==3>
                    <b>投票</b>
                <#elseif question.attach_type==4>
                    <b>PK</b>
                <#elseif question.attach_type==6>
                    <b class="activity">活动</b>
                <#elseif question.type==0>
                    <b>提问</b>
                </#if>
                ${(question.content)!''}
                </p>
            <#if question.attach_type==3 || question.attach_type==4>
                <div class="vote_model">
                    <#if (question.vote)?? && (question.vote?size>0)>
                        <#list question.vote as vote>
                            <#if (vote.content)??>
                                <p>共<span id="vote_total">${vote.total}</span>人投票<#if vote.has_closed==1>，已结束</#if>
                                    <span
                                            class="have_vote" <#if (vote.has_vote_id)??  && vote.has_vote_id!=''>
                                            style="display: inline;" </#if>> 已投票</span></p>
                                <ul>
                                    <#list  vote.content as voteContent>
                                        <li>
                                            <p>${voteContent.text}</p>
                                            <div class="myStat" data-dimension="60" data-text="${voteContent.rate}"
                                                 data-percent="${voteContent.rate?split('%')[0]}"
                                                 data-width="3" data-fontsize="13"
                                                 data-fgcolor="<#if voteContent.vote_id==vote.has_vote_id>#2896fe<#else>#8fc9ff</#if>"
                                                 data-bgcolor="#d9edff">
                                            </div>
                                        </li>
                                    </#list>
                                    <script>
                                        $(function () {
                                            $(".myStat").show();
                                            $(".myStat").circliful();
                                        })
                                    </script>
                                </ul>
                            </#if>
                        </#list>
                    </#if>
                </div>
            <#else>
                <p class="recom_img">
                    <#if (question.attachs)??>
                        <#list question.attachs as attach>
                            <#if attach.type==0>
                                <#if attach_index==0>
                                    <#assign  attach_url=attach.url  />
                                </#if>
                                <a href="/attach/${question.key}?type=1&index=${attach_index}" style='background-image: url("${(attach.url)!''}")'
                                    data-type="image">
                                    <img src="${(attach.smallUrl)!''}" alt="">
                                </a>
                            </#if>
                        </#list>
                    </#if>
                </p>
            </#if>
                <a href="/answer/${(question.key)!''}" class="to_ques">查看原帖</a>
            </div>
            <p class="show_more">展开全部<img src="http://static.qcdqcdn.com/wap/img/down_hui.png"></p>
        </div>
        <p class="relate_time">
            <span class="comment_time"><i>${(answer.created_at)!''}</i> ${(answer.city.name)!''}</span>
        </p>
    </div>

    <!-- 间隔条 -->
    <div class="bg_bar"></div>

    <div class="answer_module">
        <div class="answer_title">
            <span>评论（${(commentList.count)!''}）</span>
        </div>
        <div class="answer_area">
        <#include "fragment/comment_list.ftl" />
        </div>
    <#include "fragment/comment_list_bottom.ftl" />
        <!-- 没有内容 -->
        <!-- <div class="no_content">
            <img src="http://static.qcdqcdn.com/wap/img/ans_empty.png">
        </div> -->
    </div>

    <!-- 间隔条 -->
    <div class="bg_bar"></div>

    <!-- 面包屑导航 -->
    <div class="small_nav">
        <a href="http://m.qichedaquan.com/">首页</a>
        <img src="/img/rightjt.png">
        <a href="http://ask.m.qichedaquan.com/">问答</a>
        <img src="/img/rightjt.png">
        <a href="http://ask.m.qichedaquan.com/answer/${(question.key)!''}">问答详情</a>
        <img src="/img/rightjt.png">
        <span>答案详情</span>
    </div>
    <!-- 底部版权 -->
    <div class="video_fte">
        <p><span class="colora4">©&nbsp;&nbsp;2017&nbsp;&nbsp;汽车大全</span></p>
    </div>

    <!-- 我来说两句 -->
    <div class="function_bar clearfix">
        <input id="review_answer" readonly type="text" placeholder="评论答案...">
        <span>
			<a class="zan_btn"
               <#if !(answer.has_agree)?? || answer.has_agree==0>style="background-image: url('/img/comment_zan.png');" </#if>
               href="javascript:void(0);">
                <u  <#if !(answer.has_agree)?? || answer.has_agree==0> style="color: rgb(183, 183, 183);"
                                                                       tagval="uncheck" </#if>>${(answer.agree_count)!''}</u>
            </a>
			<a class="share_btn" id="share" href="javascript:void(0);">分享</a>
		</span>
    </div>


<#include "/pubmodule/wenda_pubTongji.ftl" />
</div>

<!-- 回到顶部 -->
<div class="go_top" id="goTop"><span></span> <i></i></div>

<!-- 遮罩层 -->
<div class="mask"></div>

<!-- 弹层 -->
<div class="tanceng_tip">

    <div class="some_fixed_tips action_tips">收藏成功</div>

    <div class="some_fixed_tips review_tips"></div>

    <!-- 删除提醒 -->
    <div class="delete_sure">
        <p class="tip">
            <span>删除提醒</span>
            <span>确定要删除该问题吗?</span>
        </p>
        <p class="sure_btn">
            <a id="sureDelete">确认</a>
            <a id="cancleDelete">取消</a>
        </p>
    </div>

    <!-- 举报列表 -->
    <div class="alarm_fixed_area" id="alarmArea">
        <ul class="alarm_fixed_list">
            <li class="alarm_title">举报理由</li>
            <li><a href="javascript:void(0);">广告</a></li>
            <li><a href="javascript:void(0);">色情</a></li>
            <li><a href="javascript:void(0);">反动</a></li>
            <li><a href="javascript:void(0);">侵权</a></li>
        </ul>
        <p class="cancle" id="cancle_turn"><span>取消</span></p>
    </div>

    <!-- 评论 -->
<#include "fragment/comment.ftl"  />

    <!-- 底部分享弹层-->
    <div class="zsh_shareLayer">
        <div class="share_box clearfix">
        </div>
        <button type="button" class="zsh_cancel">取消</button>
    </div>
    <!-- 微信分享如果是safari浏览器-->
    <div class="zsh_sf_mask"></div>
    <div class="zsh_sf_layer wx_share_tip">
        <span class="zsh_sf_arrowDown"></span>
        <span class="zsh_sf_wx"></span>
        <p>1、在Safari浏览器中点击“<img src="http://static.qcdqcdn.com/wap/img/share_img1.jpg" class="share_img1">”</p>
        <p>2、在弹出的浮层中点击更多“<img src="http://static.qcdqcdn.com/wap/img/share_img2.jpg" class="share_img2">”</p>
        <p>3、微信设置为“<img src="http://static.qcdqcdn.com/wap/img/share_img3.jpg" class="share_img3">”状态</p>
        <p>4、完成以上操作即可查看“微信”图标</p>
        <p>
            <img src="http://static.qcdqcdn.com/wap/img/share_img4.jpg" class="share_img4">
            <img src="http://static.qcdqcdn.com/wap/img/share_img4.jpg" class="share_img4">
            <img src="http://static.qcdqcdn.com/wap/img/share_img5.jpg" class="share_img5">
            <img src="http://static.qcdqcdn.com/wap/img/share_img2.jpg" class="share_img2">
            点击完成分享
        </p>
    </div>

</div>

<!-- 右侧市层-->
<!-- 右侧市层遮罩层 -->
<div class="mask_area">
    <div class="mask"></div>
    <div class="mask_jt"></div>
</div>

<#include  "fragment/address.ftl" />

<input type="hidden" value="" id="attachs_val"/>
<input type="hidden" value="${(question.key)!''}" jump_page="1" name="question_id" id="question_id"/>
<input type="hidden" value="${(answer.uid)!''}" id="reply_user_id"/>
<input type="hidden" value="${(answer.answer_id)!''}" id="reply_answer_id"/>
<input type="hidden" value="" id="reply_comment_id"/>
<input type="hidden" value="${(clientCityId)!''}" id="city_id"/>
<input type="hidden" value="" id="target_deal"/>
<input type="hidden" value="" id="delete_id"/>
<input type="hidden" value="${(question.key)!''}" id="question_key"/>


<script src="${jsPath}/components/swiper.js"></script>
<script src="${jsPath}/components/imgViewer.js"></script>
<script src="${jsPath}/shareLayer.js"></script>
<script src="${jsPath}/wenda_ans_detail.js"></script>


<script src="${jsPath}/jquery.circliful.js"></script>

<!-- 分享参数  微信 h5-->
<input id="weixinid" type="hidden" value="${base}/answer/${(question.key)!''}">
<!-- 分享参数  qq-->
<div id="share_qq" style="display: none;">
    <input class="sharetitleid" type="hidden" value="${(question.user.name)!''}在汽车大全的问答">
    <input class="sharelurlid" type="hidden" value="${base}/answer/${(question.key)!''}">
    <input class="sharecontentid" type="hidden" value="${(question.contentSpare)!''}">
    <input class="sharepicid" type="hidden" value="${(attach_url)!''}">
</div>


<!-- 分享参数  qq空间-->
<div id="share_qq_zone" style="display: none;">
    <input class="sharetitleid" type="hidden" value="${(question.user.name)!''}在汽车大全的问答">
    <input class="sharelurlid" type="hidden" value="${base}/answer/${(question.key)!''}">
    <input class="sharecontentid" type="hidden" value="${(question.contentSpare)!''}">
    <input class="sharepicid" type="hidden" value="${(attach_url)!''}">
</div>
<!-- 分享参数  sina-->
<div id="share_sina" style="display: none;">
    <input class="sharetitleid" type="hidden" value="${(question.user.name)!''}在@行圆汽车大全的问答">
    <input class="sharelurlid" type="hidden" value="${base}/answer/${(question.key)!''}">
    <input class="sharecontentid" type="hidden" value="${(question.contentSpare)!''}">
    <input class="sharepicid" type="hidden" value="${(attach_url)!''}">
</div>


<!-- 大图弹层 -->
<script type="text/javascript" src='${jsPath}/wdhtml/wenda_answer_detail.js'></script>
<script type="text/javascript" src="${jsPath}/jquery.fancybox.js"></script>
<script src="${jsPath}/shareWenda.js"></script>


<input type="hidden" id="friend_title" value="${(question.user.name)!''}在汽车大全的问答 ${(question.contentSpare)!''}"/>
<input type="hidden" id="friend_img" value="${(attach_url)!''}"/>
<input type="hidden" id="friend_link" value="https://h5.qichedaquan.com/ask/answer/${(question.key)!''}"/>

<input type="hidden" id="people_title" value="${(question.user.name)!''}在汽车大全的问答"/>
<input type="hidden" id="people_desc" value="${(question.contentSpare)!''}"/>
<input type="hidden" id="people_img" value="${(attach_url)!''}"/>
<input type="hidden" id="people_link" value="https://h5.qichedaquan.com/ask/answer/${(question.key)!''}"/>

<input type="hidden" id="qq_title" value="${(question.user.name)!''}在汽车大全的问答"/>
<input type="hidden" id="qq_desc" value="${(question.contentSpare)!''}"/>
<input type="hidden" id="qq_img" value="${(attach_url)!''}"/>
<input type="hidden" id="qq_link" value="https://h5.qichedaquan.com/ask/answer/${(question.key)!''}"/>

<input type="hidden" id="weibo_title" value="${(question.user.name)!''}在汽车大全的问答 网页链接 分享自 @行圆汽车大全"/>
<input type="hidden" id="weibo_desc" value="${(question.contentSpare)!''}"/>
<input type="hidden" id="weibo_img" value="${(attach_url)!''}"/>
<input type="hidden" id="weibo_link" value="https://h5.qichedaquan.com/ask/answer/${(question.key)!''}"/>

<input type="hidden" id="qZone_title" value="${(question.user.name)!''}在汽车大全的问答"/>
<input type="hidden" id="qZone_desc" value="${(question.contentSpare)!''}"/>
<input type="hidden" id="qZone_img" value="${(attach_url)!''}"/>
<input type="hidden" id="qZone_link" value="https://h5.qichedaquan.com/ask/answer/${(question.key)!''}"/>


</body>
</html>
