package org.lina.boot.shiro;

import org.apache.shiro.SecurityUtils;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-10-09
 * Time: 17:48
 */
public class CurrentUser {
    public static ShiroUser me(){
        return ((ShiroUser) SecurityUtils.getSubject().getPrincipal());
    }
    public static String name(){
        return me().getName();
    }
}
