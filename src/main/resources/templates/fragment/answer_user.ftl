<#if (userAnswer.list)?? && (userAnswer.list?size>0)  >
    <#if userAnswer.page==1>
    <div class="ans_expert_box">
    </#if>
    <#list userAnswer.list as answer>
        <div class="ans_expert_list">
            <a href="javascript:void(0);">
                <p class="recom_text2 recon_over">
                ${(answer.content)!''}
                    <#if (answer.content?length > 70) >
                        <span class="ans_unfold" style="display: block;">
					      展开全部
                        <img src="/img/down_gray.png">
					    </span>
                    </#if>
                </p>
            </a>
            <p class="recom_img  clearfix">
                <#if (answer.attachs)??>
                    <#list answer.attachs as attach>
                        <#if (attach_index<3)>
                            <#if attach.type==0>
                                <a href="/attach/${answer.answer_id}?type=2&index=${attach_index}"    style='background-image: url("${(attach.url)!''}")'
                                   data-type="image">
                                    <img src="${(attach.smallUrl)!''}" alt="">
                                </a>
                            </#if>
                        <#else>
                            <#break>
                        </#if>
                    </#list>
                </#if>
            </p>
            <#if (answer.reply.name)?? && (answer.reply.deleted_at==0)>
                <p class="recom_con"
                   onclick="window.location.href='./answer/${(answer.question.key)!''}'">
                    <span>${(answer.reply.name)!''}</span>
                    <#if answer.question.attach_type==3 || answer.question.attach_type==4>
                        发起的投票：
                    <#else>
                        发表的内容：
                    </#if>
                    <span class="ans_text">${(answer.reply.content)!''}</span>
                </p>
            <#elseif (answer.question)?? && answer.question.deleted_at==0 >
                <p class="recom_con"
                   onclick="window.location.href='./answer/${(answer.question.key)!''}'">
                    <span>${(answer.question.user.name)!''}</span>
                    <#if answer.question.attach_type==3 || answer.question.attach_type==4>
                        发起的投票：
                    <#else>
                        发表的内容：
                    </#if>
                    <span class="ans_text">
                        <#if (answer.question.title)?? && answer.question.title!=''>
                           ${(answer.question.title)!''}
                        <#else>
                           ${(answer.question.content)!''}
                        </#if>
                    </span>
                </p>
            <#else>
                <p class="recom_delete">
                    内容已删除
                </p>
            </#if>

            <p class="recom_other clearfix">
                 <span class="time_area">
                      <i>
                      ${(answer.created_at)!''}
                      </i>
                 ${(answer.city.name)!''}
                 </span>
                <span tagVal="${(answer.answer_id)!''}" class="reply_num reply_zan">
			           <i <#if (answer.has_agree)?? && answer.has_agree==1> tagVal="check"
                                                                            style="background-image:url(/img/comment_zan2.png);" </#if>>
                       </i>
			           <span <#if  (answer.has_agree)?? && answer.has_agree==1 >
                               style="color:#ff3131;" </#if>>${(answer.agree_count)!''}
                       </span>
			      </span>
            </p>
        </div>
    </#list>
    <#if userAnswer.page==1>
    </div>
    </#if>
</#if>
