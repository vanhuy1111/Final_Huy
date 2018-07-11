/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc_ecommerce.controller;

import com.mycompany.springmvc_ecommerce.entity.CustomerEntity;
import com.mycompany.springmvc_ecommerce.entity.OrderDetailEntity;
import com.mycompany.springmvc_ecommerce.entity.OrderEntity;
import com.mycompany.springmvc_ecommerce.entity.ProductEntity;
import com.mycompany.springmvc_ecommerce.entity.UserEntity;
import com.mycompany.springmvc_ecommerce.service.CustomerService;
import com.mycompany.springmvc_ecommerce.service.OrderDetailService;
import com.mycompany.springmvc_ecommerce.service.OrderService;
import com.mycompany.springmvc_ecommerce.service.ProductService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Administrator
 */
@Controller
public class CartController {

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping(value = "/add-to-cart/{id}")
    public String addOrder(Model model,
            @PathVariable(value = "id") int id,
            HttpSession session) {
        ProductEntity product = productService.getProductById(id);
        OrderEntity orderEntity = (OrderEntity) session.getAttribute("order");
        if (product != null && product.getProductId() > 0) {
            OrderDetailEntity detailEntity = new OrderDetailEntity();
            detailEntity.setProduct(product);
            detailEntity.setQuantity(1);

            if (orderEntity != null) {
                if (orderEntity.getListOrderDetail() != null && orderEntity.getListOrderDetail().size() > 0) {
                    boolean ischeckExit = false;
                    for (OrderDetailEntity orderDetailEntity : orderEntity.getListOrderDetail()) {
                        if (orderDetailEntity.getProduct().getProductId() == id) {
                            orderDetailEntity.setQuantity(orderDetailEntity.getQuantity() + 1);
                            ischeckExit = true;
                            break;
                        }
                    }
                    if (!ischeckExit) {
                        orderEntity.getListOrderDetail().add(detailEntity);
                    }
                } else {
                    List<OrderDetailEntity> lstOrderDetailEntitys = new ArrayList<>();
                    lstOrderDetailEntitys.add(detailEntity);
                    orderEntity.setListOrderDetail(lstOrderDetailEntitys);
                }
                orderEntity.setTotalPrice(orderEntity.getTotalPrice() + product.getPrice());
            } else {
                orderEntity = new OrderEntity();
                orderEntity.setOrderDate(new Date());
                List<OrderDetailEntity> lstOrderDetailEntitys = new ArrayList<>();
                lstOrderDetailEntitys.add(detailEntity);
                orderEntity.setListOrderDetail(lstOrderDetailEntitys);
                orderEntity.setTotalPrice(product.getPrice());
            }
        }
        session.setAttribute("order", orderEntity);
        return "redirect:/cart";
    }

    
    @RequestMapping(value = "/cart")
    public String viewCart(Model model, HttpSession session) {
        OrderEntity orderEntity = (OrderEntity) session.getAttribute("order");
        if (orderEntity != null && orderEntity.getListOrderDetail() != null && orderEntity.getListOrderDetail().size() > 0) {
            model.addAttribute("orderEntity", orderEntity);
        }
        return "cart";
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String checkout(Model model,
            HttpSession session) {
        OrderEntity orderEntity = (OrderEntity) session.getAttribute("order");
        if (orderEntity != null && orderEntity.getListOrderDetail() != null && orderEntity.getListOrderDetail().size() > 0) {
            model.addAttribute("orderEntity", orderEntity);
        }
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) (principal);
            if (userEntity != null && userEntity.getId() > 0) {
                model.addAttribute("user", userEntity);
            }
        }
        model.addAttribute("customer", new CustomerEntity());
        return "checkout";
    }

    @RequestMapping("/delete/{id}")
    public String deleteProductInCart(Model model, @PathVariable(value = "id") int id, HttpSession session) {
        OrderEntity orderEntity = (OrderEntity) session.getAttribute("order");
        if (orderEntity != null && orderEntity.getListOrderDetail() != null && orderEntity.getListOrderDetail().size() > 0) {
            double priceProduct = 0;
            double oldQuantity = 0;
            for (OrderDetailEntity orderDetailEntity : orderEntity.getListOrderDetail()) {
                if (orderDetailEntity.getProduct().getProductId() == id) {
                    orderEntity.getListOrderDetail().remove(orderDetailEntity);
                    priceProduct = orderDetailEntity.getProduct().getPrice();
                    oldQuantity = orderDetailEntity.getQuantity();
                    break;
                }
            }
            if (priceProduct != 0) {
                orderEntity.setTotalPrice(orderEntity.getTotalPrice() - (priceProduct * oldQuantity));
            }
        }
        session.setAttribute("order", orderEntity);
        return "redirect:/cart";
    }

    @RequestMapping("/update/{id}")
    public String updateProductInCart(Model model, @RequestParam(value = "quantity") int quantity, @PathVariable(value = "id") int id, HttpSession session) {
        OrderEntity orderEntity = (OrderEntity) session.getAttribute("order");
        if (orderEntity != null && orderEntity.getListOrderDetail() != null && orderEntity.getListOrderDetail().size() > 0) {
            double priceProduct = 0;
            double oldQuantity = 0;
            for (OrderDetailEntity orderDetailEntity : orderEntity.getListOrderDetail()) {
                if (orderDetailEntity.getProduct().getProductId() == id) {
                    priceProduct = orderDetailEntity.getProduct().getPrice();
                    oldQuantity = orderDetailEntity.getQuantity();
                    orderDetailEntity.setQuantity(quantity);
                    break;
                }
            }
            if (priceProduct != 0) {
                orderEntity.setTotalPrice((orderEntity.getTotalPrice() + (quantity * priceProduct)) - (priceProduct * oldQuantity));
            }
        }
        session.setAttribute("order", orderEntity);
        return "redirect:/cart";
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.POST)
    public String saveOrder(Model model, HttpSession session, @ModelAttribute(value = "customer") CustomerEntity c) throws MessagingException {
        OrderEntity orderEntity = (OrderEntity) session.getAttribute("order");
        String message = "save order failed.";
        if (orderEntity != null && orderEntity.getListOrderDetail() != null && orderEntity.getListOrderDetail().size() > 0) {
            
            CustomerEntity customerEntity = customerService.findByIdCard(c.getIdCard());
            CustomerEntity customerEntityAfterSave = null;
            if (customerEntity != null && customerEntity.getCustomerId() > 0) {

                customerEntity.setAddress(c.getAddress());
                customerEntity.setCustomerName(c.getCustomerName());
                customerEntity.setEmail(c.getEmail());
                customerEntity.setPhone(c.getPhone());
                customerEntityAfterSave = customerService.addNewCustomer(customerEntity);
            } else {
                customerEntityAfterSave = customerService.addNewCustomer(c);
            }

            if (customerEntityAfterSave != null && customerEntityAfterSave.getCustomerId() > 0) {

                orderEntity.setCustomer(customerEntity);
                orderService.addNewOrderEntity(orderEntity);
                if (orderEntity != null && orderEntity.getOrderId() > 0) {
                   
                    boolean savePass = false;
                    for (OrderDetailEntity detailEntity : orderEntity.getListOrderDetail()) {
                        OrderDetailEntity orderDetailEntity = new OrderDetailEntity();
                        orderDetailEntity.setOrder(orderEntity);
                        orderDetailEntity.setProduct(detailEntity.getProduct());
                        orderDetailEntity.setQuantity(detailEntity.getQuantity());
                        orderDetailService.saveOrderDetail(orderDetailEntity);
                        if (orderDetailEntity != null && orderDetailEntity.getOrderDetailId() > 0) {
                            savePass = true;
                        } else {
                            savePass = false;
                        }
                    }
                    if (savePass) {
                        
                        SimpleMailMessage email = new SimpleMailMessage();
                        email.setTo(customerEntityAfterSave.getEmail());
                        email.setSubject("Welcome to One Shop");
                        String htmlMsg  = "You bought success." + "\n"
                                + "Thank you for your shopping. Your satisfaction is our honor. "+ "\n"
                                + "Thank you very much!"+ "\n"
                                + " Have a nice day!"+ "\n"
                                + " Information Order" + "\n"
                                + "Name: " + customerEntityAfterSave.getCustomerName() + "\n"
                                + "ID Order: " + orderEntity.getOrderId() + "\n"
                                + "Order Date: " + orderEntity.getOrderDate() + "\n"
                                + "Total Price: $" + orderEntity.getTotalPrice() + "\n";
                        
                        email.setText(htmlMsg);
                        mailSender.send(email);
                        session.removeAttribute("order");
                        message = "Thank you for your order, email has been sent to you.";
                    }
                }
            }
        }
        model.addAttribute("message", message);
        return "result";
    }

}
