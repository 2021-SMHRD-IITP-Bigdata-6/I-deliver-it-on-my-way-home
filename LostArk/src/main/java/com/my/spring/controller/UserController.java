package com.my.spring.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
// 회원가입
import com.my.dto.memberDTO.Join;
// 회원가입
import service.UserService;

public class UserController {

	@Controller
	public class UserControlle {
		@Autowired
		private UserService userService;

		@GetMapping("/myPage")
		public String myPage() {
			return "user/myPage";
		}
		
		@RequestMapping("/login1.do")
		public String login() {
			System.out.println("d");
			return "user/login";
		}
// 회원 가입 부분	
		@PostMapping("/join")
		public String joinProc(@Valid Join join, BindingResult bindingResult, Model model) {
			if(bindingResult.hasErrors()) {
				List<FieldError> list = bindingResult.getFieldErrors();
				Map<String, String> errorMsg = new HashMap<>();
				for(int i=0;i<list.size();i++) {
					String field = list.get(i).getField(); 
					String message = list.get(i).getDefaultMessage(); 
					errorMsg.put(field, message);
				}
				model.addAttribute("errorMsg", errorMsg);
				return "user/join";
			}
			
			UserService.join(join);
			
			return "redirect:/login";
		}
		
		
		
		
		@ResponseBody
		@GetMapping("/overlapCheck")
		public int overlapCheck(String value, String valueType) {
//			value = 중복체크할 값
//			valeuType = username, nickname
			System.out.println(value);
			System.out.println(valueType);
			int count = userService.overlapCheck(value, valueType);
			
			System.out.println(count);
			return count;
		}
	}
	
}
