package org.lina.boot.model;

import com.google.common.base.Joiner;
import com.google.common.base.Strings;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Collections;
import java.util.List;
import java.util.Set;

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
    @Getter
    @Setter
    @Transient
    private String confirmPassword;
    @Getter
    @Setter
    private String salt;

    @Getter
    @Setter
    private String roles;

    public static final String ROLE_STR_SPLIPTER=",";

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
    public String getCredentialsSalt(){
        return userName+salt;
    }
    public Set<String> roles(){
        if(Strings.isNullOrEmpty(roles)){
            return Collections.emptySet();
        }
        return ImmutableSet.copyOf(roles.split(ROLE_STR_SPLIPTER));
    }
    public static String toRoles(String [] roles){
        return Joiner.on(ROLE_STR_SPLIPTER).join(roles);
    }

}
