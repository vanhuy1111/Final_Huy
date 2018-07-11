/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc_ecommerce.service;

import com.mycompany.springmvc_ecommerce.entity.CustomerEntity;
import com.mycompany.springmvc_ecommerce.entity.OrderEntity;
import com.mycompany.springmvc_ecommerce.repository.CustomerRepository;
import com.mycompany.springmvc_ecommerce.repository.OrderRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private OrderRepository orderRepository;

    public List<CustomerEntity> getListCustomer() {
        return (List<CustomerEntity>) customerRepository.findAll();
    }

    public CustomerEntity getCustomer(int id) {
        return customerRepository.findOne(id);
    }

    public CustomerEntity findByIdCard(int idCard) {
        return (CustomerEntity) customerRepository.findOneByIdCard(idCard);
    }

    public List<CustomerEntity> findCustomerByName(String searchText) {
        return customerRepository.findByCustomerNameLike("%" + searchText + "%");
    }

    public CustomerEntity addNewCustomer(CustomerEntity c) {
        return customerRepository.save(c);
    }

    public void deleteCustomerByIdSimple(int id) {
        customerRepository.delete(id);
    }
}
