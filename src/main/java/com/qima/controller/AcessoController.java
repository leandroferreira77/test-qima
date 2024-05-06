package com.qima.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.qima.dto.UserScopeSessionDTO;
import com.qima.entity.User;
import com.qima.service.AcessoService;
import com.qima.service.CategoryService;
import com.qima.service.ProductService;

@Controller
public class AcessoController {

	@Autowired
	private AcessoService userService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;

	@GetMapping("/auth")
	public String auth(Model model, String error, String logout) {

		if (error != null) {
			model.addAttribute("error", "Invalid credentials!");
		}

		if (logout != null) {
			model.addAttribute("message", "Log out successfully!");
		}

		return "auth";
	}

	@GetMapping({ "/", "/welcome" })
	public String dashboard(Model model, HttpSession session, String tokenCode) throws SQLException {

		User user = userService.findByUsername(this.pegarUsuarioLogado());

		if (user != null && user.getStatusUser() == 0) {
			model.addAttribute("error", "Access blocked!");
			return "auth";
		}
		
		if (user != null && user.getUsername() != null) {
			
			UserScopeSessionDTO userScopeSessionDTO = new UserScopeSessionDTO();
			userScopeSessionDTO.setUsername(user.getUsername());
			userScopeSessionDTO.setName(user.getName());
			userScopeSessionDTO.setUserId(user.getId());
			
			session.setAttribute("userScopeSession", userScopeSessionDTO);
			
			int product = 0;
			
			Integer qtdProduct = productService.getQuantityProduct();
			
			if(qtdProduct != null) {
				product = qtdProduct;
			}
			
			model.addAttribute("qtdProduct", product);
			
			int category = 0;
			
			Integer qtdCategory = categoryService.getQuantityCategory();
			
			if(qtdCategory != null) {
				category = qtdCategory;
			}
			
			model.addAttribute("qtdCategory", category);
			
		} else {
			return "auth";
		}
		
		return "dashboard";
	}

	@GetMapping({ "/home" })
	public String home(HttpSession session, Model model) {

		UserScopeSessionDTO userScopeSessionDTO = this.pegaUserScopeSessionDTO();
		session.setAttribute("userScopeSession", userScopeSessionDTO);
		
		int product = 0;
		
		Integer qtdProduct = productService.getQuantityProduct();
		
		if(qtdProduct != null) {
			product = qtdProduct;
		}
		
		model.addAttribute("qtdProduct", product);
		
		int category = 0;
		
		Integer qtdCategory = categoryService.getQuantityCategory();
		
		if(qtdCategory != null) {
			category = qtdCategory;
		}
		
		model.addAttribute("qtdCategory", category);
		
		return "dashboard";
	}
	
	public String pegarUsuarioLogado() {
		final Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String cdnUsuario = auth.getName(); // get session user
		return cdnUsuario;
	}

	public UserScopeSessionDTO pegaUserScopeSessionDTO() {

		User user = userService.findByUsername(pegarUsuarioLogado());

		UserScopeSessionDTO userScopeSessionDTO = new UserScopeSessionDTO();

		userScopeSessionDTO.setUserId(user.getId());
		userScopeSessionDTO.setName(user.getName());
		userScopeSessionDTO.setPassword(user.getPassword());
		userScopeSessionDTO.setUsername(user.getUsername());

		return userScopeSessionDTO;

	}
}
