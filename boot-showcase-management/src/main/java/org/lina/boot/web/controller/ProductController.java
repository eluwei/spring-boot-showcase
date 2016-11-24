package org.lina.boot.web.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.lina.boot.BaseController;
import org.lina.boot.dto.ResponseWapper;
import org.lina.boot.model.Product;
import org.lina.boot.model.SKU;
import org.lina.boot.service.impl.CategoryServiceImpl;
import org.lina.boot.service.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


/**
 * Created by foy on 2016-06-01.
 */
@Controller
public class ProductController implements BaseController {

    private  static String [] COLUMNS=new String[]{"id","name","description","long_description"};

    @Autowired
    ProductServiceImpl productService;

    @Autowired
    CategoryServiceImpl categoryService;

    @RequestMapping(value = "/products",method = RequestMethod.GET)
    public String listProducts(Model model){
        model.addAttribute("categories",categoryService.getAll());
        return "/products/list";
    }

    @RequestMapping("/products/ajax")
    @ResponseBody
    public Object productsJson(@RequestParam(value = "start") int start,@RequestParam(value = "draw") int draw,
                               @RequestParam(value = "length",defaultValue = "10") int length,
                               @RequestParam(value="search[value]",defaultValue="")String q,
                               @RequestParam(value="order[0][column]",defaultValue="0") int sort,
                               @RequestParam(value="order[0][dir]",defaultValue="asc") String dir){
        DatatablesViewPage rs=new DatatablesViewPage<Product>();
        int p= start/length + 1 ;
        String orderBy=COLUMNS[sort]+" "+dir;
        PageHelper.startPage(p,length,orderBy);
        Page<Product> products= (Page<Product>)productService.listProducts(q);

        rs.setDraw(draw);
        rs.setRecordsTotal(products.getTotal());
        rs.setRecordsFiltered(products.getTotal());
        rs.setData(products);
        return rs;
    }

    @RequestMapping(value = "/products",method = RequestMethod.POST)
    @ResponseBody
    public Object saveOrUpdateProduct(Product product){
        ResponseWapper rs= ResponseWapper.create();
       productService.insertOrUpdateProduct(product);
        rs.execSuccess().addMessage("save or update success!");
        return rs;
    }

    @RequestMapping(value = "/products/{productId}",method = RequestMethod.GET)
    @ResponseBody
    public Object productInfo(@PathVariable long productId){
        return productService.get(productId);
    }
    @RequestMapping(value = "/products/{productId}/on",method = RequestMethod.POST)
    @ResponseBody
    public String putOn(@PathVariable long productId){
        Product product=new Product();
        product.setId(productId);
        product.setOnShelf(true);
        productService.insertOrUpdateProduct(product);
        return "";
    }

    @RequestMapping(value = "/products/{productId}/off",method = RequestMethod.POST)
    @ResponseBody
    public String pullOff(@PathVariable long productId){
        Product product=new Product();
        product.setId(productId);
        product.setOnShelf(false);
        productService.insertOrUpdateProduct(product);
        return "";
    }

    @RequestMapping(value = "/products/{productId}/skus",method = RequestMethod.GET)
    public String skuPage(@PathVariable long productId, Model model){
        model.addAttribute("product", productService.get(productId));
        return "/products/skus";
    }

    @RequestMapping(value = "/products/{productId}/skus/ajax",method = RequestMethod.GET)
    @ResponseBody
    public Object productSkus(@PathVariable long productId, Model model){
        return productService.listSkuByProductId(productId);
    }

    @RequestMapping(value = "/products/{productId}/sku/{skuId}",method = RequestMethod.GET)
    @ResponseBody
    public Object skuInfo(@PathVariable long productId,@PathVariable long skuId, Model model){
        return productService.getSku(skuId);
    }

    /**
     * save/update  sku
     * @return
     */
    @RequestMapping(value = "/products/{productId}/sku",method = RequestMethod.POST)
    @ResponseBody
    public Object saveOrUpdateSku(SKU sku,@PathVariable long productId){
        ResponseWapper rs=new ResponseWapper();
        rs.setProcCode(200);
        sku.setProductId(productId);
        productService.insertOrUpdateSKU(sku);
        rs.addMessage("save or udapte sku success.");
        return rs;
    }

    @RequestMapping(value = "/products/{productId}/sku/{skuId}/delete",method = RequestMethod.POST)
    @ResponseBody
    public Object deleteSku(@PathVariable long productId, @PathVariable long skuId){
        ResponseWapper rs=new ResponseWapper();
        rs.setProcCode(200);
        productService.delSku(skuId);
        rs.addMessage("delete sku success.");
        return rs;
    }
}
