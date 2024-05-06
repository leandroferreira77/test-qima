package com.qima.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Set;

@Data
@NoArgsConstructor
@EqualsAndHashCode
@ToString
public class RoleDTO {
    private Long id;
    private String name;
    private Set<UserDTO> users;
}
