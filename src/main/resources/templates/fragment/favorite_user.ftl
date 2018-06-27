<#if userFavorite??  && (userFavorite.list?size>0)>
    <#if userFavorite.page==1>
    <div class="ans_expert_box">
    </#if>
    <#list userFavorite.list as q>
        <dl class="recom_content_module">
            <dt>
                <div class="user_icon">
                    <a href="./user?uid=${q.user.uid}" class="user_photo">
                        <img onerror="nofindUser()" src="${(q.user.avatar)!'/img/user_default_title.png'}">
                    </a>
                    <#if q.user.is_official==1>
                        <img src="/img/guangfang1.png" class="level_title">
                    <#else>
                        <#if q.user.type==2>
                            <img src="/img/expert.png" class="level_title">
                        <#elseif q.user.type==1>
                            <img src="/img/biaobing.png" class="level_title">
                        <#elseif q.user.type==3>
                            <img src="/img/guwen.png" class="level_title">
                        </#if>
                    </#if>
                </div>
                <div class="user_info">
                    <a href="./user?uid=${q.user.uid}" class="user_name">${(q.user.name)!''}</a>
                    <div>
                        <span> ${(q.created_at)!''}</span>
                        <span onclick="window.location.href='./issues?category_id=${(q.category_id)!''}&category_name=${(q.category_name)!''}'">
                            类型：<i>${(q.category_name)!''}</i>
                        </span>
                    </div>
                    <span class="recommend"><i class="recommend_icon" tagVal="${(q.key)!''}"
                                               but="false"><em></em></i></span>
                </div>
            </dt>
            <dd>
                <div onclick="window.location.href='./answer/${(q.key)!''}'">
                    <#import "/fragment/question_tag.ftl" as question_tag>
                    <#if (q.title)??  && q.title!=''>
                        <h3 class="recom_title recom_text">
                            <@question_tag.node question = q  />
                    ${(q.title)!''}
                        </h3>
                    </#if>
                    <p class="recom_text">
                        <#if !(q.title)??  ||  q.title==''>
                            <@question_tag.node question = q  />
                        ${(q.title)!''}
                        </#if>
                ${(q.content)!''}
                    </p>
                </div>
                <#if q.attach_type==3 || q.attach_type==4>
                    <#if (q.vote)?? && (q.vote?size>0)>
                        <#list q.vote as vote>
                            <#if (vote.content)??>
                                <div class="vote_model">
                                    <p>共<span group-total="fav_${q.key}">${vote.total}</span>人投票<#if vote.has_closed==1>
                                        ，已结束</#if>
                                        <span group-have="fav_${q.key}"  <#if (vote.has_vote_id)??  && vote.has_vote_id!=''>
                                              style="display: inline;" </#if> class="have_vote">已投票</span>
                                    </p>
                                    <ul>
                                        <#if (((vote.has_vote_id)?? && vote.has_vote_id!='') || vote.has_closed==1 ) || ((uid)?? && q.user.uid==uid)>
                                            <#list  vote.content as voteContent>
                                                <li>
                                                    <p onclick="window.location.href='./answer/${(q.key)!''}'">${voteContent.text}</p>
                                                    <div class="myStat" group-vote="fav_${q.key}" data-dimension="60"
                                                         data-text="${voteContent.rate}"
                                                         data-percent="${voteContent.rate?split('%')[0]}"
                                                         data-width="3" data-fontsize="13"
                                                         data-fgcolor="<#if voteContent.vote_id==vote.has_vote_id>#2896fe<#else>#8fc9ff</#if>"
                                                         data-bgcolor="#d9edff">
                                                    </div>
                                                </li>
                                            </#list>
                                            <script>
                                                $(function () {
                                                    $("[group-vote='fav_${q.key}']").show();
                                                    $("[group-vote='fav_${q.key}']").circliful();
                                                })
                                            </script>
                                        <#else>
                                            <#list  vote.content as voteContent>
                                                <li>
                                                    <p onclick="window.location.href='./answer/${(q.key)!''}'">${voteContent.text}</p>
                                                    <button tagVal="${voteContent.vote_id}" group-id="fav_${q.key}">投票
                                                    </button>
                                                    <div class="myStat" group-vote="fav_${q.key}" data-dimension="60"
                                                         data-text="${voteContent.rate}"
                                                         data-percent="${voteContent.rate?split('%')[0]}"
                                                         data-width="3" data-fontsize="13" data-fgcolor="#8fc9ff"
                                                         data-bgcolor="#d9edff">
                                                    </div>
                                                </li>
                                            </#list>
                                        </#if>
                                    </ul>
                                </div>
                            </#if>
                        </#list>
                    </#if>
                <#else>
                    <#if q.user.is_official==1>
                        <#if q.is_html==1>
                            <#if (q.cover)?? && q.cover!=''>
                                <p class="recom_img">
                                    <a class="text_img" href="/answer/${q.key}" data-type="image">
                                        <img src="${(q.cover)!''}" onerror="nofind()" alt="">
                                    </a>
                                </p>
                            </#if>
                        <#else>
                            <p class="recom_img">
                                <#if (q.attachs)??>
                                    <#list q.attachs as attach>
                                        <#if attach.type==0>
                                            <#if (attach_index==0)>
                                                <#if (attach.heith>=1500) && (attach.width==750 || attach.width==700)>
                                                    <a class="authority"
                                                       href="/attach/${q.key}?type=1&index=${attach_index}"
                                                       data-type="image">
                                                        <img src="${(attach.smallUrl)!''}" onerror="nofind()" alt="">
                                                        <span class="image_sign">
                                                <#if (q.attachs?size>1)>
                                                    <i class="many_img">多图</i>
                                                </#if>
                                                            <i class="long_img">长图</i>
                                                 </span>
                                                    </a>
                                                    <#break>
                                                </#if>
                                            </#if>
                                            <a href="/attach/${q.key}?type=1&index=${attach_index}"
                                               style='background-image: url("${(attach.url)!''}")'
                                               data-type="image">
                                                <img src="${(attach.smallUrl)!''}" onerror="nofind()" alt="">
                                            </a>
                                        </#if>
                                    </#list>
                                </#if>
                            </p>
                        </#if>
                    <#else>
                        <p class="recom_img">
                            <#if (q.attachs)??>
                                <#list q.attachs as attach>
                                    <#if attach.type==0>
                                        <a href="/attach/${q.key}?type=1&index=${attach_index}"
                                           style='background-image: url("${(attach.url)!''}")' data-type="image">
                                            <img src="${(attach.smallUrl)!''}" onerror="nofind()" alt="">
                                        </a>
                                    </#if>
                                </#list>
                            </#if>
                        </p>
                    </#if>
                </#if>

                <#if (q.distribute)?? && (q.distribute[0].content[0])?? >
                    <p class="recom_news">
                        <a href="javascript:void(0)"
                           news-id="${(q.distribute[0].content[0].id)!''}" <#if q.distribute[0].content[0].type=='video'>
                           video="2" </#if> class="clearfix">
                            <img src="${(q.distribute[0].content[0].image)!''}" alt="">
                            <span>${(q.distribute[0].content[0].text)!''}</span>
                        </a>
                    </p>
                </#if>

                <p class="recom_type">
                    <#if (q.cars)??>
                        <#list q.cars as car>
                            <a href="./issues?series_id=${(car.id)!''}&series_name=${(car.name)!''}">${(car.name)!''}</a>
                        </#list>
                    </#if>
                </p>
                <p class="recom_other clearfix">
                    <span class="time_area">${(q.city.name)!''}</span>
                    <span class="reply_num">
    					<span class="comment_zan <#if (q.has_agree)?? && q.has_agree==1>comment_zan_checked</#if>"
                              tagVal="${q.key}">${(q.agree_count)!''}</span>
    				    <span class="comment_reply" tagVal="${q.key}" target_type="1">${(q.answer_count)!''}</span>
                </p>
            </dd>
        </dl>
    </#list>
    <#if userFavorite.page==1>
    </div>
    </#if>
</#if>