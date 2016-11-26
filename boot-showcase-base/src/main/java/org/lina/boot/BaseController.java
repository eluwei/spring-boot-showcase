package org.lina.boot;

import org.lina.boot.dto.ResponseWapper;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-10-10
 * Time: 11:38
 */
public interface BaseController {
    @ExceptionHandler
    @ResponseBody
    default public Object exceptionHandle(Exception e) {
        return e == null?this.ResponseWrapper().addMessage("系统错误!").execFailue():(e.getMessage() == null?this.ResponseWrapper().addException(e).addMessage("系统错误!").execFailue():this.ResponseWrapper().addException(e).addMessage(e.getMessage()).execFailue());
    }
    default ResponseWapper ResponseWrapper() {
        return ResponseWapper.create();
    }
}
