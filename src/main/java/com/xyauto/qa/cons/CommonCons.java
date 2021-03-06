package com.xyauto.qa.cons;

/**
 * Created by shiqm on 2017/3/9.
 */
public class CommonCons {

    /**
     * 分页相关
     */
    public static final class Page_Flag {
        /**
         * 起始页
         */
        public static final int PAGE_NUMBER = 1;

        /**
         * 每页记录数
         */
        public static final int PAGE_LIMIT = 20;

        /**
         * 专家记录数
         */
        public static final int PAGE_LIMIT_EXPERT = 50;
    }


    /**
     * 用户相关
     */
    public static final class User_Type_Flag {
        /**
         * 普通用户
         */
        public static final int USER_TYPE_PERSON = 0;
        /**
         * 标兵
         */
        public static final int USER_TYPE_EXAMPLE = 1;
        /**
         * 专家
         */
        public static final int USER_TYPE_EXPERT = 2;
        /**
         * 车顾问
         */
        public static final int USER_TYPE_ADVISER = 3;

    }


    /**
     * 块数据相关
     */
    public static final class Block_Flag {
        /**
         * 手机Banner
         */
        public static final String MOBILE_BANNER = "index.banner";


        public static final String POPULAR_TOPIC = "popular.topic";


        public static final String LABEL_QUESTION = "label.question";


        public static final String USER_RECOMMENDEXPERT = "user.recommendExpert";


        public static final String TOPIC_RECOMMEND = "topic.recommend";
        public static final String ADVER_HOME = "adver.home";
        public static final String TOPIC_ALL = "topic.all";

    }


    public static final class Session_Flag {

        /**
         * SESSION中UID的key
         */
        public static final String SESSION_UID = "uid";

        /**
         * SESSION中UID的key
         */
        public static final String SESSION_AVATAR = "avatar";

        /**
         * SESSION中UID的key
         */
        public static final String SESSION_NICKNAME = "nickname";

        /**
         * SESSION中城市的名称
         */
        public static final String CLIENT_CITY = "clientCity";

        /**
         * SESSION中城市的ID
         */
        public static final String CLIENT_CITY_ID = "clientCityId";

    }

    /**
     * Freemarker
     */
    public static final class Freemarker_Flag {

        /**
         * suffix
         */
        public static final String FILE_SUFFIX = ".ftl";

        /**
         * prefix
         */
        public static final String FILE_PREFIX = "fragment/";

    }

    /**
     * Freemarker
     */
    public static final class Config_Flag {

        /**
         * 上传图片大小限制
         */
        public static final long PICTURE_LIMIT_SIZE = 8 * 1024 * 1024; //MB

        /**
         * 上传图片压缩宽度
         */
        public static final int PICTURE_WIDTH = 1000; //px

        /**
         * 上传图片压缩长度
         */
        public static final int PICTURE_HEIGHT = 1000; //px

        /**
         * 上传图片类型
         */
        public static final String[] PICTURE_TYPE = {"jpg", "png", "jpeg", "bmp", "gif"}; //px

        public static final String URL_LOGIN = "http://i.m.qichedaquan.com/user/login?businessplatform=1&callback=http://ask.m.qichedaquan.com";

        public static final String URL_LOGIN_PUBLIC = "http://i.m.qichedaquan.com/user/login?businessplatform=1&callback=http://ask.m.qichedaquan.com/publish";

        public static final String URL_LOGIN_VOTE = "http://i.m.qichedaquan.com/user/login?businessplatform=1&callback=http://ask.m.qichedaquan.com/vote";

        public static final String URL_LOGIN_QUOTATION = "http://i.m.qichedaquan.com/user/login?businessplatform=1&callback=http://ask.m.qichedaquan.com/quotation";

        public static final String URL_LOGIN_RANK = "http://i.m.qichedaquan.com/user/login?businessplatform=1&callback=http://ask.m.qichedaquan.com/rank";

        public static final String URL_LOGIN_COUNT = "http://i.m.qichedaquan.com/user/login?businessplatform=1&callback=http://ask.m.qichedaquan.com/count";


    }


    /**
     * 各类状态
     */
    public static final class Status_Flag {

        /**
         * 未登录ID
         */
        public static final String OUT_SESSION = "0";

    }


}
