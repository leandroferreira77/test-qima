package com.qima.dto;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@EqualsAndHashCode
@ToString
@Component
@Scope("session")
public class UserScopeSessionDTO implements Serializable {
	
    private static final long serialVersionUID = 1L;
    
	private Long userId;
    private String username;
    private String name;
    private String password;
}
