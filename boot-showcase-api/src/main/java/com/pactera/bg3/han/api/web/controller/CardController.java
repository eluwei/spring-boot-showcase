package com.pactera.bg3.han.api.web.controller;

import com.github.pagehelper.PageHelper;
import com.pactera.bg3.han.api.web.dto.CardDTO;
import com.pactera.bg3.han.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-08
 * Time: 9:12
 */
@RestController
@RequestMapping("/cards")
public class CardController {

    @Autowired
    private CardService cardService;

    @RequestMapping
    public List<CardDTO> listAll(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "1") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return CardDTO.transForm(cardService.list());
    }

}
