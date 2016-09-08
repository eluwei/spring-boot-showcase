package com.pactera.bg3.han.dao;

import com.pactera.bg3.han.model.Card;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-07
 * Time: 23:15
 */
@Mapper
public interface CardMapper {

    List<Card> list();

    Card getById(String id);

    void update(Card card);

    void create(Card card);

    void delete(String id);

}
