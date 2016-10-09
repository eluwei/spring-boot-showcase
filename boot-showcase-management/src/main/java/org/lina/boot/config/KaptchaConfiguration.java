package org.lina.boot.config;

import com.google.code.kaptcha.util.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import com.google.code.kaptcha.impl.DefaultKaptcha;

import java.util.Properties;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-30
 * Time: 14:20
 */
@Configuration
public class KaptchaConfiguration {
    @Bean
    public DefaultKaptcha getKaptcha(){
        DefaultKaptcha kaptcha = new DefaultKaptcha();
        Properties p = new Properties();
        p.setProperty("kaptcha.border","no");
        p.setProperty("kaptcha.border.color","105,179,90");
        p.setProperty("kaptcha.textproducer.font.color","red");
        p.setProperty("kaptcha.image.width","250");
        p.setProperty("kaptcha.textproducer.font.size","90");
        p.setProperty("kaptcha.image.height","90");
        p.setProperty("kaptcha.session.key","code");
        p.setProperty("kaptcha.textproducer.char.length","4");
        p.setProperty("kaptcha.textproducer.font.names","宋体,楷体,微软雅黑");
        kaptcha.setConfig(new Config(p));
        return kaptcha;
    }
}
