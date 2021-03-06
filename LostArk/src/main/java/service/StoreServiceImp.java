package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.dto.StoreDAO.Store;
import com.my.dto.inter.StoreDAO;
import com.my.dto.inter.StoreService;

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
 
}