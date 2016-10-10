package org.lina.boot.web.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.lina.boot.model.AdminUser;
import org.lina.boot.service.AdminUserService;
import org.lina.boot.shiro.CurrentUser;
import org.lina.boot.shiro.PasswordHelper;
import org.lina.boot.shiro.ShiroUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

@Controller
public class LoginController {
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);



    @Autowired
    AdminUserService userService;


    @RequestMapping(value = "/password",method = RequestMethod.POST)
    public Object changePassword(@RequestParam("oldPassword")String oldPassword,
                                 @RequestParam("password")String password,
                                 @RequestParam("confirmPassword")String confirmPassword){
        String userName= CurrentUser.name();
        return userService.changePassword(userName,oldPassword,password,confirmPassword);
    }
	
	/**
	 * 展现登录页
	 * @param req   
	 * @param resp
	 * @return login页面对应的ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/login")
    public ModelAndView loginPage(HttpServletRequest req
            , HttpServletResponse resp) throws Exception {
        ModelAndView mv = new ModelAndView("/login/login");
        return mv;  
    }
	
	
	
	/**
	 * 实际登录动作
	 * @param model  
	 * @param username      请求参数传递的用户名
	 * @param password      请求参数传递的密码
	 * @param kaptchaCode   用户输入的随机码
	 * @return
	 */
	@RequestMapping("/doLogin")
    public String login(HttpServletRequest request, HttpServletResponse response,Model model, @RequestParam("username") String username,  @RequestParam("password") String password,
    		@RequestParam("kaptchaCode") String kaptchaCode) {
		
		//获取当前的用户
        Subject currentUser = SecurityUtils.getSubject();
        
        //收集实体/凭据信息
        //基于传入的用户名和密码封装到一个UsernamePasswordToken对象中
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        
        //判断用户是否已经输入了随机验证码，如果未输入，则重新展示登录页
        if (StringUtils.isEmpty(kaptchaCode)) {
        	 model.addAttribute("errorMsg", "验证码为空");
             return "/login/login";
        }
        
        //因为在KaptchaImageController中 会把生成的随机码存入session,所以这里从session中获取期望的随机验证码
        String kaptchaExpected = (String) currentUser.getSession().getAttribute(KAPTCHA_SESSION_KEY);
           
        //比较用户提交的随机验证码和生成时存入session中的随机验证码
        if(!kaptchaCode.equalsIgnoreCase(kaptchaExpected)){
        	model.addAttribute("errorMsg", "验证码不正确");
            return "/login/login";
        }
        
        //执行登录
        try {
        	//对当前用户使用login方法提交认证
        	//1.它会在框架内部委托SecurityManager.login(token)方法
        	//2.委托Authenticator.authenticate(token)方法
        	//3.Realm调用getAuthenticationInfo(token)方法
        	
            currentUser.login(token);
            
     
        } catch (AuthenticationException e) {
        	//登录失败
            LOGGER.error(e.getMessage(), e);
            model.addAttribute("errorMsg", e.getMessage());
            return "/login/login";
        }
             
        return "redirect:/";
    }


	
}
