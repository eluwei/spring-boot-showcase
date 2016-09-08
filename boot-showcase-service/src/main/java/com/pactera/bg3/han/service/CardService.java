package com.pactera.bg3.han.service;

import com.pactera.bg3.han.model.Card;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-07
 * Time: 23:16
 */
public interface CardService {

    List<Card> list();

    Card getById(String id);

    void update(Card card);

    void delete(String id);

    void create(Card card);
}
