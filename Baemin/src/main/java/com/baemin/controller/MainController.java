package com.baemin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
 
    @GetMapping("/")
    public String test(){
 
        return "user/login";
    }
    
 
    
    @GetMapping("/Customer1")
    public String MyPage1() {
       return "user/Customer1";
    }
    
   
    @GetMapping("/Customer4")
    public String MyPage4() {
       return "user/Customer4";
    }
    @GetMapping("/memo")
    public String MyPage5() {
       return "user/memo";
    }
 
    @GetMapping("/home")
    public String home() {
       return "/home";
    }

}
