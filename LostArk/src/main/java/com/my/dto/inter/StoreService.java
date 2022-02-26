package com.my.dto.inter;

import java.util.List;

import com.my.dto.StoreDAO.Store;

public interface StoreService {
	List<Store> storeList(int category, int address);
	}
