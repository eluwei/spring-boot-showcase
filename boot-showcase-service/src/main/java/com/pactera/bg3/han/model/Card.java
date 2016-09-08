package com.pactera.bg3.han.model;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-07
 * Time: 23:13
 */
public class Card {
    private String id;

    private String cardId;


    private float faceValue;



    private float frozenValue;


    private float balanceValue;


    private String comments;

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public float getFaceValue() {
        return faceValue;
    }

    public void setFaceValue(float faceValue) {
        this.faceValue = faceValue;
    }

    public float getFrozenValue() {
        return frozenValue;
    }

    public void setFrozenValue(float frozenValue) {
        this.frozenValue = frozenValue;
    }

    public float getBalanceValue() {
        return balanceValue;
    }

    public void setBalanceValue(float balanceValue) {
        this.balanceValue = balanceValue;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}