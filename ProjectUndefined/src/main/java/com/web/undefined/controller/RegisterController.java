package com.web.undefined.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController {
	
	@RequestMapping("/register")
	public String RegisterForm() {
		return "registration";
	}

}
