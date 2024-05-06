package com.qima.service;

import java.util.List;

import com.qima.entity.Category;

public interface CategoryService {
	
	List<Category> getAllCategories();
	
	Category getCategoryById(Long id);
	
	Category saveCategory(Category category);
	
	void deleteCategory(Long id);
	
	Category getCategoryByName(String name);

	Integer getQuantityCategory();
}
