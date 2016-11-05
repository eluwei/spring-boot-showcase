package org.lina.boot.service.impl;

import com.google.common.base.Strings;
import org.lina.boot.model.Card;
import org.lina.boot.service.BaseService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-07
 * Time: 23:17
 */
@Service
public class CardServiceImpl extends BaseService<Card>{

    public List<Card> search(String q){
        if(Strings.isNullOrEmpty(q)){
            return getAll();
        }else{
            Example query=new Example(Card.class);
            try {
                //如果传入了数字，尝试搜索余额大于这个数字的数
                int largeThanValue =Integer.parseInt(q);
                query.or().andGreaterThan("balanceValue",largeThanValue);
            }catch (Exception e){
                //只是一个不好的栗子。。千万表模仿
                //出异常就不是数字，常规like。
                String lq="%"+q+"%";
                query.or().andLike("id",lq);
                query.or().andLike("cardId",lq);
                query.or().andLike("comments",lq);
            }
            return mapper.selectByExample(query);
        }
    }
}
