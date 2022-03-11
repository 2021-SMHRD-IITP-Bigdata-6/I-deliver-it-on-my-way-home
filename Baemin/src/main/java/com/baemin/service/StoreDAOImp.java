package com.baemin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baemin.dto.Food;
import com.baemin.dto.Store;
import com.baemin.inter.StoreDAO;

@Repository
public class StoreDAOImp implements StoreDAO {
 
	@Autowired
	private SqlSession sql;
	
	@Override
	public List<Store> storeList(Map<String, Object> map) {
		return sql.selectList("store.storeList", map);
	}
 
	@Override
	public Store storeDetail(int storeId) {
		return sql.selectOne("store.storeDetail", storeId);
	}
	
	@Override
	public List<Food> foodList(int id) {
		return sql.selectList("store.foodList", id);
	}

}
