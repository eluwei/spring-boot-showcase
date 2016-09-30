package org.lina.boot.model;

import lombok.Data;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-07
 * Time: 23:13
 */
@Data
@Table(name = "cards")
//tk.mybatis全局默认使用驼峰转下划线方式，如不使用如下注解，cardId会与card_id字段对应
@NameStyle(Style.normal)
public class Card {
    @Id
    private String id;
    private String cardId;
    private float faceValue = -1;
    private float frozenValue = -1;
    private float balanceValue = -1;
    private String comments;
}