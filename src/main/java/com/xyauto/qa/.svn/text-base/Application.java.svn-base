package com.xyauto.qa;

import com.xyauto.qa.core.processor.ResourceTemplateLoader;
import freemarker.template.Configuration;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.context.annotation.Bean;


/**
 * Created by shiqm on 2017/3/7.
 */

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
@ServletComponentScan
//@EnableHystrix
//public class Application {
public class Application extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        //setRegisterErrorPageFilter(false);
        return builder.sources(Application.class);
    }

    public static void main(String[] args) throws Exception {
        SpringApplication.run(Application.class, args);
    }


    @Bean
    public CommandLineRunner customFreemarkerTemplateLoader(Configuration configuration) {
        return new CommandLineRunner() {
            @Override
            public void run(String... strings) throws Exception {
                ResourceTemplateLoader resourceTemplateLoader = new ResourceTemplateLoader(configuration.getTemplateLoader());
                configuration.setTemplateLoader(resourceTemplateLoader);
            }
        };
    }


//    /**
//     * 配置错误页面
//     * @return
//     */
//    @Bean
//    public EmbeddedServletContainerCustomizer containerCustomizer() {
//        return (container -> {
////            ErrorPage error401Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/error/401");
//            ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/error/404");
////            ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/error/500");
////            ErrorPage error503Page = new ErrorPage(HttpStatus.SERVICE_UNAVAILABLE, "/error/503");
////            container.addErrorPages(error401Page, error404Page, error500Page,error503Page);
//            container.addErrorPages(error404Page);
//        });
//    }

//    /**
//     * 文件上传配置
//     * @return
//     */
//    @Bean
//    public MultipartConfigElement multipartConfigElement() {
//        MultipartConfigFactory factory = new MultipartConfigFactory();
//        //文件最大
//        factory.setMaxFileSize("10240KB"); //KB,MB
//        /// 设置总上传数据总大小
//        factory.setMaxRequestSize("102400KB");
//        return factory.createMultipartConfig();
//    }


}
