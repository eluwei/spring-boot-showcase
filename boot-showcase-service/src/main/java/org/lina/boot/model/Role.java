package org.lina.boot.model;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-10-19
 * Time: 15:32
 */
@Data
@Table(name="admin_roles")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    //角色名称，唯一约束
    private String roleName;
    //角色描述
    private String descriptions;
    //角色具有的url
    @Transient
    private List<Resource> resourceList;
}
