package org.lina.boot.api.web.controller;

import org.lina.boot.api.web.dto.CardDTO;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.boot.test.TestRestTemplate;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-14
 * Time: 12:40
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CardControllerTest extends BaseFunctionalTest{
    private RestTemplate restTemplate;

    private String cardListUrl;

    @Before
    public void setup() {
        restTemplate = new TestRestTemplate();
        cardListUrl = "http://localhost:" + port + ctx + "/cards";
    }

    @Test
    public void listCards(){
        List<CardDTO> list = restTemplate.getForObject(cardListUrl,ArrayList.class);
        assertThat(list.size() > 0 );
    }

    @Test
    public void getCard(){
        CardDTO card = restTemplate.getForObject(cardListUrl+"/ID2",CardDTO.class);
        assertThat(card.getCardId()).isEqualTo("cardID_22");
    }

    }