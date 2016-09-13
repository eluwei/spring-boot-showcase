package com.pactera.bg3.han.service.impl;

import com.pactera.bg3.han.dao.CardMapper;
import com.pactera.bg3.han.model.Card;
import com.pactera.bg3.han.service.CardService;
import org.apache.ibatis.session.SqlSession;
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
    private CardMapper cardMapper;

    public List<Card> list() {
        return cardMapper.selectAll();
    }

    public Card getById(String id) {
        return cardMapper.selectByPrimaryKey(id);
    }


    public void update(Card card) {
        cardMapper.updateByPrimaryKey(card);
    }


    public void delete(String id) {
        cardMapper.deleteByPrimaryKey(id);
    }


    public void create(Card card) {
        cardMapper.insertSelective(card);
    }

}
