/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc_ecommerce.controller;

import com.mycompany.springmvc_ecommerce.entity.CategoryEntity;
import com.mycompany.springmvc_ecommerce.entity.ProductEntity;
import com.mycompany.springmvc_ecommerce.service.CategoryService;
import com.mycompany.springmvc_ecommerce.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Huy
 */
@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @ModelAttribute("categories")
    private List<CategoryEntity> category() {
        return categoryService.getListCategory();
    }

    @RequestMapping(value = {"/home"}, method = RequestMethod.GET)
    public String homePage(Model model) {
        model.addAttribute("lst", productService.getListProduct());
        return "product";
    }

    @RequestMapping("/details/{id}")
    public String getProduct(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("p", (ProductEntity) productService.getProduct(id));
        return "details";
    }

    @RequestMapping(value = {"/product"}, method = RequestMethod.GET)
    public String showProduct(Model model) {
        model.addAttribute("lst", productService.getListProduct());
        return "product";
    }

    @RequestMapping("/search")
    public String searchProduct(@ModelAttribute(value = "categoryName") String categoryName, @ModelAttribute(value = "searchText") String searchText,
            Model model) {
        model.addAttribute("lst", productService.findProductByName(searchText));
        return "product";
    }

    @RequestMapping("/promotion")
    public String getListPromotion(Model model) {
        model.addAttribute("list", productService.getListProduct());
        return "promotion";
    }
    
    @RequestMapping(value = {"/about"}, method = RequestMethod.GET)
    public String about(Model model) {
        return "about";
    }
    
    @RequestMapping(value = {"/contact"}, method = RequestMethod.GET)
    public String contact(Model model) {
        return "contact";
    }
}
