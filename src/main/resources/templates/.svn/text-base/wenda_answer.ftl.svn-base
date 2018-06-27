<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="App-Config" content="fullscreen=yes,useHistoryState=yes,transition=yes">
    <meta itemprop="name" content="问题详情">
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
    <meta name="description"
          content="<#if (question.webtitle)?? && question.webtitle?length gt 30>${question.webtitle?substring(0,30)}<#else>${(question.webtitle)!''}</#if>-问答-手机汽车大全"
    />
    <meta name="keywords" content="${question.keywords}"/>
<#include "pubmodule/common_top.ftl" />
    <link rel="stylesheet" href="${cssPath}/wenda_answer.css">
    <link rel="stylesheet" href="${cssPath}/jquery.fancybox.css">
</head>
<body>

<#include "pubmodule/wenda_pubHeadNav.ftl" />

<!-- 问答详情 -->
<div class="answer_page">
    <!-- 标题 -->
<#assign  head_title="问答详情" />
<#if (question.type)?? && question.type==1>
    <#assign  head_title="详情" />
</#if>
<#if question.attach_type==6>
    <#assign  head_title="活动详情" />
</#if>
<#include "pubmodule/wenda_pubHead.ftl" />

    <!-- 正文 -->
    <div class="main_text_module">
        <div class="user_msg clearfix">
            <a href="javascript:void(0);" class="publist_user clearfix">
                <img onclick="window.location.href='/user?uid=${(question.user.uid)!''}'" onerror="nofindUser()"
                     src="${(question.user.avatar)!'/img/user_default_title.png'}"
                     class="user_photo">
                <p class="publish_msg">
                    <span onclick="window.location.href='/user?uid=${(question.user.uid)!''}'"
                          class="user_name">${(question.user.name)!''}</span>
                    <span class="time_area">
                        <i class="type"
                           onclick="window.location.href='/issues?category_id=${(question.category_id)!''}&category_name=${(question.category_name)!''}'">${(question.category_name)!''}</i>
                        <i>${(question.created_at)!''}</i>
                    ${(question.city.name)!''}
                    </span>
                </p>

            <#if question.user.is_official==1>
                <img src="/img/guangfang1.png" class="level_title">
            <#else>
                <#if question.user.type==2>
                    <img src="/img/expert.png" class="level_title">
                <#elseif question.user.type==1>
                    <img src="/img/biaobing.png" class="level_title">
                <#elseif question.user.type==3>
                    <img src="/img/guwen.png" class="level_title">
                </#if>
            </#if>
            </a>
            <span class="want_do want_question_deal">
					<i class="delete_alarm">
                        <em></em>
                    <#if (uid)??>
                        <#if (question.user.uid==uid)>
                            <img style="display: inline-block;" src="/img/wd_delete.png" class="delete">
                        <#else>
                            <img style="display: inline-block;" src="/img/alarm.png" class="alarm">
                        </#if>
                    <#else>
                        <img style="display: inline-block;" src="/img/alarm.png" class="alarm">
                    </#if>
                    </i>
				</span>
        </div>

        <div class="content_main">
        <#import "/fragment/question_tag.ftl" as question_tag>
        <#if question.is_html==1 && (question.title)?? && question.title!=''>
            <h3 class="recom_title recom_text">
                <@question_tag.node question = question  />
            ${(question.title)!''}
            </h3>
            <div class="placeholder-text">
            ${(question.ycontent)!''}
            </div>
        <#else>
            <#assign showTag=0 />
            <#if (question.title)?? && question.title!=''>
                <#assign  showTag=1  />
                <h3 class="recom_title recom_text">
                    <@question_tag.node question = question  />
                ${(question.title)!''}
                </h3>
            </#if>
            <p class="recom_text">
                <#if showTag==0>
                    <@question_tag.node question = question  />
                </#if>
            ${(question.content)!''}
            </p>
        </#if>
        <#if (question.tags)?? && (question.tags?split(",")[0]?length gt 0) >
            <p class="vote_label">
                <#list question.tags?split(",") as it>
                    <span>${(it)!''}</span>
                </#list>
            </p>
        </#if>

        <#if question.attach_type==3 || question.attach_type==4>
            <div class="vote_model">
                <#if (question.vote)?? && (question.vote?size>0)>
                    <#list question.vote as vote>
                        <#if (vote.content)??>
                            <p>共<span id="vote_total">${vote.total}</span>人投票<#if vote.has_closed==1>，已结束</#if> <span
                                    class="have_vote" <#if (vote.has_vote_id)??  && vote.has_vote_id!=''>
                                    style="display: inline;" </#if>> 已投票</span></p>
                            <ul>
                                <#if (((vote.has_vote_id)?? && vote.has_vote_id!='') || vote.has_closed==1 ) || ((uid)?? && question.user.uid==uid)>
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
                                <#else>
                                    <#list  vote.content as voteContent>
                                        <li>
                                            <p>${voteContent.text}</p>
                                            <button class="but_vote" tagVal="${voteContent.vote_id}">投票</button>
                                            <div class="myStat" data-dimension="60" data-text="${voteContent.rate}"
                                                 data-percent="${voteContent.rate?split('%')[0]}"
                                                 data-width="3" data-fontsize="13" data-fgcolor="#8fc9ff"
                                                 data-bgcolor="#d9edff">
                                            </div>
                                        </li>
                                    </#list>
                                </#if>
                            </ul>
                        </#if>
                    </#list>
                </#if>
            </div>
        <#else>
            <#if question.is_html==0>
                <p class="recom_img">
                    <#if (question.attachs)??>
                        <#list question.attachs as attach>
                            <#if attach.type==0>
                                <#if attach_index==0>
                                    <#assign  attach_url=attach.url  />
                                </#if>
                                <a href="/attach/${question.key}?type=1&index=${attach_index}"
                                   style='background-image: url("${(attach.url)!''}")'
                                   data-type="image">
                                    <img src="${(attach.smallUrl)!''}" alt="">
                                </a>
                            </#if>
                        </#list>
                    </#if>
                </p>
            </#if>
        </#if>

        <#if (question.distribute)?? && (question.distribute[0].content[0])?? >
            <p class="recom_news">
                <a href="javascript:void(0)"
                   news-id="${(question.distribute[0].content[0].id)!''}" <#if question.distribute[0].content[0].type=='video'>
                   video="2" </#if> class="clearfix">
                    <img src="${(question.distribute[0].content[0].image)!''}" alt="">
                    <span>${(question.distribute[0].content[0].text)!''}</span>
                </a>
            </p>
        </#if>

        <#if (question.cars)?? && (question.cars?size>0)>
            <p class="recom_type">
                <#list question.cars as car>
                    <a href="/issues?series_id=${(car.id)!''}&series_name=${(car.name)!''}">${(car.name)!''}</a>
                </#list>
            </p>
        </#if>
        <#if question.attach_type==6>
            <#if question.activity[0].content[0].sign=='none'>
            <#else>
                <p class="share_status">
                    <#if  (question.activity[0].content[0].sign)?? && question.activity[0].content[0].sign=='direct'>
                        <#if (sign_status)?? && sign_status=='1'>
                            <#if question.activity[0].has_signed==0>
                                <span class="not" data="${(question.activity[0].attach_id)!''}">报名</span>
                            <#else>
                                <span class="just">已报名</span>
                            </#if>
                        <#elseif (sign_status)?? && sign_status=='0'>
                            <#if question.activity[0].has_signed==0>
                                <span class="done">已截止报名</span>
                            <#else>
                                <span class="just">已报名</span>
                            </#if>
                        <#else>
                            <span class="just">${(sign_status)!''}</span>
                        </#if>
                    <#elseif (question.activity[0].content[0].sign)?? && question.activity[0].content[0].sign=='subject'>
                        <span class="partake"
                              onclick="window.location.href='/publish?subject=${(question.activity[0].content[0].subject?replace('#','' ))!''}'">参与话题</span>
                    <#elseif (question.activity[0].content[0].sign)?? && question.activity[0].content[0].sign=='indirect'>
                        <#if (sign_status)?? && sign_status=='1'>
                            <span class="not" tagVal="${(question.activity[0].attach_id)!''}">去报名</span>
                        <#elseif (sign_status)?? && sign_status=='0'>
                            <span class="done">已截止报名</span>
                        <#else>
                            <span class="just">${(sign_status)!''}</span>
                        </#if>
                    </#if>
                </p>
            </#if>
        </#if>
            <p class="recom_other clearfix">
            <#if (agreeUserList)??>
                <span class="zan_user">
                    <#list agreeUserList as agreeUser>
                        <#if agreeUser_index==6>
                            <img onerror="nofindUser()" tagVal="${agreeUser.uid}" style="display: none"
                                 src="${(agreeUser.avatar)!'/img/user_default_title.png'}">
                        <#else>
                            <img onerror="nofindUser()" tagVal="${agreeUser.uid}"
                                 src="${(agreeUser.avatar)!'/img/user_default_title.png'}">
                        </#if>
                    </#list>
				</span>
            </#if>
                <span class="reply_num">
					<span target_type="2"
                          class="comment_zan <#if (question.has_agree)?? && question.has_agree==1>comment_zan_checked</#if>"
                          tagVal="${question.key}">${(question.agree_count)!''}</span>
    				    <span class="comment_reply" target_type="2">${(question.answer_count)!''}</span>
				</span>
            </p>
        </div>
    </div>

    <!-- 间隔条 -->
    <div class="bg_bar"></div>
    <!-- 回答模块 -->
    <div class="answer_module">
        <div class="sort">
            <span id="to_sort" <#if (sort)?? && sort==-1> class="unsort" </#if>>按时间<#if (sort)?? && sort==-1>倒序<#else>
                正序</#if></span>
        </div>
        <div class="answer_area">
        <#include "fragment/answer_list.ftl" />
        </div>
    <#include "fragment/answer_list_bottom.ftl" />
    </div>
<#assign cur_module_name="问答详情" />
<#if (question.type)?? && question.type==1>
    <#assign  cur_module_name="详情" />
</#if>
<#if question.attach_type==6>
    <#assign  cur_module_name="活动详情" />
</#if>

<#include "pubmodule/wenda_pubBottom.ftl" />

    <!-- 我来说两句 -->
    <div class="function_bar clearfix">
        <input id="review" readonly type="text" placeholder="我来说两句...">
        <span>
			<a class="review_btn" href="javascript:void(0);"><i></i><em>${(question.answer_count)!''}</em></a>
			<a class="collect_btn" href="javascript:void(0);"></a>
			<a class="share_btn" id="share" href="javascript:void(0);"></a>
		</span>
    </div>

</div>

<!-- 回到顶部 -->
<div class="go_top" id="goTop"><span></span> <i></i></div>

<!-- 遮罩层 -->
<div class="mask"></div>

<!--loading-->
<div class="up_load"><span></span>上传中...</div>

<!-- 弹层 -->
<div class="tanceng_tip">
    <div class="some_fixed_tips action_tips">关注成功</div>
    <div class="some_fixed_tips review_tips"></div>
    <!-- 删除提醒 -->
    <div class="delete_sure">
        <p class="tip">
            <span>删除提醒</span>
            <span>确定要删除该内容吗?</span>
        </p>
        <p class="sure_btn">
            <a href="javascript:void(0);" id="sureDelete">确认</a>
            <a href="javascript:void(0);" id="cancleDelete">取消</a>
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
        <p>1、在Safari浏览器中点击“<img src="/img/share_img1.jpg" class="share_img1">”</p>
        <p>2、在弹出的浮层中点击更多“<img src="/img/share_img2.jpg" class="share_img2">”</p>
        <p>3、微信设置为“<img src="/img/share_img3.jpg" class="share_img3">”状态</p>
        <p>4、完成以上操作即可查看“微信”图标</p>
        <p>
            <img src="/img/share_img4.jpg" class="share_img4">
            <img src="/img/share_img4.jpg" class="share_img4">
            <img src="/img/share_img5.jpg" class="share_img5">
            <img src="/img/share_img2.jpg" class="share_img2">
            点击完成分享
        </p>
    </div>
</div>
<!-- 右侧市层遮罩层 -->
<div class="mask_area" style="display: none;">
    <div class="mask" style="display: block;"></div>
    <div class="mask_jt"></div>
</div>
<!-- load图标弹层 -->
<div class="load_mask">
    <span></span>
    <img src="http://static.qcdqcdn.com/wap/img/load_w.png">
</div>

<#include  "fragment/address.ftl" />

<input type="hidden" value="${(question.key)!''}" name="question_id" id="question_id"/>
<input type="hidden" value="" id="reply_user_id"/>
<input type="hidden" value="" id="reply_answer_id"/>
<input type="hidden" value="" id="reply_comment_id"/>
<input type="hidden" value="" id="delete_answer_id"/>
<input type="hidden" value="" id="attachs_val"/>
<input type="hidden" value="" id="target_deal"/>
<input type="hidden" value="${(clientCityId)!''}" id="city_id"/>
<input type="hidden" value="${(question_key)!''}" id="question_key"/>
<input type="hidden" value="${(question.has_favorite)!'0'}" id="has_favorite"/>
<input type="hidden" value="${(sort)!'1'}" id="sort"/>


<div class="share_wenda">
    <input type="text" class="title">
    <input type="text" class="url">
    <input type="text" class="qq">
    <input type="text" class="weibo">
    <input type="text" class="pic">
</div>

<!-- 分享参数  微信 h5-->
<input id="weixinid" type="hidden"
       value="${base}/answer/${(question.key)!''}?utm_source=webshare&utm_campaign=mask">
<!-- 分享参数  qq-->
<div id="share_qq" style="display: none;">
    <input class="sharetitleid" type="hidden"
           value="<#if (question.title)?? && (question.title)!=''>${(question.title)!''}<#else>${(question.contentSpare)!''}</#if>">
    <input class="sharelurlid" type="hidden"
           value="${base}/answer/${(question.key)!''}?utm_source=webshare&utm_campaign=mask">
    <input class="sharecontentid" type="hidden"
           value="${(question.user.name)!''}在汽车大全的问答">
    <input class="sharepicid" type="hidden"
           value="<#if (question.cover)??>${(question.cover)!''}<#else>${(attach_url)!''}</#if>">
</div>


<!-- 分享参数  qq空间-->
<div id="share_qq_zone" style="display: none;">
    <input class="sharetitleid" type="hidden"
           value="<#if (question.title)?? && (question.title)!=''>${(question.title)!''}<#else>${(question.contentSpare)!''}</#if>">
    <input class="sharelurlid" type="hidden"
           value="${base}/answer/${(question.key)!''}?utm_source=webshare&utm_campaign=mask">
    <input class="sharecontentid" type="hidden"
           value="${(question.user.name)!''}在汽车大全的问答">
    <input class="sharepicid" type="hidden"
           value="<#if (question.cover)??>${(question.cover)!''}<#else>${(attach_url)!''}</#if>">
</div>
<!-- 分享参数  sina-->
<div id="share_sina" style="display: none;">
    <input class="sharetitleid" type="hidden" value="${(question.user.name)!''}在@行圆汽车大全的问答">
    <input class="sharelurlid" type="hidden"
           value="${base}/answer/${(question.key)!''}?utm_source=webshare&utm_campaign=mask">
    <input class="sharecontentid" type="hidden"
           value="<#if (question.title)?? && (question.title)!=''>${(question.title)!''}<#else>${(question.contentSpare)!''}</#if>">
    <input class="sharepicid" type="hidden"
           value="<#if (question.cover)??>${(question.cover)!''}<#else>${(attach_url)!''}</#if>">
</div>

<script type="text/javascript" src="${jsPath}/jquery.fancybox.js"></script>
<script src="${jsPath}/jquery.circliful.js"></script>
<script type="text/javascript" src='${jsPath}/wdhtml/wenda_answer.js'></script>
<#--<script type="text/javascript" src='/js/wap/wenda_answer.js'></script>-->


<script src="${jsPath}/shareWenda.js"></script>

<input type="hidden" id="friend_title"
       value="${(question.user.name)!''}在汽车大全的问答 <#if (question.title)?? && (question.title)!=''>${(question.title)!''}<#else>${(question.contentSpare)!''}</#if>"/>
<input type="hidden" id="friend_img" value="${(attach_url)!''}"/>
<input type="hidden" id="friend_link"
       value="${base}/answer/${(question.key)!''}?utm_source=webshare&utm_campaign=mask"/>

<input type="hidden" id="people_title"
       value="<#if (question.title)?? && (question.title)!=''>${(question.title)!''}<#else>${(question.contentSpare)!''}</#if>"/>
<input type="hidden" id="people_desc"
       value="${(question.user.name)!''}在汽车大全的问答"/>
<input type="hidden" id="people_img" value="${(attach_url)!''}"/>
<input type="hidden" id="people_link"
       value="${base}/answer/${(question.key)!''}?utm_source=webshare&utm_campaign=mask"/>

<input type="hidden" id="qq_title"
       value="<#if (question.title)?? && (question.title)!=''>${(question.title)!''}<#else>${(question.contentSpare)!''}</#if>"/>
<input type="hidden" id="qq_desc"
       value="${(question.user.name)!''}在汽车大全的问答"/>
<input type="hidden" id="qq_img" value="${(attach_url)!''}"/>
<input type="hidden" id="qq_link"
       value="${base}/answer/${(question.key)!''}?utm_source=webshare&utm_campaign=mask"/>

<input type="hidden" id="weibo_title" value="${(question.user.name)!''}在汽车大全的问答 网页链接 分享自 @行圆汽车大全"/>
<input type="hidden" id="weibo_desc"
       value="<#if (question.title)?? && (question.title)!=''>${(question.title)!''}<#else>${(question.contentSpare)!''}</#if>"/>
<input type="hidden" id="weibo_img" value="${(attach_url)!''}"/>
<input type="hidden" id="weibo_link"
       value="${base}/answer/${(question.key)!''}?utm_source=webshare&utm_campaign=mask"/>

<input type="hidden" id="qZone_title"
       value="<#if (question.title)?? && (question.title)!=''>${(question.title)!''}<#else>${(question.contentSpare)!''}</#if>"/>
<input type="hidden" id="qZone_desc"
       value="${(question.user.name)!''}在汽车大全的问答"/>
<input type="hidden" id="qZone_img" value="${(attach_url)!''}"/>
<input type="hidden" id="qZone_link"
       value="${base}/answer/${(question.key)!''}?utm_source=webshare&utm_campaign=mask"/>

</body>
</html>
