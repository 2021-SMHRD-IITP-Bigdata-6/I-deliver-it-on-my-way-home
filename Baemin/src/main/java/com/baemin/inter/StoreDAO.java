package com.baemin.inter;

import java.util.List;
import java.util.Map;

import com.baemin.dao.Store;

public interface StoreDAO {
	 
	List<Store> storeList(Map<String, Object> map);
 
}
