package com.qima.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordGenerate {
	
	public static void main(String[] args) {    
		
		 String senhaCriptografado = new BCryptPasswordEncoder().encode("qima@123");
		 System.out.println(senhaCriptografado);
		 // $2a$10$.M21F4qrIPHSZEWT9UWRH.VQosqkPt1uZkV7bFR8JIxgqD4K7ttKa = qima@123
		 // $2a$10$LmAxvV1es.Wq.9L6gOJ2YeIqodigBEmX2pkEZ1Xqv/IBku9BTVozS = qima@123
		
    }
	

}
