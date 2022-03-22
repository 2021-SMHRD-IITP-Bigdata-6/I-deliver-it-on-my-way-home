package com.baemin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.baemin.dto.Delivery;
import com.baemin.service.DeliveryService;
import com.baemin.service.UserService;

@Controller
public class DeliveryController {
 
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
    	
    	return "/user/deliveryfinish";
    }
    @GetMapping("/delivery1")
    public String delivery1(){
    	
    	return "/user/delivery1";
    }
    @GetMapping("/delivery2")
    public String delivery2(){
    	
    	return "/user/delivery2";
    }
    @GetMapping("/delivery3")
    public String delivery3(){
    	
    	return "/user/delivery3";
    }
 

}
