package com.xyauto.qa.cons;

/**
 * Created by chendd on 2017/2/24.
 */
public class UserConstant {
    //用户session key
    public static final String USER_SESSION_KEY = "USER_SESSION";
    public static final String USER_SESSION_AES_PASSWORD = "qichedaquan.com";
    //cookie域
    public final static String COOKIE_DOMAIN = "qichedaquan.com";

    public final static String BASE_URL="http://i.qichedaquan.com/";

    public final static String BASE_WEB_URL="http://www.qichedaquan.com";

    //用户注册来源 1手机号注册，2微信，3qq，4微博
    public final static int MOBILE_USER_SOURCE = 1;
    public final static int WEIXIN_USER_SOURCE = 2;
    public final static int QQ_USER_SOURCE = 3;
    public final static int WEIBO_USER_SOURCE = 4;

    //用户注册平台 1网站，2app IOS，3APP android，4移动站
    public final static int PC_USER_PLATFORM = 1;
    public final static int IOS_USER_PLATFORM = 2;
    public final static int ANDROID_USER_PLATFORM = 3;
    public final static int MOBILE_USER_PLATFORM = 4;

    //被封禁的IP黑名单 IP_BLACK_LIST 逗号分隔
    public final static String IP_BLACK_LIST = "ip_black_list";

    //微信登陆
    public final static String WEIXIN_APP_SECRET="46aaeae24d9656206eb6be6ceece9474";
    public final static String WEIXIN_APPID="wxbda4db381805a4fe";
    public final static String WEIXIN_CALLBACK="http://i.qichedaquan.com/user/weixin/callback";
    public final static String WEIXIN_GET_CODE="https://open.weixin.qq.com/connect/qrconnect?appid={0}&redirect_uri={1}&response_type=code&scope=snsapi_login&state={2}#wechat_redirect";
    public final static String WEIXIN_GET_ACCESS_TOKEN="https://api.weixin.qq.com/sns/oauth2/access_token?appid={0}&secret={1}&code={2}&grant_type=authorization_code";
    public final static String WEIXIN_REFRESH_TOKEN="https://api.weixin.qq.com/sns/oauth2/refresh_token?appid={0}&grant_type=refresh_token&refresh_token={1}";
    public final static String WEIXIN_GET_USER_INFO="https://api.weixin.qq.com/sns/userinfo?access_token={0}&openid={1}";

    //QQ登陆
    public final static String QQ_APP_ID="101379591";
    public final static String QQ_APP_KEY="4c9d15362d30cc9c1b6581b985e8ec80";
    public final static String QQ_CALLBACK="http://i.qichedaquan.com/user/qq/callback";
    public final static String QQ_GET_CODE="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id={0}&redirect_uri={1}&state={2}";
    public final static String QQ_GET_OPENID="https://graph.qq.com/oauth2.0/me?access_token={0}";
    public final static String QQ_GET_ACCESS_TOKEN="https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&client_id={0}&client_secret={1}&code={2}&redirect_uri={3}";
    public final static String QQ_GET_USER_INFO="https://graph.qq.com/user/get_user_info?access_token={0}&oauth_consumer_key={1}&openid={2}";

    //新浪微博 登陆
    public final static String WEIBO_APP_KEY="4161528645";
    public final static String WEIBO_APP_SECRET="e2a6e7735564964e8bb600683550080c";
    public final static String WEIBO_CALLBACK="http://i.qichedaquan.com/user/weibo/callback";
    public final static String WEIBO_GET_CODE="https://api.weibo.com/oauth2/authorize?client_id={0}&redirect_uri={1}&state={2}";
    public final static String WEIBO_GET_ASSESS_TOKEN_BASE="https://api.weibo.com/oauth2/access_token";
    public final static String WEIBO_GET_ACCESS_TOKEN_PARAMS="client_id={0}&client_secret={1}&code={2}&redirect_uri={3}&grant_type=authorization_code";
    public final static String WEIBO_GET_UID="https://api.weibo.com/2/account/get_uid.json?access_token={0}";
    public final static String WEIBO_GET_USER_INFO="https://api.weibo.com/2/users/show.json?access_token={0}&uid={1}";


}
