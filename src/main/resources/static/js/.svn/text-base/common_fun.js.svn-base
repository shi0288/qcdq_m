function nofind() {
    var img = event.srcElement;
    img.src = "/img/noimg.jpg";
    img.onerror = null;
}

function nofindUser() {
    var img = event.srcElement;
    img.src = "/img/user_default_title.png";
    img.onerror = null;
}


var client;

jQuery.extend({
    pressAgree: function (aChecked, answer_id, cb) {
        $.ajax({
            type: "POST",
            url: "/addAgree?timestamp=" + new Date().getTime(),
            dataType: "json",
            async: true,
            cache: false,
            data: {answer_id: answer_id, checked: aChecked},
            success: function (result) {
                cb(result);
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert('网络错误,请重试！');
            }
        })
    },
    pressAgreeComment: function (aChecked, comment_id, cb) {
        $.ajax({
            type: "POST",
            url: "/comment/agree?timestamp=" + new Date().getTime(),
            dataType: "json",
            async: true,
            cache: false,
            data: {comment_id: comment_id, checked: aChecked},
            success: function (result) {
                cb(result);
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert('网络错误,请重试！');
            }
        })
    },
    pressAgreeQuestion: function (aChecked, question_id, cb) {
        $.ajax({
            type: "POST",
            url: "/addAgreeQuestion?timestamp=" + new Date().getTime(),
            dataType: "json",
            async: true,
            cache: false,
            data: {question_id: question_id, checked: aChecked},
            success: function (result) {
                cb(result);
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert('网络错误,请重试！');
            }
        })
    },
    upUserCity: function (city_id, city_name) {
        //不再以选择定位
        //$.ajax({
        //    type: "POST",
        //    url: "./setUserCity?timestamp=" + new Date().getTime(),
        //    dataType: "json",
        //    async: true,
        //    cache: false,
        //    data: {city_id: city_id, city_name: city_name},
        //    success: function (result) {
        //    },
        //    error: function (data, status, e)//服务器响应失败处理函数
        //    {
        //        alert('网络错误,请重试！');
        //    }
        //})
    },
    delAnswer: function (answer_id, cb) {
        $.ajax({
            type: "POST",
            url: "/delAnswer?timestamp=" + new Date().getTime(),
            dataType: "json",
            async: true,
            cache: false,
            data: {answer_id: answer_id},
            success: function (result) {
                cb(result);
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert('网络错误,请重试！');
            }
        })
    },
    delComment: function (comment_id, cb) {
        $.ajax({
            type: "POST",
            url: "/comment/del?timestamp=" + new Date().getTime(),
            dataType: "json",
            async: true,
            cache: false,
            data: {comment_id: comment_id},
            success: function (result) {
                cb(result);
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert('网络错误,请重试！');
            }
        })
    },
    delQuestion: function (question_id, cb) {
        $.ajax({
            type: "POST",
            url: "/delQuestion?timestamp=" + new Date().getTime(),
            dataType: "json",
            async: true,
            cache: false,
            data: {question_id: question_id},
            success: function (result) {
                cb(result);
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert('网络错误,请重试！');
            }
        })
    },
    reportAnswer: function (answer_id, reason, cb) {
        $.ajax({
            type: "POST",
            url: "/reportAnswer?timestamp=" + new Date().getTime(),
            dataType: "json",
            async: true,
            cache: false,
            data: {answer_id: answer_id, reason: reason},
            success: function (result) {
                cb(result);
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert('网络错误,请重试！');
            }
        })
    },
    reportComment: function (comment_id, reason, cb) {
        $.ajax({
            type: "POST",
            url: "/comment/report?timestamp=" + new Date().getTime(),
            dataType: "json",
            async: true,
            cache: false,
            data: {comment_id: comment_id, reason: reason},
            success: function (result) {
                cb(result);
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert('网络错误,请重试！');
            }
        })
    },
    reportQuestion: function (question_id, reason, cb) {
        $.ajax({
            type: "POST",
            url: "/reportQuestion?timestamp=" + new Date().getTime(),
            dataType: "json",
            async: true,
            cache: false,
            data: {question_id: question_id, reason: reason},
            success: function (result) {
                cb(result);
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert('网络错误,请重试！');
            }
        })
    },
    picUpload: function (idStr, cb) {
        $(".up_load").show();
        $.ajaxFileUpload
        (
            {
                url: '/uploadPic',
                secureuri: false,
                fileElementId: idStr,
                dataType: 'json',
                success: function (result) {
                    $(".up_load").hide();
                    if (result.code == 10000) {
                        cb(result);
                    } else if (result.code == 2999) {
                        alert("图片太大了！");
                    } else if (result.code == 2998) {
                        alert("文件类型不允许！");
                    } else if (result.code == 3000) {
                        alert("文件不能为空！");
                    } else {
                        alert("上传失败，请重试！");
                    }

                },
                error: function (data, status, e)//服务器响应失败处理函数
                {
                    $(".up_load").hide();
                    alert('网络错误,请重试！');
                }
            }
        )
    },
    localAjax: function (url, cond, cb) {
        $.ajax({
            type: "POST",
            url: url + "?timestamp=" + new Date().getTime(),
            dataType: "json",
            async: true,
            cache: false,
            data: cond,
            success: function (result) {
                cb(result);
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert('网络错误,请重试！');
            }
        })
    },
    localFormAjax: function (fromStr, cb) {
        var self = $("#" + fromStr);
        var url = self.attr("action");
        $.ajax({
            type: "POST",
            dataType: "json",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            url: url,
            data: self.serialize(),
            success: function (result) {
                cb(result);
            },
            error: function (e) {
                alert('网络错误,请重试！');
            }
        });
    },
    mqttMessage: function (cb) {
        var uid = $('.login_photo').find('img').attr('tagVal');
        if (uid == undefined || uid == null || uid == '') {
            return;
        }
        if (client == undefined) {
            var host = '119.254.150.153';
            var port = '8083';
            client = mqtt.connect("ws://" + host + ":" + port + "/mqtt", {clientId: defaultId(uid)});
            client.on('connect', function () {
                client.subscribe("xingyuan_user_" + uid);
            });
            client.on("message", function (topic, payload) {
                cb(payload.toString());
            });
        }
    },
    sendMessage: function (phone, cb) {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/getMessage?timestamp=" + new Date().getTime(),
            data: {phone: phone},
            success: function (result) {
                cb(result);
            },
            error: function (e) {
                alert('网络错误,请重试！');
            }
        });
    },
    commitOffering: function (answer_id, cb) {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/commitOffering?timestamp=" + new Date().getTime(),
            data: {comment_id: answer_id},
            success: function (result) {
                cb(result);
            },
            error: function (e) {
                alert('网络错误,请重试！');
            }
        });
    },
    verifyinquirycode: function (phone, code, cb) {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/verifyinquirycode?timestamp=" + new Date().getTime(),
            data: {phone: phone, code: code},
            success: function (result) {
                cb(result);
            },
            error: function (e) {
                alert('网络错误,请重试！');
            }
        });
    }

});


function defaultId(uid) {
    return 'qa_m_' + uid + '_' + new Date().getTime();
}


Array.prototype.addToArr = function (val, node) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] == val) {
            return;
        }
    }
    this.push(val);
    node.val(this.join(','));
}


Array.prototype.removeByValue = function (val, node) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] == val) {
            this.splice(i, 1);
            node.val(this.join(','));
            break;
        }
    }
}


Array.prototype.contains = function (obj) {
    var i = this.length;
    while (i--) {
        if (this[i] === obj) {
            return true;
        }
    }
    return false;
}

$(function () {

    $('.load_more_module .load_user_more').click(function () {
        var self = $(this);
        self.hide();
        self.next().css('display', 'block');
        var page = self.attr("pageVal");
        if (page == undefined) {
            page = 2;
        } else {
            page++;
        }
        var cond = {};
        cond.page = page;
        var uid = $('#uid').val();
        cond.uid = uid;
        var queryTeyp = self.attr("tagVal");
        var url;
        if (queryTeyp == 'question') {
            url = '/getUserQuestion';
        } else if (queryTeyp == 'answer') {
            url = '/getUserAnswer';
        } else if (queryTeyp == 'favorite') {
            url = '/getUserFavorite';
        } else if (queryTeyp == 'special') {
            url = '/getUserSpecial';
        } else if (queryTeyp == 'adviser') {
            if ($("#brand_id").val() != undefined && $("#brand_id").val() != '') {
                cond.brand_id = $("#brand_id").val();
            }
            if ($("#city_id").val() != undefined && $("#city_id").val() != '') {
                cond.city_id = $("#city_id").val();
            }
            if ($("#city_name").val() != undefined && $("#city_name").val() != '') {
                cond.city_name = $("#city_name").val();
            }
            if ($("#brand_name").val() != undefined && $("#brand_name").val() != '') {
                cond.brand_name = $("#brand_name").val();
            }
            url = '/getAdvisers';
        } else {
            return;
        }
        $.localAjax(url, cond, function (result) {
            self.next().hide();
            self.attr("pageVal", cond.page);
            self.parent().prev().append($(result.htmlNode));
            if (queryTeyp == 'adviser') {
            } else {
                self.parents('.ans_expert_content').parent().height(self.parents('.ans_expert_content').height());
            }
            var pageCount = Math.ceil(result.count / result.limit);
            if (cond.page < pageCount) {
                self.show();
            } else {
                self.parent().find('.no_more').css('display', 'block');
            }
        });
    });


    $('body').on('click', '.reply_zan', function () {
        if (!loginCheck) {
            window.location.href = 'http://i.m.qichedaquan.com/user/login?businessplatform=1&callback=' + window.location.href;
            return;
        }
        var self = $(this);
        var answer_id = self.attr('tagVal');
        var status = self.find('i').attr('tagVal');
        if (status == undefined) {
            status = true;
        } else if (status == 'check') {
            status = false;
        } else if (status == 'uncheck') {
            status = true;
        }
        if (status) {
            var num = parseInt(self.find('span').text());
            num++;
            self.find('i').css({
                'background-image': 'url(/img/comment_zan2.png)'
            });
            self.find('span').text(num).css('color', '#ff3131');
            self.find('i').attr('tagVal', 'check');
        } else {
            var num = parseInt(self.find('span').text());
            num--;
            self.find('i').css({
                'background-image': 'url(/img/comment_zan.png)'
            });
            self.find('span').text(num).css('color', '#b7b7b7');
            self.find('i').attr('tagVal', 'uncheck');
        }
        if (self.find('i').attr('tagAgree') != undefined) {
            return;
        }
        $.pressAgree(status, answer_id, function (res) {
            if (res == '10000') {
            } else if (res == '10001') {
                self.find('i').attr('tagAgree', 'resetClick');
            }
        })
    })


    $('body').on('click', '.comment_zan', function () {
        if (!loginCheck) {
            window.location.href = 'http://i.m.qichedaquan.com/user/login?businessplatform=1&callback=' + window.location.href;
            return;
        }
        var self = $(this);
        var status = true;
        if ($(this).hasClass('comment_zan_checked')) {
            status = false;
        }
        if (status) {
            var num = parseInt(self.text());
            num++;
            self.addClass('comment_zan_checked');
            self.text(num);
            if (self.attr('target_type') == 2) {
                var srcImg = $('.login_photo').find('img').attr('src');
                var uid = $('.login_photo').find('img').attr('tagVal');
                if ($('.zan_user').children('img').length >= 7) {
                    $('.zan_user').children().eq($('.zan_user').children('img').length - 2).hide();
                }
                if ($('.zan_user').children('img').length == 6) {
                    $('.zan_user').children("img:last-child").hide();
                }
                if ($('.zan_user').children('img').length == 0) {
                    $('.zan_user').append($('<img tagVal="' + uid + '" onerror="nofindUser()" src="' + srcImg + '">'));
                } else {
                    $('.zan_user').children("img:first-child").before($('<img tagVal="' + uid + '" onerror="nofindUser()" src="' + srcImg + '">'));
                }
            }
        } else {
            var num = parseInt(self.text());
            num--;
            self.removeClass('comment_zan_checked');
            self.text(num);
            if (self.attr('target_type') == 2) {
                var uid = $('.login_photo').find('img').attr('tagVal');
                $('.zan_user').children().each(function (index) {
                    if ($(this).attr('tagVal') == uid) {
                        $(this).remove();
                        return false;
                    }
                })
                if ($('.zan_user').children('img').length >= 7) {
                    $('.zan_user').children().eq($('.zan_user').children('img').length - 2).show();
                }
                if ($('.zan_user').children('img').length == 6) {
                    $('.zan_user').children("img:last-child").show();
                }
            }

        }
        if (self.attr('target_type') == undefined || self.attr('target_type') == 2) {
            var question_id = self.attr('tagVal');
            $.pressAgreeQuestion(status, question_id, function (res) {
                if (res == '10000') {
                } else if (res == '10001') {
                    $(this).removeClass('comment_zan_checked');
                }
            })
        } else {
            var id = self.attr('tagVal');
            if (self.attr('target_type') == 3) {
                $.pressAgreeComment(status, id, function (res) {
                    if (res == '10000') {
                    } else if (res == '10001') {
                        $(this).removeClass('comment_zan_checked');
                    }
                })
            } else {
                $.pressAgree(status, id, function (res) {
                    if (res == '10000') {
                    } else if (res == '10001') {
                        $(this).removeClass('comment_zan_checked');
                    }
                })
            }
        }

    })

    var curQuestionCount;
    $("body").on("click", ".comment_reply", function () {
        if (!loginCheck) {
            window.location.href = 'http://i.m.qichedaquan.com/user/login?businessplatform=1&callback=' + window.location.href;
            return;
        }
        $("#replyContent").val('');
        if ($(".del").length == 1) {
            var imgStr = $(".del").attr('tagVal');
            attachsArr.removeByValue(imgStr, $('#attachs_val'));
            $(".del").parent().remove();
            $(".publish_img label").css("display", "inline");
            $(".re_btn").find("a").css("color", "#ccc");
        }

        if ($(this).attr('target_type') != undefined && $(this).attr('target_type') == 2) {
            $(".mask").fadeIn();
            //$("#replyContent").focus();
            isIos(true);
            $(".review_area").animate({'bottom': '0'}, 500, function () {
                $("#replyContent").attr("placeholder", "请输入内容...");
                $('.reply_b').hide().siblings(".publish").show();
            });
            return;
        }
        $(".mask").fadeIn();
        var repayUserId = $(this).attr("tagUid");
        $("#reply_user_id").val(repayUserId);
        var repayAnswerId = $(this).attr("tagAnswerId");
        $("#reply_answer_id").val(repayAnswerId);
        var repayCommentId = $(this).attr("tagCommentId");
        $("#reply_comment_id").val(repayCommentId);
        var name = $(this).attr("tagName");
        if ($(this).attr('target_type') == undefined || $(this).attr('target_type')=='2') {
            $("#replyContent").attr("placeholder", "回复" + name);
        } else {
            var question_id = $(this).attr("tagVal");
            $("#question_id").val(question_id);
            $("#question_id").attr("curPage", "1");
        }
        if ($(this).attr('tagquestionid') != undefined) {
            var question_id = $(this).attr("tagquestionid");
            $("#question_id").val(question_id);

        }

        //$("#replyContent").focus();
        isIos(true);
        if ($(this).attr('target_type') == undefined) {
            $(".review_area").animate({'bottom': '0'}, 500, function () {
                $(".publish").hide().siblings('.reply_b').show();
            });
        } else {
            $(".review_area").animate({'bottom': '0'}, 500, function () {
                $(".reply_b").hide().siblings('.publish').show();
            });
        }
        curQuestionCount = $(this);
    });

    $("body").on("click", "#review", function () {
        if (!loginCheck) {
            window.location.href = 'http://i.m.qichedaquan.com/user/login?businessplatform=1&callback=' + window.location.href;
            return;
        }
        $("#replyContent").val('');
        $(".mask").fadeIn();
        //$("#replyContent").focus();
        isIos(true);
        $(".review_area").animate({'bottom': '0'}, 500, function () {
            $("#replyContent").attr("placeholder", "请输入内容...");
            $('.reply_b').hide().siblings(".publish").show();
        });
    });

    $("body").on("click", "#review_answer", function () {
        if (!loginCheck) {
            window.location.href = 'http://i.m.qichedaquan.com/user/login?businessplatform=1&callback=' + window.location.href;
            return;
        }
        $("#replyContent").val('');
        $(".mask").fadeIn();
        //$("#replyContent").focus();
        isIos(true);
        $(".review_area").animate({'bottom': '0'}, 500, function () {
            $("#replyContent").attr("placeholder", "请输入内容...");
            $('.publish').hide().siblings(".reply_b").show();
        });
    });

    //城市
    $('.other_province').find('dd:not([class="zxs"])').off('click');
    $("#otherProvince").on("click", "dl dd", function () {
        if ($(this).find("span").hasClass("zxs")) {
            $(".mask_area").hide();
            $(".right_module_province").animate({right: "-100%"}, 500);
            $(".right_module_city").animate({right: "-100%"}, 500);
        } else {
            var province_id = $(this).attr("tagVal");
            var province_name = $(this).children('span').html();
            $.ajax({
                type: "POST",
                url: "/getCityList?timestamp=" + new Date().getTime(),
                dataType: "json",
                async: true,
                cache: false,
                data: {province_id: province_id},
                success: function (result) {
                    $('.right_module_city ul').empty();
                    var liNode = document.createElement('li');
                    $(liNode).addClass('checked_province');
                    var aNode = document.createElement('a');
                    $(aNode).attr('href', 'javascript:void(0);');
                    liNode.appendChild(aNode);
                    var iNode = document.createElement('i');
                    aNode.appendChild(iNode);
                    var emProvinceNameNode = document.createElement('em');
                    $(emProvinceNameNode).html(province_name);
                    aNode.appendChild(emProvinceNameNode);
                    $('.right_module_city ul').append(liNode);
                    $.each(result, function (indexE, cityObj) {
                        var liNode = document.createElement('li');
                        var aNode = document.createElement('a');
                        if ('1' == $("#wd_adviser").val()) {
                            $(aNode).attr('href', '/advisers?city_id=' + cityObj.id + "&brand_id=" + $("#brand_adviser").val() + "&city_name=" + cityObj.name + "&brand_name=" + $("#brand_name").val());
                        } else {
                            $(aNode).attr('href', 'javascript:void(0);');
                            $(aNode).attr('tagVal', cityObj.id);
                        }
                        $(aNode).html(cityObj.name);
                        liNode.appendChild(aNode);
                        $('.right_module_city ul').append(liNode);
                    })
                    $(".right_module_city").animate({right: "0"}, 500);
                }
            })
        }
    })

    $('body').on('click', '.checked_province a', function () {
        $(".right_module_city").animate({right: "-100%"}, 500);
    })

    // 点击你在哪里出现抽屉
    $("#thisWhere").on("click", function () {
        $(".mask_area").fadeIn();
        $(".right_module_province").animate({right: "0"}, 500);
    })

    $('body').on('click', '.right_module_city a[tagVal]', function () {
        var cityName = $(this).html();
        $("#thisWhere").text(cityName)
            .parent(".now_place").css("display", "block")
            .siblings('.where').hide();
        var cityId = $(this).attr('tagVal');
        $("#city_id").val(cityId);
        $(".mask_area").hide();
        $(".right_module_province").animate({right: "-100%"}, 500);
        $(".right_module_city").animate({right: "-100%"}, 500);
        $.upUserCity(cityId, cityName);
    })


    // 点击x显示你在哪里
    $("#hideCurArea").on("click", function (event) {
        event.stopPropagation();
        $("#city_id").val('');
        $(this).parents(".now_place").hide()
            .siblings('.where').css("display", "block");
    })


    $('.current_province .current').off('click');
    $('.current').off('click');
    $('.current').on('click', function () {
        var cityName = $(this).html();
        var cityId = $(this).attr('tagVal');
        if ('1' == $("#wd_adviser").val()) {
            window.location.href = '/advisers?city_id=' + cityId + "&brand_id=" + $("#brand_adviser").val() + "&city_name=" + cityName + "&brand_name=" + $("#brand_name").val();
        } else {
            $("#cityValue").html(cityName);
            $("#city_id").val(cityId);
            $('.mask_area').hide();
            $(".right_module_province").css({
                right: "-100%",
                transition: "right .6s"
            });
            $(".right_module_city").css({
                right: "-100%",
                transition: "right .6s"
            });
            $.upUserCity(cityId, cityName);
        }
    })


    //回复问题
    var isRepaying = false;
    $(".re_btn a").off('click');
    $(".re_btn a").on("click", function () {
        var self = $(this);
        var content = $('#replyContent').val();
        if (content.length > 2000) {
            alert('最多输入2000字，请简化一下喔~');
            return;
        }
        if (content == undefined || content == null || content.length == 0) {
            var display = $(".publish_img label").css("display");
            if (display != 'none') {
                alert('内容不能为空');
                return;
            }
        }
        if (!isRepaying) {
            isRepaying = true;
        } else {
            return;
        }
        if ($("#reply_answer_id").val() == undefined || $("#reply_answer_id").val() == '') {
            createAnswer(function (result) {
                if (result.code == 10000) {
                    var tipText = self.text() + "成功";
                    $(".set_tip").text(tipText).fadeIn();
                    setTimeout(function () {
                        $(".set_tip").fadeOut();
                        if ($("#question_id").attr("jump_page") == '2') {
                            $(".mask").fadeOut();
                            isBodyScroll(false);
                            $(".review_area").animate({'bottom': '-1000%'}, 500, function () {
                                isIos(false);
                            });
                            return;
                        }
                        if ($("#question_id").attr("jump_page") == '1') {
                            if ($("#sort").val() != undefined && $("#sort").val() != '') {
                                window.location.href = '/answer/' + $('#question_id').val() + "?sort=" + $("#sort").val();
                            } else {
                                window.location.href = '/answer/' + $('#question_id').val();
                            }
                            return;
                        }
                        if ($("#question_id").attr("curPage") == undefined) {
                            var question_id = $('#question_id').val();
                            var cond = {};
                            cond.question_id = question_id;
                            if ($("#sort").val() != undefined && $("#sort").val() != '') {
                                cond.sort = parseInt($("#sort").val());
                            }
                            $.localAjax("/getAnswersList", cond, function (res) {
                                var sortNode = $("#to_sort").parent();
                                $('.answer_module').empty();
                                $('.answer_module').append(sortNode);
                                $('.answer_module').append(res.htmlNode);
                                $(".text_content").each(function () {
                                    if (parseFloat($(this).css("height")) > parseFloat($(this).parent().css("height"))) {
                                        $(this).parent().next(".show_more").show()
                                    }
                                })
                                $(".mask").fadeOut();
                                curPage = 1;
                                isBodyScroll(false)
                                $(".review_area").animate({'bottom': '-1000%'}, 500, function () {
                                    isIos(false);
                                });
                            })
                        } else {
                            var num = parseInt(curQuestionCount.text());
                            num++;
                            curQuestionCount.text(num);
                            $(".mask").fadeOut();
                            isBodyScroll(false);
                            $(".review_area").animate({'bottom': '-1000%'}, 500, function () {
                                isIos(false);
                            });
                        }
                    }, 1200);
                    isRepaying = false;
                } else {
                    $(".set_tip").text(result.msg).fadeIn();
                    setTimeout(function () {
                        $(".set_tip").fadeOut();
                        isRepaying = false;
                    }, 1200);

                }
            });
        } else {
            createComment(function (result) {
                if (result.code == 10000) {
                    var tipText = self.text() + "成功";
                    $(".set_tip").text(tipText).fadeIn();
                    setTimeout(function () {
                        $(".set_tip").fadeOut();
                        history.go(0);
                    }, 1200);
                    isRepaying = false;
                } else {
                    $(".set_tip").text(result.msg).fadeIn();
                    setTimeout(function () {
                        $(".set_tip").fadeOut();
                        isRepaying = false;
                    }, 1200);

                }
            });
        }
    })


    function createAnswer(cb) {
        $.mqttMessage(function (message) {
            try {
                $(".points_tip").text(JSON.parse(message).tip.replace("发布成功", "").replace(/[\r\n]/g, "")).fadeIn();
                $(".points_tip").fadeOut(1200);
            } catch (e) {
            }
        });
        var cond = {};
        var question_id = $('#question_id').val();
        cond.question_id = question_id;
        var content = $('#replyContent').val();
        cond.content = content;
        var reply_user_id = $("#reply_user_id").val();
        if (reply_user_id) {
            cond.reply_uid = reply_user_id;
        }
        var reply_answer_id = $("#reply_answer_id").val();
        if (reply_answer_id) {
            cond.reply_answer_id = reply_answer_id;
        }
        var attachs_val = $("#attachs_val").val();
        if (attachs_val) {
            cond.attachs = attachs_val;
        }
        var city_id = $("#city_id").val();
        if (city_id) {
            cond.city_id = city_id;
        }
        $.ajax({
            type: "POST",
            url: "/createAnswer?timestamp=" + new Date().getTime(),
            dataType: "json",
            async: true,
            cache: false,
            data: cond,
            success: function (result) {
                cb(result);
            }
        })
    }


    function createComment(cb) {
        $.mqttMessage(function (message) {
            try {
                $(".points_tip").text(JSON.parse(message).tip.replace("发布成功", "").replace(/[\r\n]/g, "")).fadeIn();
                $(".points_tip").fadeOut(1200);
            } catch (e) {
            }
        });
        var cond = {};
        var reply_answer_id = $('#reply_answer_id').val();
        cond.answer_id = reply_answer_id;
        var content = $('#replyContent').val();
        cond.content = content;
        var reply_comment_id = $("#reply_comment_id").val();
        if (reply_comment_id) {
            cond.reply_comment_id = reply_comment_id;
            var reply_user_id = $("#reply_user_id").val();
            if (reply_user_id) {
                cond.reply_uid = reply_user_id;
            }
        }
        var attachs_val = $("#attachs_val").val();
        if (attachs_val) {
            cond.attachs = attachs_val;
        }
        var city_id = $("#city_id").val();
        if (city_id) {
            cond.city_id = city_id;
        }
        $.ajax({
            type: "POST",
            url: "/comment/add?timestamp=" + new Date().getTime(),
            dataType: "json",
            async: true,
            cache: false,
            data: cond,
            success: function (result) {
                cb(result);
            }
        })
    }


    var attachsArr = new Array();
    $(".review_area").on("change", "#choose_img", function () {
        var file = this.files[0];

        if (file.size > 8388608) {
            alert("图片过大，请上传小于8MB的图片！");
            return;
        }
        if (!/image\/\w+/.test(file.type)) {
            alert("请确保文件为图像类型");
            return false;
        }

        $.picUpload("choose_img", function (result) {
            if (result && result.code == 10000) {
                attachsArr.addToArr(result.data, $("#attachs_val"));
                var reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = function (e) {
                    $(".publish_img").prepend("<span><img tagVal='" + result.data + "' src='/img/p_del.png' class='del'><img src='" + this.result + "'></span>");
                    $(".publish_img label").css("display", "none");
                    $(".re_btn").find("a").css("color", "#2799fe");
                }
            } else {
                alert("上传失败，请重试！");
            }
        });
    });

    $(".publish_img").on("click", ".del", function (e) {
        var target = e.target;
        var imgStr = $(target).attr('tagVal');
        attachsArr.removeByValue(imgStr, $('#attachs_val'));
        $(target).parent().remove();
        $(".publish_img label").css("display", "inline");
        $(".re_btn").find("a").css("color", "#ccc");
    });


    var isVoting = false;
    $("body").on("click", "[group-id]", function () {
        var self = $(this);
        if (!loginCheck) {
            window.location.href = 'http://i.m.qichedaquan.com/user/login?businessplatform=1&callback=' + window.location.href;
            return;
        }
        $.mqttMessage(function (message) {
            try {
                $(".points_tip").text(JSON.parse(message).tip.replace("发布成功", "").replace(/[\r\n]/g, "")).fadeIn();
                $(".points_tip").fadeOut(1200);
            } catch (e) {
            }
        });
        if (!isVoting) {
            isVoting = true;
        } else {
            return;
        }
        var cond = {};
        cond.question_id = self.attr('group-id');
        cond.vote_id = $(this).attr('tagVal');
        cond.content = "";
        $.ajax({
            type: "POST",
            url: "/createAnswer?timestamp=" + new Date().getTime(),
            dataType: "json",
            async: true,
            cache: false,
            data: cond,
            success: function (result) {
                if (result.code == 10000) {
                    $.localAjax('/getVotePercent', {question_id: cond.question_id}, function (res) {
                        if (res.code = 10000) {
                            $("[group-vote='" + cond.question_id + "']").each(function (index) {
                                var rate = res.data.content[index].rate;
                                $(this).attr("data-percent", (rate + "").replace('%', ''));
                                $(this).attr("data-text", rate);
                            })
                            self.siblings(".myStat").attr("data-fgcolor", "#2896fe");
                            $(".vote_model ul [group-id='" + cond.question_id + "']").hide();
                            $("[group-vote='" + cond.question_id + "']").show();
                            $("[group-vote='" + cond.question_id + "']").circliful();
                            $("[group-total='" + cond.question_id + "']").text(res.data.total);
                            $("[group-have='" + cond.question_id + "']").show();
                            //出现转圈圈loading
                            $(".load_mask").show();
                            //投票成功后执行下面方法
                            $(".load_mask img").hide();
                            $(".load_mask span").html("投票成功");
                            isVoting = false;
                            setTimeout(function () {
                                $(".load_mask").fadeOut();
                            }, 500);
                        } else {
                            alert("获取投票信息失败，请重试！");
                            isVoting = false;
                        }
                    })
                } else {
                    alert("投票失败，请重试！");
                    isVoting = false;
                }
            }
        })
    })


    $("body").on("click", "[news-id]", function () {
        var dataId = $(this).attr('news-id');
        var cond = {};
        cond.dataId = dataId;
        if (typeof($(this).attr("video")) != "undefined") {
            cond.type = 2;
        }
        $.localAjax('/getNewsUrl', cond, function (res) {
            if (res.code == 10000) {
                window.location.href = res.data.url;
            } else {
                alert(res.msg);
            }
        })
    })


});

