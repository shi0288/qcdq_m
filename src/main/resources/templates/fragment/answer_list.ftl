<#if (answerRes)??>
    <#list  answerRes.list as answer>
    <dl class="comment_list clearfix">
        <dt>
            <a href="/user?uid=${(answer.user.uid)!''}">
                <img onerror="nofindUser()" src="${(answer.user.avatar)!'/img/user_default_title.png'}">
            </a>
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
        </dt>
        <dd>
            <#if answer.user.is_official==1>
                <span onclick="window.location.href='/user?uid=${(answer.user.uid)!''}'"
                      class="comment_name">${(answer.user.name)!''}</span>
                <span class="want_do">
					<i class="delete_alarm">
                        <em></em>
                        <#if (uid)??>
                            <#if (answer.uid==uid)>
                                <img style="display: inline-block;" tagVal="${(answer.answer_id)!''}"
                                     src="/img/wd_delete.png" class="delete">
                            <#else>
                                <img style="display: inline-block;" tagVal="${(answer.answer_id)!''}"
                                     src="/img/alarm.png" class="alarm">
                            </#if>
                        <#else>
                            <img style="display: inline-block;" tagVal="${(answer.answer_id)!''}" src="/img/alarm.png"
                                 class="alarm">
                        </#if>
                    </i>
			        </span>
            <#else>
                <#if answer.user.type==3>
                    <span onclick="window.location.href='/user?uid=${(answer.user.uid)!''}'"
                          class="comment_name">${(answer.user.name)!''}</span>
                    <br/>
                    <span class="comment_des">${(answer.user.word)!''}</span>
                    <span class="want_do has_quotation">
                        <#if uid!=answer.user.uid>
                            <a href="javascript:void(0);" class="toAskPrice" track="m_wendaxq_bjorderclick"
                               tagVal="/quotation?uid=${(answer.uid)!''}&reply_answer_id=${(answer.answer_id)!''}&reply_uid=${(answer.uid)!''}">找TA报价</a>
                        </#if>
                        <i class="delete_alarm">
                                <em></em>
                            <#if (uid)??>
                                <#if (answer.uid==uid)>
                                    <img style="display: inline-block;" tagVal="${(answer.answer_id)!''}"
                                         src="/img/wd_delete.png" class="delete">
                                <#else>
                                    <img style="display: inline-block;" tagVal="${(answer.answer_id)!''}"
                                         src="/img/alarm.png" class="alarm">
                                </#if>
                            <#else>
                                <img style="display: inline-block;" tagVal="${(answer.answer_id)!''}"
                                     src="/img/alarm.png"
                                     class="alarm">
                            </#if>
                        </i>
					</span>
                <#else>
                    <span onclick="window.location.href='/user?uid=${(answer.user.uid)!''}'"
                          class="comment_name">${(answer.user.name)!''}</span>
                    <span class="want_do">
					<i class="delete_alarm">
                        <em></em>
                        <#if (uid)??>
                            <#if (answer.uid==uid)>
                                <img style="display: inline-block;" tagVal="${(answer.answer_id)!''}"
                                     src="/img/wd_delete.png" class="delete">
                            <#else>
                                <img style="display: inline-block;" tagVal="${(answer.answer_id)!''}"
                                     src="/img/alarm.png" class="alarm">
                            </#if>
                        <#else>
                            <img style="display: inline-block;" tagVal="${(answer.answer_id)!''}" src="/img/alarm.png"
                                 class="alarm">
                        </#if>
                    </i>
			        </span>
                </#if>
            </#if>
        </dd>
        <dd onclick="window.location.href='/answer_detail/${(answer.answer_id)!''}'" class="commnet_text">
            <p class="text_content">
            ${(answer.content)!''}
            </p>
        </dd>
        <dd class="show_more" style="display: none">
            展开全部
            <img src="/img/down_hui.png">
        </dd>
        <#if (answer.attachs)??>
            <dd class="comment_img clearfix">
                <#list answer.attachs as attach>
                    <#if attach.type==0>
                        <a href="/attach/${answer.answer_id}?type=2&index=${attach_index}" style='background-image: url("${(attach.url)!''}")'
                            data-type="image">
                            <img src="${(attach.url)!''}" alt="">
                        </a>
                    </#if>
                </#list>
            </dd>
        </#if>
        <#if (answer.comment_list)?? && (answer.comment_list?size>0)>
            <dd class="reply">
                <#list answer.comment_list as comment>
                    <div class="reply_con">
                        <p class="text_content">
                            <i onclick="window.location.href='/user?uid=${(comment.user.uid)!''}'">${(comment.user.name)!''}</i>
                            <#if (comment.reply.name)??>
                                回复
                                <i onclick="window.location.href='/user?uid=${(comment.reply.uid)!''}'">${(comment.reply.name)!''}</i>
                            </#if>
                            :
                        ${(comment.content)!''}
                        </p>
                    </div>
                    <div class="show_more" style="display: none">
                        展开全部
                        <img src="/img/down_hui.png">
                    </div>
                    <#if comment.has_attach==1>
                        <div class="comment_img js_show_bigImg">
                            <a href="/attach/${comment.comment_id}?type=3&index=0"
                               style='background-image: url("${(comment.attachs[0].url)!''}")'
                               data-type="image">
                                <img src="${(comment.attachs[0].smallUrl)!''}" onerror="nofind()"
                                     group="${(comment.comment_id)!''}">
                            </a>
                        </div>
                    </#if>
                    <#if (comment.quotation)??>
                        <#list comment.quotation as quotation>
                            <#if (quotation_index>=1)><#break></#if>
                            <div class="comment_img js_show_bigImg">
                                <a href="/offering?comment_id=${(comment.comment_id)!''}"  style='background-image: url("${(quotation.content[0].img)!''}")'>
                                    <img src="${(quotation.content[0].img)!''}" onerror="nofind()"
                                         group="${(comment.comment_id)!''}">
                                </a>
                            </div>
                        </#list>
                    </#if>
                    <div class="cheek">
                        <span class="comment_time"><i>${(comment.created_at)!''}</i>${(comment.city.name)!''}</span>
                        <span class="comment_interaction">
							<span class="comment_zan <#if (comment.has_agree)?? && comment.has_agree==1>comment_zan_checked</#if>"
                                  tagVal="${comment.comment_id}" target_type="3">${(comment.agree_count)!''}</span>
							<span class="comment_reply" tagUid="${(comment.user.uid)!''}"
                                  tagName="${(comment.user.name)!''}"
                                  tagAnswerId="${(answer.answer_id)!''}"
                                  tagCommentId="${(comment.comment_id)!''}"></span>
				    </span>
                    </div>
                    <div class="border"></div>
                </#list>
                <div class="discuss">
                    <span onclick="window.location.href='/answer_detail/${(answer.answer_id)!''}'">共${(answer.comment_count)!''}条评论</span>
                </div>
            </dd>
        </#if>

        <dd>
            <span class="comment_time"><i>${(answer.created_at)!''}</i>${(answer.city.name)!''}</span>
            <span class="comment_interaction">
                <span class="comment_share" data-img="${(answer.share.qq.cover)!''}"
                      data-title="${(answer.share.qq.title)!''}" data-weibo="${(answer.share.weibo.cover)!''}"
                      data-sub="${(answer.share.qq.sub_title)!''}" data-url="${base}/answer_detail/${(answer.answer_id)!''}?utm_source=webshare&utm_campaign=mask"></span>
                <span class="comment_zan <#if (answer.has_agree)?? && answer.has_agree==1>comment_zan_checked</#if>"
                      tagVal="${answer.answer_id}" target_type="1">${(answer.agree_count)!''}</span>
    			<span class="comment_reply" tagUid="${(answer.user.uid)!''}" tagName="${(answer.user.name)!''}"
                      tagAnswerId="${(answer.answer_id)!''}"> ${(answer.comment_count)!''}</span>
			</span>
        </dd>
    </dl>
    </#list>
</#if>