/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc_ecommerce.repository;

import com.mycompany.springmvc_ecommerce.entity.CustomerEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Huy
 */
@Repository
public interface CustomerRepository extends CrudRepository<CustomerEntity, Integer> {

    public List<CustomerEntity> findByCustomerNameLike(String searchText);

    public CustomerEntity findOneByIdCard(int idCard);
}
