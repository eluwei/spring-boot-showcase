package org.lina.boot.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by foy on 2016-06-14.
 */
@Controller
public class DashboardController {

    @RequestMapping("/")
    public String dashboard(){
        return "homepage/home";
    }
}
