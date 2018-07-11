/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc_ecommerce.service;

import com.mycompany.springmvc_ecommerce.entity.CategoryEntity;
import com.mycompany.springmvc_ecommerce.repository.CategoryRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Huy
 */
@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    public List<CategoryEntity> getListCategory() {
        return (List<CategoryEntity>) categoryRepository.findAll();
    }

    public CategoryEntity getCategory(int id) {
        return categoryRepository.findOne(id);
    }

    public List<CategoryEntity> findCategoryByName(String searchText) {
        return categoryRepository.findByCategoryNameLike("%" + searchText + "%");
    }

    public CategoryEntity addNewCategory(CategoryEntity c) {
        c = categoryRepository.save(c);
        return c;
    }

    public void deleteCategoryByIdSimple(int id) {
        categoryRepository.delete(id);
    }
}
