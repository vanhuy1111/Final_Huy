/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc_ecommerce.service;

import com.mycompany.springmvc_ecommerce.entity.OrderDetailEntity;
import com.mycompany.springmvc_ecommerce.entity.OrderEntity;
import com.mycompany.springmvc_ecommerce.entity.ProductEntity;
import com.mycompany.springmvc_ecommerce.repository.OrderRepository;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    public boolean checkProductInOrder(ProductEntity product, OrderEntity order) {
        boolean t = false;
        for (OrderDetailEntity orderDetail : order.getListOrderDetail()) {
            if (orderDetail.getProduct().getProductId() == product.getProductId()) {
                t = true;
                break;
            }
        }
        return t;
    }

    public void addOrderDetailToOrder(ProductEntity product, OrderEntity order) {
        OrderDetailEntity orderDetail = new OrderDetailEntity(product, 1);
        order.getListOrderDetail().add(orderDetail);
    }

    public void increaseQuantityForOrderDetail(ProductEntity product, OrderEntity order) {
        for (OrderDetailEntity orderDetail : order.getListOrderDetail()) {
            if (orderDetail.getProduct().getProductId() == product.getProductId()) {
                orderDetail.setQuantity(orderDetail.getQuantity() + 1);
                break;
            }
        }
    }

    public void updateQuantityForOrderDetail(int num, ProductEntity product, OrderEntity order) {
        for (OrderDetailEntity orderDetail : order.getListOrderDetail()) {
            if (orderDetail.getProduct().getProductId() == product.getProductId()) {
                orderDetail.setQuantity(num);
                break;
            }
        }
    }

    public void deleteProductInOrder(ProductEntity product, OrderEntity order) {
        for (OrderDetailEntity orderDetail : order.getListOrderDetail()) {
            if (orderDetail.getProduct().getProductId() == product.getProductId()) {
                order.getListOrderDetail().remove(orderDetail);
                break;
            }
        }
    }

    public void deleteProductById(int id) {
        orderRepository.delete(id);
    }

    public boolean deleteProduct(int id) {
        this.deleteProductById(id);
        return orderRepository.exists(id);
    }

    public List<OrderEntity> getOrder() {
        List<OrderEntity> list = (List<OrderEntity>) orderRepository.findAll();
        return list;
    }

    public OrderEntity addNewOrderEntity(OrderEntity c) {
        c = orderRepository.save(c);
        return c;
    }
}
