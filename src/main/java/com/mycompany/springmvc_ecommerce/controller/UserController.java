/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc_ecommerce.controller;


import com.mycompany.springmvc_ecommerce.entity.UserEntity;
import com.mycompany.springmvc_ecommerce.service.CustomerService;
import com.mycompany.springmvc_ecommerce.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author AnhLe
 */
@Controller
public class UserController {
    
    @Autowired
    private CustomerService customerService;
    
    @Autowired
    private UserService userService;

    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping(value = {"/user/user-page"}, method = RequestMethod.GET)
    public String userPage(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) (principal);
            model.addAttribute("email", userEntity.getEmail());
            model.addAttribute("user", userEntity);
        }
        model.addAttribute("title", "Welcome to Shop One!");
        model.addAttribute("message", "This is user page!");
        
        return "user";
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login(Model model) {
        return "login";
    }

    @RequestMapping(value = {"/loginError"}, method = RequestMethod.GET)
    public String loginError(Model model) {
        model.addAttribute("message", "Invalid account email or password.");
        return "login";
    }

    @RequestMapping(value = {"/register"}, method = RequestMethod.GET)
    public String register(Model model) {
        model.addAttribute("user", new UserEntity());
        return "register";
    }
    

     @RequestMapping(value = "/register", method = RequestMethod.POST)
     public String registerAccount2(Model model,@ModelAttribute(value = "user") UserEntity u) {
         UserEntity ue = userService.addNewUser(u);
         if (ue.getId()> 0) {
              String recipientAddress = u.getEmail();
                    String subject = "Your Account";
                    String message = "You have been registered successfully. Use this information to login: " + "Your email: " + u.getEmail() + ". " + "Your password: " + u.getPassword().length() + " characters.";
                    SimpleMailMessage email = new SimpleMailMessage();
                    email.setTo(recipientAddress);
                    email.setSubject(subject);
                    email.setText(message);
                    mailSender.send(email);
            return "welcome";
        } else {
            model.addAttribute("message", "save failed");
            model.addAttribute("customer", new UserEntity());
            model.addAttribute("action", "save");
            return "register";
        }
     }
}
