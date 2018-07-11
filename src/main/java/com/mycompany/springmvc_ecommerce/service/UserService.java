/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc_ecommerce.service;



import com.mycompany.springmvc_ecommerce.entity.UserEntity;
import com.mycompany.springmvc_ecommerce.repository.UserRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

/**
 *
 * @author AnhLe
 */
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public UserEntity findByEmailAndPassword(String email, String password) {
        return userRepository.findByEmailAndPassword(email, password);
    }
    
    public UserEntity findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    
    public boolean emailExist(String email) {
        UserEntity user = userRepository.findByEmail(email);
        return user != null;
    }

    public UserEntity addNewUser(UserEntity u) {
        u = userRepository.save(u);
        return u;
    }
    public List<UserEntity> getListUser() {
        List<UserEntity> lst = (List<UserEntity>) userRepository.findAll();
        return lst;
    }
    
}
