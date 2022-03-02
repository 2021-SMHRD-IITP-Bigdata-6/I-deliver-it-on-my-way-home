package com.baemin.inter;

import java.util.List;

import com.baemin.DAO.Store;

public interface StoreService {
	List<Store> storeList(int category, int address);
}
