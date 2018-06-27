<#if (advisers.list)??>
    <#list advisers.list as item>
    <li>
        <img onclick="window.location.href='/user?uid=${(item.uid)!''}'"
             src="${(item.avatar)!'/img/user_default_title.png'}" onerror="nofindUser()">
        <div>
            <p onclick="window.location.href='/user?uid=${(item.uid)!''}'" class="name">${(item.name)!''}</p>
            <p class="information">从业：${(item.work_seniority)!''}年 | 服务：${(item.service_count)!''}人</p>
            <p class="intro">
                <#if item.dealer_type==1>
                    <span style="color: red">[4s]&nbsp;&nbsp;</span>${(item.dealer_name)!''}
                <#elseif item.dealer_type==2>
                    [特许]&nbsp;&nbsp;${(item.dealer_name)!''}
                <#elseif item.dealer_type==3>
                    [综合]&nbsp;&nbsp;${(item.dealer_name)!''}
                </#if>
            </p>
        </div>
        <#if (uid)?? && uid==item.uid>
            <a href="javascript:alert('不能向自己提问')">向TA提问</a>
        <#else>
            <a href="/publish?special_id=${item.uid}">向TA提问</a>
        </#if>

    </li>
    </#list>
</#if>