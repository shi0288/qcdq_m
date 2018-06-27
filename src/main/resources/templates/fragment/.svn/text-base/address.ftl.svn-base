<!-- 右侧市层-->
<div class="right_module_province">
    <div class="province_scroll_module">
        <dl class="current_province">
            <dt>当前定位城市</dt>
        <#if (clientCity)??>
            <dd class="current" tagVal="${(clientCityId)!''}">${(clientCity)!''}</dd>
        <#else>
            <dd style="display: block;" class="no_get">无法获取</dd>
        </#if>
        </dl>
    <#--<dl class="zxs_province">-->
    <#--<dt>直辖市</dt>-->
    <#--<dd><span>北京</span><span>天津</span><span>上海</span><span>重庆</span></dd>-->
    <#--</dl>-->
        <div class="other_province" id="otherProvince">
        <#if (provinceRes)??>
            <#list provinceRes?keys as key>
                <dl>
                    <dt>${(key)!''}</dt>
                    <#list provinceRes[key] as province>
                        <dd tagVal="${(province.id)!''}"><span>${(province.name)!''}</span><i></i></dd>
                    </#list>
                </dl>
            </#list>
        </#if>
        </div>
    </div>
</div>
<div class="right_module_city">
    <ul>
    </ul>
</div>