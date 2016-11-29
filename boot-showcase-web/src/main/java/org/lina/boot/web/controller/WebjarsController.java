package org.lina.boot.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.webjars.RequireJS;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-11-29
 * Time: 11:29
 */
@Controller
public class WebjarsController {
    /**
     * using requireJS with webjars,show case.
     *
     * @See http://www.webjars.org/documentation#springboot
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/webjarsjs", produces = "application/javascript")
    public String webjarjs() {
        return RequireJS.getSetupJavaScript("/webjars/");
    }
}
