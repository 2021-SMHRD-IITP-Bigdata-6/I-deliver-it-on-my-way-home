package com.baemin.inter;

import java.util.List;
import java.util.Map;

import com.baemin.dto.Food;
import com.baemin.dto.FoodOption;
import com.baemin.dto.Store;

public interface StoreDAO {
	 
	List<Store> storeList(Map<String, Object> map);
 
	Store storeDetail(int storeId);

	List<Food> foodList(int storeId);
	
	List<FoodOption> foodOption(int foodId);
}
