package com.baemin.inter;

import java.util.List;

import com.baemin.dto.FoodOption;
import com.baemin.dto.Store;
import com.baemin.dto.StoreDetail;

public interface StoreService {
	List<Store> storeList(int category, int address);
 
	StoreDetail storeDetail(int id);
	// 해당 메뉴의 옵션 가져오기
	List<FoodOption> foodOption(int foodId);

}
