package org.lina.boot.service.impl;

import org.lina.boot.dao.CardMapper;
import org.lina.boot.model.Card;
import org.lina.boot.service.CardService;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-07
 * Time: 23:17
 */
@Service
public class CardServiceImpl implements CardService {

    @Autowired
    @Getter
    @Setter
    private CardMapper cardMapper;

    public List<Card> list() {
        return cardMapper.selectAll();
    }

    public Card getById(String id) {
        return cardMapper.selectByPrimaryKey(id);
    }

    @Transactional
    public void update(Card card) {
        cardMapper.updateByPrimaryKey(card);
    }

    @Transactional
    public void delete(String id) {
        cardMapper.deleteByPrimaryKey(id);
    }

    @Transactional
    public void create(Card card) {
        cardMapper.insertSelective(card);
    }


}
