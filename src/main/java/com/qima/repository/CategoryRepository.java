package com.qima.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.qima.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
	
	Category findByName(String name);
	
	@Query(value = "SELECT COUNT(*) as quantity FROM category ", nativeQuery = true)
	Integer getQuantityCategory();
}
