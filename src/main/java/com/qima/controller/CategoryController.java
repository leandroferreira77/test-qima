package com.qima.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qima.dto.UserScopeSessionDTO;
import com.qima.entity.Category;
import com.qima.service.CategoryService;
import com.qima.util.UserScopeSession;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/categories")
@AllArgsConstructor
public class CategoryController {
	
	private UserScopeSession userScopeSession;
	private CategoryService categoryService;
	
	@GetMapping("/list")
    public String listCategory(HttpSession session, Model model) {
    	
    	List<Category> listCategory = categoryService.getAllCategories();
    	model.addAttribute("listCategory", listCategory);
    	
    	UserScopeSessionDTO userScopeSessionDTO = userScopeSession.getUserScopeSessionDTO();
		session.setAttribute("userScopeSession", userScopeSessionDTO);
    	
        return "categories/list";
    }
	
	@GetMapping("/add")
    public String addCategory(HttpSession session, Model model) {
		
        model.addAttribute("categoryForm", new Category());
        
        UserScopeSessionDTO userScopeSessionDTO = userScopeSession.getUserScopeSessionDTO();
		session.setAttribute("userScopeSession", userScopeSessionDTO);

        return "/categories/addCategory";
    }
	
	@PostMapping("/add")
    public String registration(HttpSession session, @ModelAttribute("categoryForm") Category categoryForm, Model model, RedirectAttributes redirectAttributes) {

		String mensagem = null;
		
		Category category = categoryService.getCategoryByName(categoryForm.getName());
		
		if(category != null) {
			mensagem = "This category already exists!";
			model.addAttribute("exists", mensagem);
			return "/categories/addCategory";
		}
		
		categoryService.saveCategory(categoryForm);
		
		List<Category> listCategory = categoryService.getAllCategories();
    	
    	model.addAttribute("listCategory", listCategory);
    	
    	mensagem = "Registration successfully added!";
    	
    	//atributo que grava por apenas 1 requisição a mais
        redirectAttributes.addFlashAttribute("mensagem", mensagem);
    	
    	model.addAttribute("listCategory", listCategory);

        return "redirect:/categories/list";
    }
	
	@GetMapping("/edit")
    public String update(HttpSession session, ModelMap model, @RequestParam Long id) {
		
		Category category = categoryService.getCategoryById(id);
        model.addAttribute("categoryForm", category);
        
        UserScopeSessionDTO userScopeSessionDTO = userScopeSession.getUserScopeSessionDTO();
		session.setAttribute("userScopeSession", userScopeSessionDTO);

        return "categories/editCategory";
    }
	
	
	@PostMapping("/edit")
    public String update(@ModelAttribute("categoryForm") Category categoryForm, Model model, RedirectAttributes redirectAttributes) {

		String mensagem = null;
		
		categoryService.saveCategory(categoryForm);

		List<Category> listCategory = categoryService.getAllCategories();
    	
    	model.addAttribute("listCategory", listCategory);
    	
    	mensagem = "Registration successfully updated!";
    	
    	//atributo que grava por apenas 1 requisição a mais
        redirectAttributes.addFlashAttribute("mensagem", mensagem);

        return "redirect:/categories/list";
    }
	
	@GetMapping("/delete")
    public String delete(ModelMap model, @RequestParam Long id, RedirectAttributes redirectAttributes) {
		
		String mensagem = null;
		
		categoryService.deleteCategory(id);
		
		List<Category> listCategory = categoryService.getAllCategories();
    	
    	model.addAttribute("listCategory", listCategory);
    	
    	mensagem = "Registration successfully deleted!";
    	
    	//atributo que grava por apenas 1 requisição a mais
        redirectAttributes.addFlashAttribute("mensagem", mensagem);

        return "redirect:/categories/list";
    }
    
}
