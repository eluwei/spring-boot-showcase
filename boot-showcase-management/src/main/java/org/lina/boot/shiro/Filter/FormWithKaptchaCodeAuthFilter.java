package org.lina.boot.shiro.Filter;

import com.google.common.base.Strings;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-10-12
 * Time: 15:10
 */
public class FormWithKaptchaCodeAuthFilter  extends FormAuthenticationFilter {
    private void validateKaptcha(ServletRequest request, ServletResponse response) {
        String userInputCode = request.getParameter("kaptchaCode");
        if(Strings.isNullOrEmpty(userInputCode)){
            request.setAttribute("errorMsg","用户未输入验证码!");
            throw new KaptchaInputException("用户未输入验证码!");
        }
        String kaptchaExpected = (String)SecurityUtils.getSubject().getSession().getAttribute(KAPTCHA_SESSION_KEY);
        //invalid kaptcha Code
        SecurityUtils.getSubject().getSession().setAttribute(KAPTCHA_SESSION_KEY, "");
        if(Strings.isNullOrEmpty(kaptchaExpected)|| !userInputCode.equals(kaptchaExpected) ) {
            request.setAttribute("errorMsg","输入的验证码有误!");
            throw new KaptchaInputException("输入的验证码有误!");
        }
    }

    protected boolean executeLogin(ServletRequest request, ServletResponse response) throws Exception {
        AuthenticationToken token = createToken(request, response);
        if (token == null) {
            String msg = "createToken method implementation returned null. A valid non-null AuthenticationToken " +
                    "must be created in order to execute a login attempt.";
            throw new IllegalStateException(msg);
        }
        try {
            validateKaptcha(request,response);
            Subject subject = getSubject(request, response);
            subject.login(token);
            return onLoginSuccess(token, subject, request, response);
        } catch (AuthenticationException e) {
            if(!(e instanceof KaptchaInputException)){
                request.setAttribute("errorMsg","用户名密码错误，请确认输入无误！");
            }
            return onLoginFailure(token, e, request, response);
        }
    }
}
