package org.lina.boot.dao;
import org.lina.boot.model.Product;
import org.lina.boot.mybatis.base.MyMapper;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-10-08
 * Time: 15:32
 */
public interface ProductMapper extends MyMapper<Product> {
    List<Product> listProducts(String q);
}
