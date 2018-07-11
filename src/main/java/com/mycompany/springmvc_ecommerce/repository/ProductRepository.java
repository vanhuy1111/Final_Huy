/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc_ecommerce.repository;

import com.mycompany.springmvc_ecommerce.entity.ProductEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Huy
 */
@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Integer> {
//    public List<UserEntity> findByEmail(String searchText);
//    

    public List<ProductEntity> findByProductNameContaining(String searchText);
//   
//    public List<UserEntity> findByEmailContaining(String searchText);
//    
//    public List<UserEntity> findByFirstnameOrLastname(String firstname ,String lastname);
//    
//    public List<UserEntity> findByFirstnameContainingOrLastnameContaining(String firstname ,String lastname);

    @Query(value = "SELECT * FROM product p JOIN category c "
            + "ON c.category_id = p.category_id "
            + "WHERE c.category_name LIKE ?1 or p.product_name LIKE ?2",
            nativeQuery = true)
    public List<ProductEntity> findUserNativeQuery(String categoryName, String searchText);
    
   
}
