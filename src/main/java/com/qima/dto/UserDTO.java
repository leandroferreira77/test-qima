package com.qima.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Set;

import com.qima.entity.Role;

@Data
@NoArgsConstructor
@EqualsAndHashCode
@ToString
public class UserDTO {
    private Long id;
    private String username;
    private String name;
    private String email;
    private String password;
    private Set<Role> roles;

}
