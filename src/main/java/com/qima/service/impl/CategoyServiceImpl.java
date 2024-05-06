package com.qima.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.qima.entity.Category;
import com.qima.repository.CategoryRepository;
import com.qima.service.CategoryService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class CategoyServiceImpl implements CategoryService {
	
    private CategoryRepository categoryRepository;

	@Override
	public List<Category> getAllCategories() {
		log.info("Get all the categorys..");
		return categoryRepository.findAll();
	}

	@Override
	public Category getCategoryById(Long id) {
		log.info("Get category by id.");
		return categoryRepository.findById(id).orElse(null);
	}

	@Override
	public Category saveCategory(Category category) {
		log.info("Save category.");
		return categoryRepository.save(category);
	}

	@Override
	public void deleteCategory(Long id) {
		log.info("Delete category by id.");
		categoryRepository.deleteById(id);
	}

	@Override
	public Category getCategoryByName(String name) {
		return categoryRepository.findByName(name);
	}

	@Override
	public Integer getQuantityCategory() {
		return categoryRepository.getQuantityCategory();
	}

}
