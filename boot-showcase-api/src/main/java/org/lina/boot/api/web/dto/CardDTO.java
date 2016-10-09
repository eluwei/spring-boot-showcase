package org.lina.boot.api.web.dto;

import org.lina.boot.model.Card;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-08
 * Time: 9:30
 */
@Data
public class CardDTO {
    private String cardId;
    private float faceValue;
    private float useageRate;
    private float frozenRate;

    public CardDTO() {

    }
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



}
