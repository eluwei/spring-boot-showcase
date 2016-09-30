package com.pactera.bg3.han.service;


import com.pactera.bg3.han.dao.CardMapper;
import com.pactera.bg3.han.model.Card;
import com.pactera.bg3.han.service.impl.CardServiceImpl;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-14
 * Time: 11:20
 */
public class CardServiceTest {
    CardServiceImpl service;
    CardMapper dao;

    @Before
    public void setUp() throws Exception {
        service = new CardServiceImpl();
        dao = Mockito.mock(CardMapper.class);
        service.setCardMapper(dao);
    }
    @Test
    public void testWithMockito() {
        Card mockCard = new Card();
        mockCard.setComments("just mock get.");
        Mockito.when(dao.selectByPrimaryKey("test_find_by_id")).thenReturn(mockCard);
        assertThat(service.getById("test_find_by_id").getComments()).isEqualTo("just mock get.");
    }
}