package com.my.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

public class UserController {

	@Controller
	public class UserControlle {
		
		@GetMapping("/myPage")
		public String myPage() {
			return "user/myPage";
		}
		
		@GetMapping("/login")
		public String login() {
			return "user/login";
		}
	}
	
}
