package org.lina.boot.shiro.Filter;

import org.apache.shiro.web.filter.AccessControlFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.util.Map;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-10-19
 * Time: 16:28
 */
//TODO 动态判断用户是否具有指定url权限
public class RoleBasedUrlAUthFilter extends AccessControlFilter {

    /**
     * 缓存已经计算出的url和角色的对应关系
     * //栗子：
     * // 如：/users@GET:ROLE_USER_MGR,ROLE_ADMIN,表示/users rest方法为GET的，需要用户管理或者超级管理角色
     *       /users@DELETE:ROLE_ADMIN,/users rest删除，只有超级管理员能做。
     */
    //FIXME map非线程安全，只能测试时作为全局缓存，后续需调整。
    Map<String,Set<String>> cachedUrlRolesMap;

    @Override
    protected boolean isAccessAllowed(ServletRequest servletRequest, ServletResponse servletResponse, Object o) throws Exception {
        //动态load url需要的角色？
        //判断当前用户是否有角色？
        //Resource
        //ROLE_ADMIN,ROLE_ADMINISTRATOR为超级管理员角色，可以操作所有资源，所以直接返回
        /**
         * 伪代码:
         *  if(current.isSupperAdmin())
         *     return true;
         *  urlKey = buildUrl(request);
         *  if(cachedUrlRolesMap.hasKey(urlKey)){
         *      return checkCurrentUerRole(current,cachedUrlRolesMap.get(urlKey);
         *  }else{
         *      Set<String> anyRoles = loadResourceRoles(urlKey);
         *      cachedUrlRolesMap.set(urlKey,anyRoles);
         *      return checkCurrentUerRole(current,cachedUrlRolesMap.get(urlKey);
         *  }
         */
        return false;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        //无权限访问，返回403页面
        return false;
    }
}
