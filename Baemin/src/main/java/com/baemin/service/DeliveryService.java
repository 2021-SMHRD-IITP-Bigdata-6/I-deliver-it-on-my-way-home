package com.baemin.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.baemin.dto.Delivery;


@Service
public interface DeliveryService {
	public Delivery Delivery_check(Delivery vo);

}


