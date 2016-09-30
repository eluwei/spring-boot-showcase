package com.pactera.bg3.han.dao;

import com.pactera.bg3.han.ServiceMain;
import com.pactera.bg3.han.model.Card;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-14
 * Time: 11:17
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = ServiceMain.class)
@DirtiesContext
@Transactional
public class CardMapperTest {
    @Autowired
    private CardMapper dao;
    @Test
    public void findById() {
        Card card = dao.selectByPrimaryKey("ID1");
        assertThat(card.getCardId()).isEqualTo("cardID_111");
        assertThat(card.getComments()).isEqualTo("cardID_1 comments");
    }

    @Test
    @Rollback
    public void create() {
       Card newCard=new Card();
        newCard.setId("TestRollback");
        newCard.setComments("Test Rollback transaction.");
        dao.insertSelective(newCard);
        Card selectCard = dao.selectByPrimaryKey(newCard.getId());
        assertThat(selectCard.getComments()).isEqualTo(newCard.getComments());
    }
}
