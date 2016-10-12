package org.lina.boot.shiro.Filter;

import org.apache.shiro.authc.AuthenticationException;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-10-12
 * Time: 15:19
 */
public class KaptchaInputException extends AuthenticationException {
    public KaptchaInputException() {
        super();
    }

    public KaptchaInputException(String message) {
        super(message);
    }


    public KaptchaInputException(Throwable cause) {
        super(cause);
    }


    public KaptchaInputException(String message, Throwable cause) {
        super(message, cause);
    }
}
