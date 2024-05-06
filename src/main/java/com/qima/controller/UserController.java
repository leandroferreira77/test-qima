package com.qima.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qima.dto.UserScopeSessionDTO;
import com.qima.entity.Role;
import com.qima.entity.User;
import com.qima.repository.RoleRepository;
import com.qima.repository.UserRepository;
import com.qima.util.UserScopeSession;

@Controller
@RequestMapping("/users")
public class UserController {
	
	@Autowired
	private UserScopeSession userScopeSession;
	
	@Autowired
	private UserRepository usuariosRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("/edit")
    public String update(ModelMap model, HttpSession session, @RequestParam Long id) {
		
		List<Role> roles = roleRepository.findAll();
		model.addAttribute("roles", roles);
		
		User usuario = usuariosRepository.getOne(id);
		usuario.setPassword("");
		
        model.addAttribute("usuariosForm", usuario);

        return "users/editUser";
    }
	
	
	@PostMapping("/edit")
    public String update(@ModelAttribute("usuariosForm") User usuariosForm, BindingResult bindingResult, HttpSession session, RedirectAttributes redirectAttributes) {
		
		String mensagem = null;

		Set<Role> roles = new HashSet<>();
        Role role = new Role();
        role.setId_role(1L);
        roles.add(role);
        
        usuariosForm.setRoles(roles);
        
        usuariosForm.setPassword(bCryptPasswordEncoder.encode(usuariosForm.getPassword()));
        
        usuariosRepository.saveAndFlush(usuariosForm);
    	
        mensagem = "Registration successfully updated!";
    	
        redirectAttributes.addFlashAttribute("mensagem", mensagem);
        
        UserScopeSessionDTO userScopeSessionDTO = userScopeSession.getUserScopeSessionDTO();
		session.setAttribute("userScopeSession", userScopeSessionDTO);

        return "redirect:/users/list";
    }

    @GetMapping("/list")
    public String usuarios(HttpSession session, Model model) {
    	
    	List<User> listUsers = usuariosRepository.findAll();
    	model.addAttribute("listUsers", listUsers);

    	UserScopeSessionDTO userScopeSessionDTO = userScopeSession.getUserScopeSessionDTO();
		session.setAttribute("userScopeSession", userScopeSessionDTO);
    	
        return "users/list";
    }
}
