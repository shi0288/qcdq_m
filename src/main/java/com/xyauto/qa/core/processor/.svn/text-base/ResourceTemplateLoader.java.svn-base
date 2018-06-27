package com.xyauto.qa.core.processor;

import com.xyauto.qa.util.SpringIocUtil;
import com.xyauto.qa.util.TemplateUtils;
import freemarker.cache.TemplateLoader;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;


/**
 * Created by shiqm on 2017-06-30.
 */
public class ResourceTemplateLoader implements TemplateLoader {

    private final TemplateLoader delegate;

    public ResourceTemplateLoader(TemplateLoader delegate) {
        this.delegate = delegate;
    }

    @Override
    public Object findTemplateSource(String s) throws IOException {
        return delegate.findTemplateSource(s);
    }

    @Override
    public long getLastModified(Object o) {
        return delegate.getLastModified(o);
    }

    @Override
    public Reader getReader(Object o, String s) throws IOException {
        Reader reader = delegate.getReader(o, s);
        TemplateUtils templateUtils= (TemplateUtils) SpringIocUtil.getBean("templateUtils");
        String content= IOUtils.toString(reader);
        content = templateUtils.getScriptSrcList(content);
        content = templateUtils.getLinkHrefList(content);
        return new StringReader("<@compress single_line=true>"+content+"</@compress>");
//        return new StringReader(content);
    }


    @Override
    public void closeTemplateSource(Object o) throws IOException {
        delegate.closeTemplateSource(o);
    }
}
