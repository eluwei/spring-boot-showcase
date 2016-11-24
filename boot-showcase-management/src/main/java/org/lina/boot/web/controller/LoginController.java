package org.lina.boot.web.controller;

import org.lina.boot.dto.ResponseWapper;
import org.lina.boot.service.AdminUserService;
import org.lina.boot.shiro.CurrentUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class LoginController{
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);



    @Autowired
    AdminUserService userService;


    @RequestMapping(value = "/password",method = RequestMethod.POST)
    @ResponseBody
    public Object changePassword(@RequestParam("oldPassword")String oldPassword,
                                 @RequestParam("password")String password,
                                 @RequestParam("confirmPassword")String confirmPassword){
        String userName= CurrentUser.name();
         userService.changePassword(userName,oldPassword,password,confirmPassword);
        return ResponseWapper.create().execSuccess().addMessage("修改密码成功！！");
    }
	
	/**
	 * 展现登录页
	 * @param req   
	 * @param resp
	 * @return login页面对应的ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/login")
    public String loginPage(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        return "/login/login";
    }

}
