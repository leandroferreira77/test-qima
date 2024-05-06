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
import com.qima.entity.Product;
import com.qima.service.CategoryService;
import com.qima.service.ProductService;
import com.qima.util.UserScopeSession;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/products")
@AllArgsConstructor
public class ProductController {
	
	private UserScopeSession userScopeSession;
	
	private ProductService productService;
	
	private CategoryService categoryService;
	
	@GetMapping("/list")
    public String cars(HttpSession session, Model model) {
    	
    	List<Product> listProduct = productService.getAllProducts();
    	model.addAttribute("listProduct", listProduct);
    	
    	UserScopeSessionDTO userScopeSessionDTO = userScopeSession.getUserScopeSessionDTO();
		session.setAttribute("userScopeSession", userScopeSessionDTO);
    	
        return "products/list";
    }
	
	@GetMapping("/add")
    public String addProduct(HttpSession session, Model model) {
        model.addAttribute("productForm", new Product());
        
        List<Category> listCategory = categoryService.getAllCategories();
    	model.addAttribute("categories", listCategory);
    	
    	UserScopeSessionDTO userScopeSessionDTO = userScopeSession.getUserScopeSessionDTO();
		session.setAttribute("userScopeSession", userScopeSessionDTO);

        return "/products/addProduct";
    }
	
	@PostMapping("/add")
    public String registration(@ModelAttribute("productForm") Product productForm, Model model, RedirectAttributes redirectAttributes) {
		
		String mensagem = null;
		
		Product product = productService.getProductByName(productForm.getName());
		
		if(product != null) {
			mensagem = "This product already exists!";
			model.addAttribute("exists", mensagem);
			List<Category> listCategory = categoryService.getAllCategories();
	    	model.addAttribute("categories", listCategory);
			return "/products/addProduct";
		}

		productService.saveProduct(productForm);
		
		List<Product> listProduct = productService.getAllProducts();
    	
    	model.addAttribute("listProduct", listProduct);
    	
    	mensagem = "Registration successfully added!";
    	redirectAttributes.addFlashAttribute("mensagem", mensagem);
    	
    	model.addAttribute("listProduct", listProduct);

        return "redirect:/products/list";
    }
	
	@GetMapping("/edit")
    public String update(HttpSession session, ModelMap model, @RequestParam Long id) {
		
		Product product = productService.getProductById(id);
        model.addAttribute("productForm", product);
        
        List<Category> listCategory = categoryService.getAllCategories();
    	model.addAttribute("categories", listCategory);
    	
    	UserScopeSessionDTO userScopeSessionDTO = userScopeSession.getUserScopeSessionDTO();
		session.setAttribute("userScopeSession", userScopeSessionDTO);

        return "products/editProduct";
    }
	
	
	@PostMapping("/edit")
    public String update(@ModelAttribute("productForm") Product productForm, Model model, RedirectAttributes redirectAttributes) {

		String mensagem = null;
		
		productService.saveProduct(productForm);

		List<Product> listProduct = productService.getAllProducts();
    	
    	model.addAttribute("listProduct", listProduct);
    	
    	mensagem = "Registration successfully updated!";
    	
    	//atributo que grava por apenas 1 requisição a mais
        redirectAttributes.addFlashAttribute("mensagem", mensagem);

        return "redirect:/products/list";
    }
	
	@GetMapping("/delete")
    public String delete(ModelMap model, @RequestParam Long id, RedirectAttributes redirectAttributes) {
		
		String mensagem = null;
		
		productService.deleteProduct(id);
		
		List<Product> listProduct = productService.getAllProducts();
    	
    	model.addAttribute("listProduct", listProduct);
    	
    	mensagem = "Registration successfully deleted!";
    	
    	//atributo que grava por apenas 1 requisição a mais
        redirectAttributes.addFlashAttribute("mensagem", mensagem);

        return "redirect:/products/list";
    }
	
	@PostMapping("/addCategory")
    public String registrationCategory(HttpSession session, @ModelAttribute("productForm") Category categoryForm, Model model, RedirectAttributes redirectAttributes) {
		
			String mensagem = null;
			
			Category category = categoryService.getCategoryByName(categoryForm.getName());
			
			if(category != null) {
				mensagem = "This category already exists!";
				model.addAttribute("exists", mensagem);
				
				model.addAttribute("categoryForm", new Category());
		        
		        UserScopeSessionDTO userScopeSessionDTO = userScopeSession.getUserScopeSessionDTO();
				session.setAttribute("userScopeSession", userScopeSessionDTO);
				
				return "/categories/addCategory";
			}
			
			categoryService.saveCategory(categoryForm);
			
			UserScopeSessionDTO userScopeSessionDTO = userScopeSession.getUserScopeSessionDTO();
			session.setAttribute("userScopeSession", userScopeSessionDTO);
			
			mensagem = "Category successfully registered!";
			model.addAttribute("newCategory", mensagem);
			
			model.addAttribute("categoryForm", new Category());

			return "/categories/addCategory";
	}
    
}
