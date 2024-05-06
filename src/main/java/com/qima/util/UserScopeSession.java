package com.qima.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.qima.dto.UserScopeSessionDTO;
import com.qima.entity.User;
import com.qima.service.AcessoService;

@Component
public class UserScopeSession {
	
	@Autowired
	private AcessoService userService;
	
	public String getLoggedUser() {
		final Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return auth.getName();
	}

	public UserScopeSessionDTO getUserScopeSessionDTO() {

		User user = userService.findByUsername(getLoggedUser());

		UserScopeSessionDTO userScopeSessionDTO = new UserScopeSessionDTO();

		userScopeSessionDTO.setUserId(user.getId());
		userScopeSessionDTO.setName(user.getName());
		userScopeSessionDTO.setPassword(user.getPassword());
		userScopeSessionDTO.setUsername(user.getUsername());

		return userScopeSessionDTO;

	}

}
