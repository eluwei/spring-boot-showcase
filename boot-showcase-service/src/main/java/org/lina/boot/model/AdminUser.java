package org.lina.boot.model;

import com.google.common.base.Strings;
import lombok.Data;

import javax.persistence.*;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-12
 * Time: 17:54
 */
@Table(name="admin_user")
@Data
public class AdminUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column
    private String userName;
    private String password;
    public AdminUser(){

    }
    public AdminUser(String name){
        userName=name;
    }
    public boolean isEmptyUser(){
        if(id == null || id < -1){
            return true;
        }
        if(Strings.isNullOrEmpty(userName)){
            return true;
        }
        if(Strings.isNullOrEmpty(password)){
            return true;
        }
        return false;
    }
}
