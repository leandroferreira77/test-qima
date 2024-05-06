package com.qima.entity;

import java.time.LocalDateTime;
import java.io.Serializable;
import java.math.BigDecimal;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "product")
public class Product implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Long id;

	@Column(length = 150, nullable = true)
    private String name;

	@Column(length = 300, nullable = true)
    private String description;

    @Column(nullable = true)
    private BigDecimal price;
    
    @Column(nullable = true)
    private Short available;
    
    @CreationTimestamp
	@Column(nullable = true)
	private LocalDateTime createdAt;
	
	@UpdateTimestamp
	@Column(nullable = true)
	private LocalDateTime updatedAt;
	
	@ManyToOne
	@JoinColumn(name = "category_id", nullable = false)
    private Category category;

}
