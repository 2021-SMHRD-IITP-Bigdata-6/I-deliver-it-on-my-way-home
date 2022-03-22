package com.baemin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.baemin.dto.Delivery;
import com.baemin.service.DeliveryService;

@RestController
public class AjaxController {

   @Autowired
    private DeliveryService deliveryService;
    
    @RequestMapping("/ajaxTest")
	public Delivery Delivery_check(Delivery vo){
    	System.out.println(vo.getMem_id());
    	System.out.println(vo.getMoving_time());
		return deliveryService.Delivery_check(vo);
	}
	
}
