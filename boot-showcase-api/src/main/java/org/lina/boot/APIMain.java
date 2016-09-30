package org.lina.boot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-07
 * Time: 23:07
 */

@SpringBootApplication
public class APIMain {
    private static final Logger logger = LoggerFactory.getLogger(APIMain.class);

    public static void main(String[] args) {
        SpringApplication.run(APIMain.class, args);
    }
}