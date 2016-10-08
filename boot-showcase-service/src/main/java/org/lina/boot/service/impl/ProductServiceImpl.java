package org.lina.boot.service.impl;


import org.apache.log4j.Logger;
import org.lina.boot.dao.ProductMapper;
import org.lina.boot.dao.SKUMapper;
import org.lina.boot.model.Product;
import org.lina.boot.model.SKU;
import org.lina.boot.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by foy on 2016-06-01.
 */
@Service("productService")
public class ProductServiceImpl extends BaseService<Product> {

    private static final Logger LOGGER = Logger.getLogger(ProductServiceImpl.class);

    @Autowired
    protected ProductMapper productDao;

    @Autowired
    protected SKUMapper skuDao;


    public List<Product> listProducts(String q) {
        return productDao.listProducts(q);
    }

    public SKU getSku(long skuId){
        return skuDao.selectByPrimaryKey(skuId);
    }

    @Transactional
    public boolean delSku(long skuId){
        skuDao.deleteByPrimaryKey(skuId);
        return true;
    }

    public List<SKU> listSkuByProductId(long productId) {
        return skuDao.listSkusByProductId(productId);
    }

    @Transactional
    public boolean insertOrUpdateProduct(Product product){
        int result = 0;
        if(product.getId() == null || product.getId() == -1){
            product.setId(null);
            result= productDao.insertSelective(product);
        }else{
            result= productDao.updateByPrimaryKeySelective(product);
        }
        return result > 0 ? true:false;
    }

    @Transactional
    public boolean insertOrUpdateSKU(SKU sku){

        int result=0;
        if(sku.getId() ==null || sku.getId() == -1){
            sku.setId(null);
            result= skuDao.insertSelective(sku);
        }else{
            result= skuDao.updateByPrimaryKeySelective(sku);
        }
        return result > 0 ? true:false;
    }

}
