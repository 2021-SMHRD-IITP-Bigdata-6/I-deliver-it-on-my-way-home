package com.baemin.inter;

import java.util.List;

import com.baemin.dto.Store;
import com.baemin.dto.StoreDetail;

public interface StoreService {
	List<Store> storeList(int category, int address);
 
	StoreDetail storeDetail(int id);
}
