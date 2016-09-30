package org.lina.boot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-14
 * Time: 11:21
 */
@SpringBootApplication
public class ServiceMain {
    private static final Logger logger = LoggerFactory.getLogger(ServiceMain.class);

    public static void main(String[] args) {
        SpringApplication.run(ServiceMain.class, args);
    }
}
