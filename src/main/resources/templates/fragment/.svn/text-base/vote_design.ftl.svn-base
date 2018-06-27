<div class="car_disign_module">
    <div id="carType"></div>
    <div class="type_brand"> <span class="type_brand_logo" id="car_name"></span> <span class="type_brand_name" id="car_series_id">不限车款</span> </div>
    <#if (carRes)??>
        <#assign  carYearTemp='' />
       <#list carRes as car>
           <#if carYearTemp==''|| carYearTemp!=car.caryear >
               <#assign  carYearTemp=car.caryear />
               <h4 class="type_dec">${car.caryear}款</h4>
           </#if>
           <div class="type_msg_list">
               <h5 class="sub_brand_name">${car.engineExhaustForFloat} ${car.engineMaxPower+'马力'}</h5>
               <dl tagVal="${(car.id)!''}"  tagYear="${(car.caryear)!''}" >
                   <a href="javascript:void(0);">
                       <dd>
                           <p class="type_name">${car.caryear}款 ${car.name}</p>
                           <p class="type_price"><#if (car.dealerminprice)?? && car.dealerminprice!='' && car.dealerminprice!=0>${car.dealerminprice?string('0.00')}万起<#else>暂无报价</#if> </p>
                           <p class="type_zd_price">指导价： <#if (car.referprice)?? && car.referprice!='' && car.referprice!=0>${car.referprice?string('0.00')}万 <#else>暂无</#if> </p>
                       </dd>
                   </a>
               </dl>
           </div>
       </#list>
    </#if>
</div>