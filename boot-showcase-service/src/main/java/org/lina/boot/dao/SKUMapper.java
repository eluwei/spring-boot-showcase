package org.lina.boot.dao;


import org.lina.boot.model.SKU;
import org.lina.boot.mybatis.base.MyMapper;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-10-08
 * Time: 15:33
 */
public interface SKUMapper extends MyMapper<SKU> {
    List<SKU> listSkusByProductId(long prductId);
}
