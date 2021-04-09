package com.web.undefined.controller;

import java.sql.SQLException;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.undefined.dao.MemberDao;
import com.web.undefined.entity.Member;
import com.web.undefined.services.MemberServices;

@Controller
public class RegisterController {
	
	@Autowired
	MemberServices memberServices;
	
	@Autowired
	MemberDao memDao;
	
	@RequestMapping("/register")
	public String RegisterForm(Model model) {
		
		model.addAttribute("member", new Member());
		return "registration";
	}
	
	@PostMapping("/register")
	public String registerMember(@Valid Member member, BindingResult bindingResult, Model model) throws ClassNotFoundException, SQLException {
		
		if(bindingResult.hasErrors()) {
			return "registration";
		}
		
//		if(memberServices.doesMemberExist(member.getUsername())) {
//			model.addAttribute("exist",true);
//			return "registration";
//		}
		
		memDao.save(member);
		
		return "success";
		
	}

}
