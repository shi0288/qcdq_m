package com.xyauto.qa.util;

/**
 * Created by chendd on 2017/2/25.
 */
public class UserCookeiDO {
    private long user_id;
    private String nick_name;//昵称，不允许重复
    private String user_avatar;//用户头像地址

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public String getNick_name() {
        return nick_name;
    }

    public void setNick_name(String nick_name) {
        this.nick_name = nick_name;
    }


    public String getUser_avatar() {
        return user_avatar;
    }

    public void setUser_avatar(String user_avatar) {
        this.user_avatar = user_avatar;
    }

}
