package com.web.undefined.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.undefined.dao.MemberDao;
import com.web.undefined.entity.Member;
import com.web.undefined.repository.MemberRepository;

@Controller
public class LoginController {
	
	@Autowired
	MemberRepository memberRepo;
	
	@Autowired
	MemberDao dao;
	
	@RequestMapping("/")
	public String goToRegister() {
		return "registration.html";
	}
	
	@RequestMapping("/registered")
	public String register(@RequestParam String name, String username, String password, String address, String phone) throws ClassNotFoundException, SQLException {
		Member m = new Member(name,username,password,phone,address);
		dao.save(m);
		
		return "login.html";
	}

}
