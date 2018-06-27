package com.xyauto.qa.cons;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Created by shiqm on 2017/3/18.
 */

@Component
@ConfigurationProperties(prefix = "qcdqcdn.static")
public class QcdqcdnStatic {

    private String url;
    private String resourceVersion;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getResourceVersion() {
        return "?v="+resourceVersion;
    }


    public void setResourceVersion(String resourceVersion) {
        this.resourceVersion = resourceVersion;
    }
}
