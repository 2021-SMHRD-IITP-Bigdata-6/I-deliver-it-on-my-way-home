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
		
		@RequestMapping("/login1.do")
		public String login() {
			System.out.println("d");
			return "user/login";
		}
	}
	
}
