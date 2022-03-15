package com.baemin.dto;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baemin.util.FoodPriceCalc;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class CartList {
	private long storeId;
	private String storeName;
	int cartTotal;
	private int deleveryTip;
	
	List<Cart> cart;
	
	
	@ResponseBody
	@PostMapping("/addCart")
	public CartList addCart(Cart cart, long storeId, String storeName, int deleveryTip, HttpSession session) {
 
		CartList cartList = (CartList) session.getAttribute("cartList");
		
		int totalPrice = FoodPriceCalc.foodPriceCalc(cart);
		
		System.out.println("카트 가격 계산 = " + totalPrice);
		
		if(cartList == null) {
			List<Cart> newCart = new ArrayList<>();
			cart.setTotalPrice(totalPrice);
			newCart.add(cart);
			cartList = new CartList(storeId, storeName, totalPrice, deleveryTip, newCart);
		} else {
			List<Cart> prevCart = cartList.getCart();
			int prevCartTotal = cartList.getCartTotal();
			cartList.setCartTotal(prevCartTotal + totalPrice);
		
			if(prevCart.contains(cart)) {
				int cartIndex = prevCart.indexOf(cart);
				int amount = cart.getAmount();
				
				Cart newCart = prevCart.get(cartIndex);
				int newAmount = newCart.getAmount() + amount;
				int newTotal = newCart.getTotalPrice() + totalPrice;
				
				newCart.setAmount(newAmount);
				newCart.setTotalPrice(newTotal);
				prevCart.set(cartIndex, newCart);
			} else {
				cart.setTotalPrice(totalPrice);
				prevCart.add(cart);
			}
		}
		
		session.setAttribute("cartList", cartList);
        
        System.out.println("cartList = " + cartList);
 
		return cartList;
	}
	@ResponseBody
	@GetMapping("/cartList")
	public CartList cartList(HttpSession session) {
		CartList cartList = (CartList) session.getAttribute("cartList");
		if (cartList != null) {
			return cartList;
		}
		return null;
	}

}
