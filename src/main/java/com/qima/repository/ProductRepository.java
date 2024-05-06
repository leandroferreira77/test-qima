package com.qima.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.qima.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
	
	Product findByName(String name);
	
	@Query(value = "SELECT COUNT(*) as quantidade FROM product ", nativeQuery = true)
	Integer getQuantityProduct();
}
