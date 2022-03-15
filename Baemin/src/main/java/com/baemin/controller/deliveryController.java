package com.baemin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class deliveryController {
 
	@Autowired
	// DeilveryService DeilveryService;


    @GetMapping("/deliveryhome")
    public String deliveryhome(){
 
        return "user/deliveryhome";
    }
	
	
    @GetMapping("/delivery")
    public String deilvery(){
 
        return "user/delivery";
    }
    
    @GetMapping("/deliverylist")
    public String deliverylist(){
 
        return "user/deliverylist";
    }
    
    @GetMapping("/deliveryfinish")
    public String deliveryfinish(){
 
        return "user/deliveryfinish";
    }
    
	
	

}
