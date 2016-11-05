package org.lina.boot.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-10-19
 * Time: 15:38
 */
@Table(name="admin_resources")
public class Resource {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String type = "1";//资源类型，1.功能性资源。2.menu。3.button
    private String url;
    private String method;//ALL,GET,POST,PUT,DELETE
    private String parameters;//参数列表
    private String descriptions;//资源定义描述
}

