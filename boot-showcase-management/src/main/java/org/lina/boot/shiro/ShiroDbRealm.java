package org.lina.boot.shiro;


import com.google.common.base.Strings;
import lombok.Getter;
import lombok.Setter;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.lina.boot.model.AdminUser;
import org.lina.boot.service.AdminUserService;

import java.util.HashSet;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-12
 * Time: 13:09
 */

public class ShiroDbRealm extends AuthorizingRealm {

    @Getter
    @Setter
    private AdminUserService adminUserService;
    /**
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        //FixMe should load form db
        ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
        AdminUser adminUser = adminUserService.loadByUserName(shiroUser.getLoginName());
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(adminUser.roles());
        return info;
    }


    /**
     * 认证回调函数,登录时调用.
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        if(!Strings.isNullOrEmpty(token.getUsername())){
            AdminUser adminUser = adminUserService.loadByUserName(token.getUsername());
                if(adminUser!=null && !adminUser.isEmptyUser()){
                    return new SimpleAuthenticationInfo(new ShiroUser(adminUser.getId(), adminUser.getUserName(), adminUser.getUserName()),
                            adminUser.getPassword(),ByteSource.Util.bytes(adminUser.getCredentialsSalt()),adminUser.getUserName());
                }

        }
        return null;
    }
}
