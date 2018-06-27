package com.xyauto.qa.util;

import com.xyauto.qa.cons.CommonCons;
import com.xyauto.qa.cons.QcdqcdnStatic;
import com.xyauto.qa.cons.ViewKeyCons;
import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by shiqm on 2017/3/17.
 */
@Component
public class TemplateUtils {

    @Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;

    @Autowired
    private QcdqcdnStatic qcdqcdnStatic;


    public JSONResult parse(ViewKeyCons viewKeyCons, Object value) {
        JSONResult jsonResult = new JSONResult();
        if (value == null) {
            jsonResult.setDone(false);
            return jsonResult;
        }
        Map map = new HashMap<>();
        map.put(viewKeyCons.getKey(), value);
        try {
            Template template = freeMarkerConfigurer.getConfiguration()
                    .getTemplate(CommonCons.Freemarker_Flag.FILE_PREFIX +
                            viewKeyCons.getViewName() +
                            CommonCons.Freemarker_Flag.FILE_SUFFIX);
            Writer out = new StringWriter();
            template.process(map, out);
            jsonResult.setDone(true);
            jsonResult.setHtmlNode(out.toString());
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            jsonResult.setDone(false);
        }
        return jsonResult;
    }

    public JSONResult parse(ViewKeyCons viewKeyCons, Object value, String uid) {
        JSONResult jsonResult = new JSONResult();
        if (value == null) {
            jsonResult.setDone(false);
            return jsonResult;
        }
        Map map = new HashMap<>();
        map.put(viewKeyCons.getKey(), value);
        map.put("uid", uid);
        try {
            Template template = freeMarkerConfigurer.getConfiguration()
                    .getTemplate(CommonCons.Freemarker_Flag.FILE_PREFIX +
                            viewKeyCons.getViewName() +
                            CommonCons.Freemarker_Flag.FILE_SUFFIX);
            Writer out = new StringWriter();
            template.process(map, out);
            jsonResult.setDone(true);
            jsonResult.setHtmlNode(out.toString());
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            jsonResult.setDone(false);
        }
        return jsonResult;
    }


    public String getScriptSrcList(String content) {
        Map map = new HashMap();
        Pattern p_script = Pattern.compile("(?<=script)(.*?)(?=></script>|/>)");
        Matcher m_script = p_script.matcher(content);
        while (m_script.find()) {
            String temp = m_script.group();
            Pattern p_src = Pattern.compile("(?<=src=\")(.*?)(?=\")");
            Matcher m_src = p_src.matcher(temp);
            while (m_src.find()) {
                String tempSrc = m_src.group();
                if (tempSrc.indexOf("?v=") > -1) {
                    continue;
                }
                if (!StringUtils.isEmpty(map.get(tempSrc))) {
                    continue;
                }
                content = content.replace(tempSrc, tempSrc + qcdqcdnStatic.getResourceVersion());
                map.put(tempSrc, "1");
            }
        }
        map.clear();
        return content;
    }

    public String getLinkHrefList(String content) {
        Map map = new HashMap();
        Pattern p_script = Pattern.compile("(?<=link)(.*?)(?=></link>|/>|>)");
        Matcher m_script = p_script.matcher(content);
        while (m_script.find()) {
            String temp = m_script.group();
            Pattern p_src = Pattern.compile("(?<=href=\")(.*?)(?=\")");
            Matcher m_src = p_src.matcher(temp);
            while (m_src.find()) {
                String tempSrc = m_src.group();
                if (tempSrc.indexOf("?v=") > -1) {
                    continue;
                }
                if (!StringUtils.isEmpty(map.get(tempSrc))) {
                    continue;
                }
                content = content.replace(tempSrc, tempSrc + qcdqcdnStatic.getResourceVersion());
                map.put(tempSrc, "1");
            }
        }
        map.clear();
        return content;
    }


}
