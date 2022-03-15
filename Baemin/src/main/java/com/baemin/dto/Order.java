package com.baemin.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Order {

	 
		private int order_seq; // PK / UNSIG
		private String order_code;
		private String order_date;
		private Date mem_id;
		private int shop_seq;  // UNSIG
		private int total_amount;
		private int discount_amount;
		private int pay_amount;
		private String pay_method;
		private String pay_done;
		private int delivery_seq; // UNSIG
		private String rider_id; // NULL
	}
