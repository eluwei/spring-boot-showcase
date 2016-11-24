package org.lina.boot.web.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import lombok.Getter;
import lombok.Setter;
import org.lina.boot.BaseController;
import org.lina.boot.dto.ResponseWapper;
import org.lina.boot.model.AdminUser;
import org.lina.boot.model.Product;
import org.lina.boot.service.AdminUserService;
import org.lina.boot.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-10-09
 * Time: 11:30
 */
@Controller
public class AdminUserController implements BaseController {

    private  static String [] COLUMNS=new String[]{"id","userName","password","confirmPassword"};


    @Autowired
    @Getter
    @Setter
    private AdminUserService adminUser;

    @Autowired
    @Getter
    @Setter
    private BaseService<AdminUser> baseService;

    @RequestMapping(value = "/admin/users",method = RequestMethod.GET)
    public String listProducts(Model model){
        return "/adminuser/list";
    }
    @RequestMapping(value = "/admin/users",method = RequestMethod.POST)
    @ResponseBody
    public Object saveOrUpdatepassword(AdminUser user){
        if(user.getId() == null || user.getId() == -1){
            adminUser.insertAdminUser(user);
        }else{
            adminUser.updateAdminUserPassword(user);
        }
        return ResponseWapper.create().execSuccess().addMessage("save or update success!");
    }

    @RequestMapping("/admin/users/ajax")
    @ResponseBody
    public Object productsJson(@RequestParam(value = "start") int start,@RequestParam(value = "draw") int draw,
                               @RequestParam(value = "length",defaultValue = "10") int length,
                               @RequestParam(value="search[value]",defaultValue="")String q,
                               @RequestParam(value="order[0][column]",defaultValue="0") int sort,
                               @RequestParam(value="order[0][dir]",defaultValue="asc") String dir){
        DatatablesViewPage rs=new DatatablesViewPage<Product>();
        int p= start/length + 1 ;
        String orderBy=COLUMNS[sort]+" "+dir;
        PageHelper.startPage(p, length, orderBy);
        Page<AdminUser> users = (Page<AdminUser>)adminUser.listUsers(q);

        rs.setDraw(draw);
        rs.setRecordsTotal(users.getTotal());
        rs.setRecordsFiltered(users.getTotal());
        rs.setData(users);
        return rs;
    }

    @RequestMapping(value = "/admin/users/{adminUserId}",method = RequestMethod.GET)
    @ResponseBody
    public Object AdminUserInfo(@PathVariable("adminUserId") long id){
        AdminUser user = baseService.get(id);
        AdminUser result=new AdminUser();
        result.setId(user.getId());
        result.setPassword("");
        result.setConfirmPassword("");
        result.setUserName(user.getUserName());
        return result;
    }
}
