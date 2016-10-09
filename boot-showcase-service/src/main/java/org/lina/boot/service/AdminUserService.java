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
    public boolean insertOrUpdateAdminUser(AdminUser user);
}
