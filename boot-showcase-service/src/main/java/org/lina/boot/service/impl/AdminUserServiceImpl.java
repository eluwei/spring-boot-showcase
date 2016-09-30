package org.lina.boot.service.impl;

import com.google.common.base.Preconditions;
import org.lina.boot.dao.AdminUserMapper;
import org.lina.boot.model.AdminUser;
import org.lina.boot.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-12
 * Time: 18:03
 */
@Service
public class AdminUserServiceImpl implements AdminUserService{
    @Autowired
    AdminUserMapper adminMapper;
    public AdminUser loadByUserName(String userName){
        Preconditions.checkNotNull(userName);
        return adminMapper.selectOne(new AdminUser(userName));
    }
}
