package com.baemin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.baemin.dto.Order;

@Controller
public class OrderController {

	@GetMapping
	public void orderGet(@PathVariable("mem_id") String mem_id, Order oddto, Model model) {
		
		System.out.println("mem_id : " + mem_id);
		System.out.println("orders : " + oddto.getClass());
	}
	
}
