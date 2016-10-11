package org.lina.boot.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by foy on 2016-06-14.
 */
@Controller
public class DashboardController implements BaseController{

    @RequestMapping("/")
    public String dashboard(){
        return "homepage/home";
    }
    @RequestMapping("/403")
    @ResponseBody
    public String Unauthorized(){
        return "you have no access right!!";
    }
}
