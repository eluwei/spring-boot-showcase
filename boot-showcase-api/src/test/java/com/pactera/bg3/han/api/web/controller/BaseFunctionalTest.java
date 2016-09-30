package com.pactera.bg3.han.api.web.controller;

import com.pactera.bg3.han.APIMain;
import org.junit.Rule;
import org.junit.rules.TestRule;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.boot.test.WebIntegrationTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-14
 * Time: 12:41
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = APIMain.class)
@WebIntegrationTest("server.port=0")
@DirtiesContext
public abstract class BaseFunctionalTest {


    @Value("${local.server.port}")
    protected int port;


    @Rule
    public TestRule testProgress = new TestProgress();

}
