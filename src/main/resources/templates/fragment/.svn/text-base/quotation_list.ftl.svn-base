<#if (questionRes)??>
    <#list  questionRes.list as item>
    <div class="main_text_module">
        <div class="user_msg clearfix">
            <a href="/user?uid=${(item.user.uid)!''}" class="publist_user clearfix">
                <img onerror="nofindUser()" src="${(item.user.avatar)!'/img/user_default_title.png'}"
                     class="user_photo">
                <p class="publish_msg relate_per">
                    <span class="user_name">${(item.user.name)!''}</span>
                    <span class="time_area">${(item.user.word)!''}</span>
                </p>
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
            </a>
        </div>

        <#if  (item.comment_id)??>
            <#assign question=item.answer.question   />
            <div class="content_main">
                <a href="#" class="use_car"></a>
                <p class="recom_text">
                ${(item.content)!''}
                </p>
                <#if (item.quotation)??>
                    <#list item.quotation as quotation>
                        <#if (quotation_index>=1)><#break></#if>
                        <p class="recom_img">
                            <a href="/offering?comment_id=${(item.comment_id)!''}"
                               style='background-image: url("${(quotation.content[0].img)!''}")'>
                                <img src="${(quotation.content[0].img)!''}" onerror="nofind()">
                                <#assign  shareImg=quotation.content[0].img  />
                            </a>
                            <span class="image_sign">
                                <i class="long_img">长图</i>
                            </span>
                        </p>
                    </#list>
                </#if>
            </div>
        <#else>
            <#assign question=item.question   />
            <div class="content_main">
                <a href="#" class="use_car"></a>
                <p class="recom_text">
                ${(item.content)!''}
                </p>
                <#if (item.attachs)??>
                    <#list item.attachs as attach>
                        <#if (attach_index>=1)><#break></#if>
                        <p class="recom_img">
                            <a href="/attach/${item.answer_id}?type=2&index=${attach_index}"
                               style='background-image: url("${(attach.url)!''}")'>
                                <img src="${(attach.url)!''}" onerror="nofind()">
                                <#assign  shareImg=attach.url  />
                                <span class="image_sign">
                                    <i class="long_img">长图</i>
                                </span>
                            </a>
                        </p>
                    </#list>
                </#if>
            </div>
        </#if>
        <div class="relate_ask">
            <!--普通-->
            <div class="relate_content">
                <p class="recom_text">
                    <#import "/fragment/question_tag.ftl" as question_tag>
                    <@question_tag.node question = question  />
                ${(question.content)!''}
                </p>
                <a class="to_ques" href="/answer/${(question.key)!''}">查看原帖</a>
            </div>
        </div>
        <p class="relate_time">
            <span class="comment_time"><i>${(item.created_at)!''}</i>${(item.city.name)!''}</span>
            <span class="comment_interaction">
                    <span class="comment_share"
                          data-img="${(shareImg)!''}"
                          data-title="#买车那些事#NO.33买车看起来是非常迷茫的事，毕竟买辆车... --福禄小金刚的评论"
                          data-weibo=""
                          data-sub="sssssssssssssssssssssssss"
                          data-url="http://ask.m.qichedaquan.com/quotations">
                    </span>
                <#if  (item.comment_id)??>
                    <span class="comment_reply" taguid="${(item.user.uid)!''}" tagname="${(item.user.name)!''}"
                          tagquestionid="${(question.key)!''}" taganswerid="${(item.answer.answer_id)!''}"
                          tagCommentId="${(item.comment_id)!''}"> </span>
                <#else>
                    <span class="comment_reply" taguid="${(item.user.uid)!''}" tagname="${(item.user.name)!''}"
                          tagquestionid="${(question.key)!''}" taganswerid="${(item.answer.answer_id)!''}"> </span>
                </#if>
           </span>
        </p>

    </div>

    </#list>
</#if>
