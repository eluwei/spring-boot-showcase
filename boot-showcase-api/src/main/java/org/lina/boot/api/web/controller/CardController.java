package org.lina.boot.api.web.controller;

import com.github.pagehelper.PageHelper;
import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import org.lina.boot.api.web.dto.CardDTO;
import org.lina.boot.service.impl.CardServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    private CardServiceImpl cardService;

    @RequestMapping(method = RequestMethod.GET)
    public List<CardDTO> listAll(@RequestParam(value = "q",defaultValue = "") String q,@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "1") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        if(Strings.isNullOrEmpty(q)){
            return CardDTO.transForm(cardService.getAll());
        }
        return CardDTO.transForm(cardService.search(q));
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public CardDTO cardDetail(@PathVariable(value = "id") String id) {
        Preconditions.checkNotNull(id);
        return new CardDTO(cardService.get(id));
    }

}
