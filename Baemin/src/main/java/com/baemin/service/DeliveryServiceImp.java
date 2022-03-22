package com.baemin.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baemin.dao.DeliveryDAO;
import com.baemin.dto.Delivery;

@Service

public class DeliveryServiceImp implements DeliveryService {
	@Autowired
	private DeliveryDAO deliveryDao;

	@Override
	public Delivery Delivery_check(Delivery vo) {
		return deliveryDao.Delivery_check(vo);
		
	}

	
}
 

