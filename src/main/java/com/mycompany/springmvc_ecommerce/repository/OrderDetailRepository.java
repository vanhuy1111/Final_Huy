/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc_ecommerce.repository;

import com.mycompany.springmvc_ecommerce.entity.OrderDetailEntity;
import java.io.Serializable;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author AnhLe
 */
public interface OrderDetailRepository extends CrudRepository<OrderDetailEntity, Integer> {

}
