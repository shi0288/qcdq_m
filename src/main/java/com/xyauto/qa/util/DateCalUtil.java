package com.xyauto.qa.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by shiqm on 2017/3/15.
 */
public class DateCalUtil {


    public static String timeAgo(Long millis) {
        String timestamp = String.valueOf(System.currentTimeMillis() / 1000);
        Long diff = Long.valueOf(timestamp) - millis;
        DecimalFormat df = new DecimalFormat("#");
        if (diff > 0 && diff < 60) {
            return "刚刚发布";
        } else if (diff >= 60 && diff < 3600) {
            return df.format(Math.floor(diff / 60)) + "分钟之前";
        } else if (diff >= 3600 && diff < 86400) {
            return df.format(Math.floor(diff / 3600)) + "小时之前";
        } else if (diff >= 86400) {
            Date date = new Date(millis * 1000L);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
            String curYear = simpleDateFormat.format(new Date());
            String createYear = simpleDateFormat.format(new Date(millis * 1000L));
            if (curYear.equals(createYear)) {
                return new SimpleDateFormat("M-d").format(date);
            } else {
                return new SimpleDateFormat("yyyy-M-d").format(date);
            }
        } else {
            return "刚刚发布";
        }
    }

    /**
     * 转为前台时间样式
     *
     * @param jsonObject
     * @return
     */
    public static void transTimestamp(JSONObject jsonObject, boolean _contentTrans) {
        if (jsonObject != null) {
            JSONArray jsonArray = jsonObject.getJSONArray("list");
            for (int i = 0; i < jsonArray.size(); i++) {
                JSONObject obj = jsonArray.getJSONObject(i);
                if (obj.containsKey("item_type") && obj.getIntValue("item_type") != 1) {
                    continue;
                }
                obj.put("created_at", DateCalUtil.timeAgo(obj.getLongValue("created_at")));
                if (_contentTrans) {
                    obj.put("contentSpare", obj.getString("content"));
                    obj.put("content", transContent(obj.getString("content")));
                    String content = obj.getString("content");
                    content = content.replaceAll("\r\n", "&nbsp;");
                    content = content.replaceAll("\n", "&nbsp;");
                    obj.put("content", content);
                }
                if (obj.containsKey("comment_list")) {
                    JSONArray commentArr = obj.getJSONArray("comment_list");
                    for (int m = 0; m < commentArr.size(); m++) {
                        JSONObject comment = commentArr.getJSONObject(m);
                        comment.put("created_at", DateCalUtil.timeAgo(comment.getLongValue("created_at")));
                    }
                }
            }
        }
    }


    /**
     * 转为前台时间样式
     *
     * @return
     */
    public static Object transTimestamp(Object object, boolean _contentTrans) {
        if (object != null) {
            JSONObject jsonObject = JSON.parseObject(object.toString());
            JSONArray jsonArray = jsonObject.getJSONArray("list");
            for (int i = 0; i < jsonArray.size(); i++) {
                JSONObject obj = jsonArray.getJSONObject(i);
                if (obj.containsKey("item_type") && obj.getIntValue("item_type") != 1) {
                    continue;
                }
                obj.put("created_at", DateCalUtil.timeAgo(obj.getLongValue("created_at")));
                if (_contentTrans) {
                    obj.put("contentSpare", obj.getString("content"));
                    obj.put("content", transContent(obj.getString("content")));
                    String content = obj.getString("content");
                    content = content.replaceAll("\r\n", "&nbsp;");
                    content = content.replaceAll("\n", "&nbsp;");
                    obj.put("content", content);
                }
                if (obj.containsKey("comment_list")) {
                    JSONArray commentArr = obj.getJSONArray("comment_list");
                    for (int m = 0; m < commentArr.size(); m++) {
                        JSONObject comment = commentArr.getJSONObject(m);
                        comment.put("created_at", DateCalUtil.timeAgo(comment.getLongValue("created_at")));
                    }
                }
            }
            return jsonObject;
        }
        return object;

    }

    public static String transContent(String content) {
        String clone = new String(content);
        clone = clone.replaceAll("<a", "<a class='blue'");
        content = content.replaceAll("\r|\n", "");
        Map<String, Integer> map = new HashMap<String, Integer>();
        Pattern pattern = Pattern.compile("(?<=#)(.*?)(?=#)");
        Matcher matcher = pattern.matcher(content);
        int m = 0;
        while (matcher.find()) {
            m++;
            if (m % 2 == 0) {
                continue;
            }
            String temp = matcher.group();
            if (temp.length() >= 2 && temp.length() <= 10) {
                if (map.get(temp) == null) {
                    String reg = "[\\u4e00-\\u9fa5A-Za-z0-9]+";
                    boolean isAllChinese = temp.matches(reg);//false
                    if (isAllChinese) {
                        String replaceStr = "#" + temp + "#";
                        clone = clone.replaceAll(replaceStr, "<a class='blue' href='/issues?subject=" + temp + "' >" + replaceStr + "</a>");
                        map.put(temp, 1);
                    }
                }
            }
        }
        return clone;
    }

    /**
     * 转为前台时间样式
     *
     * @param jsonObject
     * @return
     */
    public static void transTimestampObj(JSONObject jsonObject, boolean _contentTrans) {
        if (jsonObject != null) {
            jsonObject.put("created_at", DateCalUtil.timeAgo(jsonObject.getLongValue("created_at")));
            if (_contentTrans) {
                jsonObject.put("contentSpare", jsonObject.getString("content").replaceAll("<br>", ""));
                jsonObject.put("content", transContent(jsonObject.getString("content")));
                if (jsonObject.containsKey("ycontent") && !"".equals(jsonObject.getString("ycontent"))) {
                    jsonObject.put("ycontent", transContent(jsonObject.getString("ycontent")));
                }
                String content = jsonObject.getString("content");
                content = content.replaceAll("\r\n", "<br/>");
                content = content.replaceAll("\n", "<br/>");
                jsonObject.put("content", content);
            }
        }
    }

    /**
     * 转为前台时间样式
     *
     * @param object
     * @return
     */
    public static Object transTimestampObj(Object object, boolean _contentTrans) {
        if (object != null) {
            JSONObject jsonObject = JSON.parseObject(object.toString());
            jsonObject.put("created_at", DateCalUtil.timeAgo(jsonObject.getLongValue("created_at")));
            if (_contentTrans) {
                jsonObject.put("contentSpare", jsonObject.getString("content").replaceAll("<br>", ""));
                jsonObject.put("content", transContent(jsonObject.getString("content")));
                String content = jsonObject.getString("content");
                content = content.replaceAll("\r\n", "<br/>");
                content = content.replaceAll("\n", "<br/>");
                jsonObject.put("content", content);
            }
            return jsonObject;
        }
        return object;
    }


    public static String timeExpire(Long startMillis, Long endMillis) {
        String timestamp = String.valueOf(System.currentTimeMillis() / 1000);
        //当前时间大于结束时间，已经截止
        Long endDiff = Long.valueOf(timestamp) - endMillis;
        if (endDiff >= 0) {
            return "0";
        }
        //开始日期小于当前日期，正在报名
        Long startDiff = startMillis - Long.valueOf(timestamp);
        if (startDiff <= 0) {
            return "1";
        }
        //开始日期大于当前日期，准备报名时期
        DecimalFormat df = new DecimalFormat("#");
        if (startDiff > 0 && startDiff <= 43200) {
            return "即将开始";
        } else if (startDiff > 43200 && startDiff <= 86400) {
            return "倒计时1天";
        } else {
            double temp = Math.floor(startDiff / 86400);
            if (startDiff % 86400 > 0) {
                temp += 1;
            }
            return "倒计时" + df.format(temp) + "天";
        }
    }

    public static String nullOrBlankLine(String content) {
        if (content == null) {
            return content;
        }
        return content.trim().replaceAll("(?m)^\\s*$(\\n|\\r\\n)", "");
    }

}
