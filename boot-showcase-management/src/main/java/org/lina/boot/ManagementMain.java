package org.lina.boot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-07
 * Time: 22:55
 */
@SpringBootApplication
public class ManagementMain extends SpringBootServletInitializer {

    private static final Logger logger = LoggerFactory.getLogger(ManagementMain.class);

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ManagementMain.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(ManagementMain.class, args);
        logger.info("启动完成");
    }

}
