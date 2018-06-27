<#macro node question>
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
    <#elseif question.is_html==1>
    <b>图文</b>
    <#elseif question.type==0>
    <b>提问</b>
    </#if>
</#macro>