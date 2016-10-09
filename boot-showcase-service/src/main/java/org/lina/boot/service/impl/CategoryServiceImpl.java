package org.lina.boot.service.impl;

import org.lina.boot.model.Category;
import org.lina.boot.service.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * Created by foy on 2016-06-07.
 */
@Service("categoryService")
public class CategoryServiceImpl extends BaseService<Category> {
    @Override
    @Transactional
    public int save(Category category) {
        if(category.getParentCategoryId() !=null ){
            //FIXME why get can't work??
            //Category pc=get(category.getParentCategoryId());
            Category p = new Category();
            p.setCategoryId(category.getParentCategoryId());
            Category pc = selectOne(p);
            category.setPathStr(pc.getPathStr()+"/"+pc.getCategoryId());
        }
        return super.save(category);
    }
}
