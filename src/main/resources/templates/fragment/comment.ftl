<script src="/js/ajaxfileupload.js"></script>
<script src="${jsPath}/wenda_answer.js"></script>
<!-- 问答评论弹层 -->
<div class="review_area">
    <p class="re_btn clearfix">
        <span class="cancle">取消</span>
        <a class="publish" href="javascript:void(0);">发布</a><a class="reply_b" href="javascript:void(0);">回复</a>
    </p>
    <div class="textarea_box">
            <textarea name="textarea" rows="8" cols="56" maxlength="2000" placeholder="请输入内容..." id="replyContent">
            </textarea>
    </div>
    <p class="user_msg">
           <span class="publish_img">
					<input type="file" id="choose_img" name="file" accept="image/gif,image/jpeg,image/x-png"/>
                    <label for="choose_img" style="display: inline;">
                        <img src="/img/publish_add.jpg" alt="">
                    </label>
			</span>
        <span class="publish_area" id="publishArea">
        <#if (clientCity)??>
            <a href="javascript:void(0);" style="display:none;" class="where" id="where">你在哪里？</a>
            <a href="javascript:void(0);" style="display: inline-block" class="now_place"><em id="thisWhere">${(clientCity)!''}</em><i></i>
                <img src="/img/wd_close.png" id="hideCurArea"/>
            </a>
        <#else>
            <a href="javascript:void(0);" class="where" id="where">你在哪里？</a>
            <a href="javascript:void(0);" class="now_place"><em id="thisWhere">${(clientCity)!''}</em><i></i>
                <img src="/img/wd_close.png" id="hideCurArea"/>
            </a>
        </#if>
			</span>
    </p>
</div>


<div class="tanceng_tip">
    <div class="some_fixed_tips review_tips set_tip"></div>
    <div class="some_fixed_tips review_tips points_tip"></div>
</div>
<!--loading-->
<div class="up_load"><span></span>上传中...</div>