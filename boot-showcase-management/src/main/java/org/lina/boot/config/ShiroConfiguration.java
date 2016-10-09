package org.lina.boot.config;


import com.jagregory.shiro.freemarker.ShiroTags;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.authc.AnonymousFilter;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.apache.shiro.web.filter.authc.UserFilter;
import org.apache.shiro.web.filter.authz.RolesAuthorizationFilter;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.lina.boot.service.AdminUserService;
import org.lina.boot.shiro.ShiroDbRealm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.freemarker.FreeMarkerAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.servlet.Filter;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-12
 * Time: 16:48
 */
@Configuration
@AutoConfigureAfter(FreeMarkerAutoConfiguration.class)
public class ShiroConfiguration {
    private static final Logger logger = LoggerFactory.getLogger(ShiroConfiguration.class);

    @Bean
    public EhCacheManager getEhCacheManager() {
        EhCacheManager em = new EhCacheManager();
        em.setCacheManagerConfigFile("classpath:ehcache-shiro.xml");
        return em;
    }

    @Bean(name = "myShiroRealm")
    public ShiroDbRealm myShiroRealm(EhCacheManager cacheManager,AdminUserService userService) {
        ShiroDbRealm realm = new ShiroDbRealm();
        realm.setCacheManager(cacheManager);
        realm.setAdminUserService(userService);
        return realm;
    }


    @Bean(name = "lifecycleBeanPostProcessor")
    public LifecycleBeanPostProcessor getLifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    @Bean
    public DefaultAdvisorAutoProxyCreator getDefaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator daap = new DefaultAdvisorAutoProxyCreator();
        daap.setProxyTargetClass(true);
        return daap;
    }

    @Bean(name = "securityManager")
    public DefaultWebSecurityManager getDefaultWebSecurityManager(ShiroDbRealm realm) {
        DefaultWebSecurityManager dwsm = new DefaultWebSecurityManager();
        dwsm.setRealm(realm);
//      <!-- 用户授权/认证信息Cache, 采用EhCache 缓存 -->
        dwsm.setCacheManager(getEhCacheManager());
        return dwsm;
    }

    @Bean
    public AuthorizationAttributeSourceAdvisor getAuthorizationAttributeSourceAdvisor(DefaultWebSecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor aasa = new AuthorizationAttributeSourceAdvisor();
        aasa.setSecurityManager(securityManager);
        return aasa;
    }



    @Bean(name = "shiroFilter")
    public ShiroFilterFactoryBean shiroFilter(DefaultWebSecurityManager securityManager,FreeMarkerConfigurer freeMarkerConfigurer) {
        ShiroFilterFactoryBean shiroFilter = new ShiroFilterFactoryBean();
        shiroFilter.setLoginUrl("/login");
        shiroFilter.setSuccessUrl("/index");
        shiroFilter.setUnauthorizedUrl("/403");
        Map<String, String> filterChainDefinitionMapping = new HashMap<String, String>();
        //静态资源不需要授权
        filterChainDefinitionMapping.put("/css/**", "anon");
        filterChainDefinitionMapping.put("/flat/**", "anon");
        filterChainDefinitionMapping.put("/images/**", "anon");
        filterChainDefinitionMapping.put("/js/**", "anon");
        //验证码
        filterChainDefinitionMapping.put("/kaptchaImage", "anon");
        //登录
        filterChainDefinitionMapping.put("/doLogin", "anon");

        filterChainDefinitionMapping.put("/logout","logout");
        //FIXME 暂时全部放开，等调整好了关闭
        //filterChainDefinitionMapping.put("/**", "anon");
        filterChainDefinitionMapping.put("/**", "authc");
        shiroFilter.setFilterChainDefinitionMap(filterChainDefinitionMapping);
        shiroFilter.setSecurityManager(securityManager);
        Map<String, Filter> filters = new HashMap<String, Filter>();
        filters.put("anon", new AnonymousFilter());
        filters.put("authc", new FormAuthenticationFilter());
        filters.put("logout", new LogoutFilter());
        filters.put("roles", new RolesAuthorizationFilter());
        filters.put("user", new UserFilter());
        shiroFilter.setFilters(filters);

        //expose shiro tags to freemarker
        freeMarkerConfigurer.getConfiguration().setSharedVariable("shiro",new ShiroTags());
        return shiroFilter;
    }

}
