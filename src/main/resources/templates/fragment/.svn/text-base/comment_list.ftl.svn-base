<#if (commentList)??>
    <#list  commentList.list as item>
    <dl class="comment_list clearfix">
        <dt>
            <a href="/user?uid=${(item.user.uid)!''}">
                <img onerror="nofindUser()" src="${(item.user.avatar)!'/img/user_default_title.png'}">
            </a>
            <#if item.user.is_official==1>
                <img src="/img/guangfang1.png" class="level_title">
            <#else>
                <#if item.user.type==2>
                    <img src="/img/expert.png" class="level_title">
                <#elseif item.user.type==1>
                    <img src="/img/biaobing.png" class="level_title">
                <#elseif item.user.type==3>
                    <img src="/img/guwen.png" class="level_title">
                </#if>
            </#if>
        </dt>
        <dd>
            <span onclick="window.location.href='/user?uid=${(item.user.uid)!''}'" class="comment_name">${(item.user.name)!''}</span>
            <#if item.user.type==3>
                <br>
                <span class="comment_des">${(item.user.word)!''}</span>
            </#if>
            <span class="want_do"  tagVal="${(item.comment_id)!''}">
			<i class="delete_alarm">
                        <em></em>
                <#if (uid)??>
                    <#if (item.uid==uid)>
                        <img style="display: inline-block;"
                             src="/img/wd_delete.png" class="delete">
                    <#else>
                        <img style="display: inline-block;"
                             src="/img/alarm.png" class="alarm">
                    </#if>
                <#else>
                    <img style="display: inline-block;"  src="/img/alarm.png"
                         class="alarm">
                </#if>
                    </i>
			</span>
        </dd>
        <dd class="commnet_text">
            <p class="text_content">
                <#if (item.reply.name)??>
                    回复  ${(item.reply.name)!''}:<br>
                </#if>
            ${(item.content)!''}
            </p>
        </dd>
        <dd class="show_more" style="display: none">展开全部
            <img src="/img/down_hui.png">
        </dd>
        <#if item.has_attach==1>
            <dd class="comment_img clearfix">
                <#list item.attachs as attach>
                    <#if attach.type==0>
                        <a href="/attach/${item.comment_id}?type=3&index=${attach_index}" style='background-image: url("${(attach.url)!''}")'  data-type="image">
                            <img src="${(attach.url)!''}" alt="" group="${(item.comment_id)!''}"  >
                        </a>
                    </#if>
                </#list>
            </dd>
        </#if>

        <#if (item.quotation)??>
            <#list item.quotation as quotation>
                <#if (quotation_index>=1)><#break></#if>
                <dd class="comment_img comment_bj">
                    <a href="/offering?comment_id=${(item.comment_id)!''}" style='background-image: url("${(quotation.content[0].img)!''}")'>
                        <img src="${(quotation.content[0].img)!''}" onerror="nofind()"
                             group="${(item.comment_id)!''}">
                    </a>
                </dd>
            </#list>
        </#if>

        <dd>
            <span class="comment_time"><i>${(item.created_at)!''}</i>${(item.city.name)!''}</span>
            <span class="comment_interaction">
               	<span class="comment_zan <#if (item.has_agree)?? && item.has_agree==1>comment_zan_checked</#if>"
                      tagVal="${item.comment_id}" target_type="3">${(item.agree_count)!''}</span>
							<span class="comment_reply" tagUid="${(item.user.uid)!''}"
                                  tagName="${(item.user.name)!''}"
                                  tagAnswerId="${(item.answer_id)!''}"
                                  tagCommentId="${(item.comment_id)!''}"></span>
			</span>
        </dd>
    </dl>
    </#list>
</#if>