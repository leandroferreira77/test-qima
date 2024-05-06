package com.qima.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.qima.entity.Product;
import com.qima.repository.ProductRepository;
import com.qima.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {
	
    private ProductRepository productRepository;

	@Override
	public List<Product> getAllProducts() {
		log.info("Get all the products..");
		return productRepository.findAll();
	}

	@Override
	public Product getProductById(Long id) {
		log.info("Get product by id.");
		return productRepository.findById(id).orElse(null);
	}

	@Override
	public Product saveProduct(Product product) {
		log.info("Save product.");
		return productRepository.save(product);
	}

	@Override
	public void deleteProduct(Long id) {
		log.info("Delete product by id.");
		productRepository.deleteById(id);
	}

	@Override
	public Product getProductByName(String name) {
		return productRepository.findByName(name);
	}

	@Override
	public Integer getQuantityProduct() {
		return productRepository.getQuantityProduct();
	}

}
