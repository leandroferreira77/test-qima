package com.qima.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.qima.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
