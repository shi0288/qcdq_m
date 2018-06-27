<div class="car_type_module">
    <div class="type_brand">
        <span class="type_brand_logo"></span>
        <span class="type_brand_name"><#if (seriesRes.mastername)??>${(seriesRes.mastername)!''}<#else>${(seriesRes.name)!''}</#if></span>
    </div>
<#if (seriesRes)??>
    <#list seriesRes.brandList as brand>
        <div class="type_msg_list">
            <h5 class="sub_brand_name">${(brand.name)!''}</h5>
            <#list brand.carSerialList as series>
                <dl little_brand_id="${(brand.id)!''}"  tagVal="${(series.id)!''}">
                    <a href="javascript:void(0);">
                        <dt><img src="${(series.logo)!''}"></dt>
                        <dd>
                            <p class="type_name" tagVal="${(series.id)!''}">${(series.showname)!''}</p>
                            <p class="type_price"><#if (series.dealerminprice)?? && series.dealerminprice!='' && series.dealerminprice!=0>${series.dealerminprice?string('0.00')}万起<#else>暂无报价</#if></p>
                            <p class="type_zd_price">
                                指导价： <#if (series.minprice)?? && series.minprice!='' && series.minprice!=0>${series.minprice?string('0.00')}万起<#else>暂无</#if></p>
                        </dd>
                    </a>
                </dl>
            </#list>

        </div>
    </#list>
</#if>
</div>