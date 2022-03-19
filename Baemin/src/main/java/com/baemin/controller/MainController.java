package com.baemin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
 
    @GetMapping("/")
    public String test(){
 
        return "user/login";
    }
    
    @GetMapping("/Testpage")
    public String MyPage() {
       return "user/Testpage";
    }
    
    
    @GetMapping("/Customer1")
    public String MyPage1() {
       return "user/Customer1";
    }
    
    @GetMapping("/Customer2")
    public String MyPage2() {
       return "user/Customer2";
    }
    @GetMapping("/Customer3")
    public String MyPage3() {
       return "user/Customer3";
    }
	
	

}
