/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc_ecommerce.service;

import com.mycompany.springmvc_ecommerce.entity.ProductEntity;
import com.mycompany.springmvc_ecommerce.repository.ProductRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Huy
 */
@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public List<ProductEntity> getListProduct() {
        List<ProductEntity> lst = (List<ProductEntity>) productRepository.findAll();
        return lst;
    }

    public ProductEntity getProduct(int id) {
        return productRepository.findOne(id);
    }

    public List<ProductEntity> findProductByName(String searchText) {
//        return userRepository.findByEmail(searchText);
        return productRepository.findByProductNameContaining("%" + searchText + "%");
//        return userRepository.findByEmailContaining(searchText);
//        return userRepository.findByFirstnameOrLastname(searchText, searchText);
//          return userRepository.findByFirstnameContainingOrLastnameContaining(searchText, searchText);
//        return productRepository.findUserNativeQuery("%" + categoryName + "%", "%" + searchText + "%");
    }
    
    public List<ProductEntity> findProduct(String categoryName, String searchText) {
//        return userRepository.findByEmail(searchText);
        return productRepository.findByProductNameContaining("%" + searchText + "%");
//        return userRepository.findByEmailContaining(searchText);
//        return userRepository.findByFirstnameOrLastname(searchText, searchText);
//          return userRepository.findByFirstnameContainingOrLastnameContaining(searchText, searchText);
//        return productRepository.findUserNativeQuery("%" + categoryName + "%", "%" + searchText + "%");
    }

    public ProductEntity addNewProduct(ProductEntity p) {
        p = productRepository.save(p);
        return p;
    }

    public ProductEntity getProductById(int id) {
        return productRepository.findOne(id);
    }

    public void deleteProductByIdSimple(int id) {
        productRepository.delete(id);
    }
    
    public void deleteUserByIdNoMessage(int id) {
        productRepository.delete(id);
    }
}
