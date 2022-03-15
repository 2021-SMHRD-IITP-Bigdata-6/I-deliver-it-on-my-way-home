package com.baemin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
 
    @GetMapping("/")
    public String test(){
 
        return "home";
    }
    
    @GetMapping("/Testpage")
    public String MyPage() {
       return "user/Testpage";
    }
    
    
    @GetMapping("/Customer1")
    public String MyPage1() {
       return "user/Customer1";
    }
	

}
