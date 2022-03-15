package com.baemin.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baemin.dto.FoodOption;
import com.baemin.dto.Store;
import com.baemin.dto.StoreDetail;
import com.baemin.inter.StoreService;

@Controller
public class StoreController {
 
	@Autowired
	private StoreService storeService;
	
	@GetMapping("/store/{category}/{address1}")
	public String store(@PathVariable int category, @PathVariable int address1, Model model) {
		
		List<Store> storeList = storeService.storeList(category, address1 / 100);
		model.addAttribute("storeList", storeList);
		return "store/store";
	}
	@ResponseBody
	@PostMapping("/addressModify")
	public void addressModify(String address1, String address2, HttpServletResponse response, HttpSession session)
			throws UnsupportedEncodingException {
//		address1 = 우편번호
//		address2 = 주소
 
		System.out.println("address1 =" + address1);
		System.out.println("address2 =" + address2);
 
		String address = "{\"address1\" : \"" + address1 + "\",\"address2\" : \"" + address2 + "\"}"; 
		
		// 쿠키에 JSON으로 저장
		Cookie cookie = new Cookie("BMaddress", URLEncoder.encode(address, "UTF-8"));
 
		int age = 60 * 60 * 24 * 7; // 일주일
		cookie.setMaxAge(age);
 
		response.addCookie(cookie);
 
		// 세션에 map으로 저장
		Map<String, String> addMap = new HashMap<>();
		addMap.put("address1", address1);
		addMap.put("address2", address2);
		session.setMaxInactiveInterval(3600 * 3); // 3시간
		session.setAttribute("BMaddress", addMap);
	}
	@GetMapping("/store/detail/{id}")
	public String storeDetail(@PathVariable int id, Model model) {
 
		StoreDetail storeDetail = storeService.storeDetail(id);
 
		model.addAttribute("store", storeDetail);
 
		return "store/detail";
	}
	// 메뉴 클릭시 음식 추가옵션 가져요기
	@ResponseBody
	@GetMapping("/foodOption")
	public List<FoodOption> menuDetail(int foodId) {
		List<FoodOption> foodOption = storeService.foodOption(foodId);
		return foodOption;
	}


}
