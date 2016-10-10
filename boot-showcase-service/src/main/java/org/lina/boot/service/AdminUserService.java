package org.lina.boot.service;


import org.lina.boot.model.AdminUser;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-12
 * Time: 18:03
 */

public interface AdminUserService {
    public AdminUser loadByUserName(String userName);
    public List<AdminUser> listUsers(String q);
    public boolean insertAdminUser(AdminUser user);
    public boolean updateAdminUserPassword(AdminUser user);
    public boolean changePassword(String userName,String oldPassword,String newPassword,String confirmPassword);
}
