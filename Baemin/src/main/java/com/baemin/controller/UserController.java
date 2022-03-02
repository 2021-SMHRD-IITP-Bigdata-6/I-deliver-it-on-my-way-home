package com.baemin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baemin.dto.Join;
import com.baemin.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	
	@GetMapping("/Mypage")
	public String MyPage() {
		return "user/Mypage";
	}
	
	@GetMapping("/login")
	public String login() {
		return "user/login";
	}
	@GetMapping("/Join")
	public String Join() {
		return "user/Join";
	}
	

	
	
	
//	@ResponseBody
//	@GetMapping("/overlapCheck")
//	public int overlapCheck(String value, String valueType) {
////		value = 중복체크할 값
////		valeuType = username, nickname
//		System.out.println(value);
//		System.out.println(valueType);
//		int count = userService.overlapCheck(value, valueType);
//		
//		System.out.println(count);
//		return count;
//	}

}

