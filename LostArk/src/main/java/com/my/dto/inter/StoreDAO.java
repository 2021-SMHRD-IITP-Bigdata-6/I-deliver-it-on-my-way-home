package com.my.dto.inter;

import java.util.List;
import java.util.Map;

import com.my.dto.StoreDAO.Store;

public interface StoreDAO {
	 
	List<Store> storeList(Map<String, Object> map);
 
}