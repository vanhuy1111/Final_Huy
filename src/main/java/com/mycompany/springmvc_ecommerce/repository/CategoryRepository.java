/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc_ecommerce.repository;


import com.mycompany.springmvc_ecommerce.entity.CategoryEntity;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Huy
 */
@Repository
public interface CategoryRepository extends CrudRepository<CategoryEntity, Integer>{
   public List<CategoryEntity> findByCategoryNameLike(String searchText); 
}
