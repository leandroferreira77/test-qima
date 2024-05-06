package com.qima.service;

import com.qima.entity.User;

public interface AcessoService {
    void save(User user);

    User findByUsername(String username);
}
