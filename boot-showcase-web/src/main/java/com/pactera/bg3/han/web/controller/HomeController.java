package com.pactera.bg3.han.web.controller;

import com.github.pagehelper.PageHelper;
import com.pactera.bg3.han.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-08
 * Time: 13:35
 */
@Controller
public class HomeController {
    @Autowired
    CardService cardService;

    @RequestMapping("/home")
    public String homePage(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "1") int pageSize,ModelMap modelMap) {
        PageHelper.startPage(pageNum, pageSize);
        modelMap.put("cards", cardService.list());
        return "home";
    }

    @RequestMapping("/cards")
    public String cards(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "1") int pageSize,ModelMap modelMap) {
        PageHelper.startPage(pageNum, pageSize);
        modelMap.put("cards",cardService.list());
        return "cards";
    }
}
