/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc_ecommerce.controller;


import com.mycompany.springmvc_ecommerce.entity.UserEntity;
import com.mycompany.springmvc_ecommerce.service.CategoryService;
import com.mycompany.springmvc_ecommerce.service.ProductService;
import com.mycompany.springmvc_ecommerce.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author AnhLe
 */
@Controller
@RequestMapping(value = "/admin/")
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/admin-page")
    public String showUserAdmin(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) (principal);
            model.addAttribute("email", userEntity.getEmail());
        }
        model.addAttribute("title", "Spring Security Hello World");
        model.addAttribute("message", "This is page admin!");
        return "admin/admin";
    }

    
    
    @RequestMapping("/users")
    public String getListUser(Model model) {
        model.addAttribute("lst", userService.getListUser());
        return "admin/users";
    }

    @RequestMapping("/orders")
    public String getListOrder(Model model) {
        //model.addAttribute("lst", orderService.getListUser());
        return "admin/orders";
    }

}
