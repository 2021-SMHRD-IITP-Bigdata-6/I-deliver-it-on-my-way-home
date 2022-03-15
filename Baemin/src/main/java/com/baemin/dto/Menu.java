package com.baemin.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class Menu {

		private int menu_seq; // PK // UNSIG
		private int shop_seq;  // UNSIG  // 참조 t_shop
		private String menu_name;
		private int menu_price;
		private String menu_img1;  // UNSIG
		private String menu_img2;
		private String order_yn;
		private String menu_type;
}
