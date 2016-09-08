package com.pactera.bg3.han.api.web.dto;

import com.pactera.bg3.han.model.Card;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-08
 * Time: 9:30
 */
public class CardDTO {
    private String cardId;
    private float faceValue;
    private float useageRate;
    private float frozenRate;


    public CardDTO(Card card) {
        this.cardId = card.getCardId();
        this.faceValue = card.getFaceValue();
        useageRate = ((card.getFaceValue() - card.getBalanceValue()) / faceValue);
        frozenRate = (card.getFrozenValue() / faceValue);
    }

    public static List<CardDTO> transForm(List<Card> list) {
        List<CardDTO> result = new ArrayList<CardDTO>();
        for (Card c : list) {
            result.add(new CardDTO(c));
        }
        return result;
    }

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

    public float getUseageRate() {
        return useageRate;
    }

    public void setUseageRate(float useageRate) {
        this.useageRate = useageRate;
    }

    public float getFrozenRate() {
        return frozenRate;
    }

    public void setFrozenRate(float frozenRate) {
        this.frozenRate = frozenRate;
    }


    public CardDTO() {

    }


}
