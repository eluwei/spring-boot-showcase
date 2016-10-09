package org.lina.boot.web.controller;


import org.lina.boot.dto.RESTResponseDTO;
import org.lina.boot.model.Category;
import org.lina.boot.service.BaseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by foy on 2016-06-07.
 */
@Controller
@RequestMapping("/categories")
public class CategoryController {

    @Resource(name="categoryService")
    BaseService<Category> categoryService;

    @RequestMapping(value = "",method = RequestMethod.GET)
    public String page(){
        return "categories/tree";
    }

    @RequestMapping("/tree.json")
    @ResponseBody
    public Object categoriesJson(){
        return categoryService.getAll();
    }
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public Object saveOrUpdateOrDelete(Category category,@RequestParam(value = "op",defaultValue = "u") String op,
                                         @RequestParam(value = "categoryId",defaultValue = "0") long categoryId){
        Category result=null;
        switch (op){
            case "u":{
                categoryService.update(category);
                return category;
            }
            case "c":{
                category.setCategoryId(null);
                categoryService.save(category);
                return category;
            }
            case "d":{
                categoryService.deleteByPrimaryKey(categoryId);
                RESTResponseDTO rs=new RESTResponseDTO();
                rs.setProcCode(200);
                rs.setMessage("delete success!");
                return rs;
            }

        }
        return result;
    }
}
