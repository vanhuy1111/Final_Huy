/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc_ecommerce.repository;

import com.mycompany.springmvc_ecommerce.entity.UserEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author AnhLe
 */
@Repository
public interface UserRepository extends CrudRepository<UserEntity, Long> {

    public UserEntity findByEmailAndPassword(String email, String password);

    public UserEntity findByEmail(String email);
}
