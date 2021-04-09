package com.web.undefined.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.web.undefined.dao.MemberDao;
import com.web.undefined.entity.Member;
import com.web.undefined.repository.MemberRepository;

//@Controller
////@RequestMapping("api/")
public class LoginController {
//	
//	
//	@Autowired
//	MemberDao dao;
//	
////	@RequestMapping("/register")
////	public String goToRegister() {
////		return "registration.html";
////	}
//	
//	@RequestMapping("/registered")
//	public String register(@RequestParam String name, String username, String password, String address, String phone) throws ClassNotFoundException, SQLException {
//		Member m = new Member(name,username,password,phone,address);
//		dao.save(m);
//		
//		return "login.html";
//	}
//	
////	@GetMapping("getmember")
////	public List<Member> getAllMem() {
////		return this.memberRepo.findAll();
////	}
//
}
