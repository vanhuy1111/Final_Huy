/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc_ecommerce.service;

import com.mycompany.springmvc_ecommerce.entity.OrderDetailEntity;
import com.mycompany.springmvc_ecommerce.repository.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailService {

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    public OrderDetailEntity saveOrderDetail(OrderDetailEntity orderDetail) {
        return orderDetailRepository.save(orderDetail);
    }

}
