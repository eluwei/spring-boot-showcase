package com.pactera.bg3.han.model;

import lombok.Data;

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
public class Card {
    @Id
    private String id;
    private String cardId;
    private float faceValue;
    private float frozenValue;
    private float balanceValue;

}