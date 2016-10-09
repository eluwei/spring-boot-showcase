package org.lina.boot.service.impl;

import com.google.common.base.Preconditions;
import org.lina.boot.dao.AdminUserMapper;
import org.lina.boot.model.AdminUser;
import org.lina.boot.service.AdminUserService;
import org.lina.boot.service.BaseService;
import org.lina.boot.shiro.PasswordHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-12
 * Time: 18:03
 */
@Service
public class AdminUserServiceImpl extends BaseService<AdminUser> implements AdminUserService {
    @Autowired
    AdminUserMapper adminMapper;

    @Autowired
    PasswordHelper passwordHelper;

    public AdminUser loadByUserName(String userName){
        Preconditions.checkNotNull(userName);
        return adminMapper.selectOne(new AdminUser(userName));
    }
    public List<AdminUser> listUsers(String q){
        Example query = new Example(AdminUser.class);
        query.createCriteria().andLike("userName","%"+q+"%");
        return adminMapper.selectByExample(query);
    }

    @Override
    public boolean insertOrUpdateAdminUser(AdminUser user) {
        Preconditions.checkNotNull(user);
        Preconditions.checkNotNull(user.getPassword());
        Preconditions.checkNotNull(user.getConfirmPassword());
        Preconditions.checkArgument(user.getConfirmPassword().equals(user.getPassword()),"确认密码不匹配!!");
        if(user.getId() == null || user.getId() == -1){
            //new user
            user.setId(null);
            mapper.insert(user);
        }else{
            AdminUser updateUser=new AdminUser();
            updateUser.setId(user.getId());
            updateUser.setPassword(user.getPassword());
            updateUser.setSalt(user.getSalt());
            mapper.updateByPrimaryKeySelective(updateUser);
        }
        return true;
    }

    @Override
    public boolean changePassword(String userName, String oldPassword, String newPassword, String confirmPassword) {
        Preconditions.checkNotNull(userName);
        Preconditions.checkNotNull(oldPassword);
        Preconditions.checkNotNull(newPassword);
        Preconditions.checkNotNull(confirmPassword);
        Preconditions.checkArgument(confirmPassword.equals(newPassword), "confirmPassword输入不匹配");
        AdminUser user = loadByUserName(userName);
        Preconditions.checkArgument(user.getPassword().equals(passwordHelper.encryptPassword(oldPassword,user.getCredentialsSalt())));
        user.setPassword(newPassword);
        passwordHelper.encryptPassword(user);
        insertOrUpdateAdminUser(user);
        return true;
    }
}
