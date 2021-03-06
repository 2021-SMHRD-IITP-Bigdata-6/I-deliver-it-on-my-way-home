package com.baemin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baemin.dto.Food;
import com.baemin.dto.FoodOption;
import com.baemin.dto.Store;
import com.baemin.dto.StoreDetail;
import com.baemin.inter.StoreDAO;
import com.baemin.inter.StoreService;

@Service
public class StoreServiceImp implements StoreService {

	@Autowired
	private StoreDAO storeDAO;

	@Override
	public List<Store> storeList(int category, int address) {
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("address1", address);

		return storeDAO.storeList(map);
	}

	@Override
	public StoreDetail storeDetail(int storeId) {
		Store storeInfo = storeDAO.storeDetail(storeId);

		List<Food> foodList = storeDAO.foodList(storeId);
//		List<Review> reviewList = storeDAO.reviewList(storeId);

		return new StoreDetail(storeInfo, foodList);
	}

	@Override
	public List<FoodOption> foodOption(int foodId) {
		return storeDAO.foodOption(foodId);
	}

}
