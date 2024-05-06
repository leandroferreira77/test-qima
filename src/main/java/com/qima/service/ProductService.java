package com.qima.service;

import java.util.List;

import com.qima.entity.Product;

public interface ProductService {
	
	List<Product> getAllProducts();
	
	Product getProductById(Long id);
	
	Product saveProduct(Product product);
	
	void deleteProduct(Long id);
	
	Product getProductByName(String name);

	Integer getQuantityProduct();
}
