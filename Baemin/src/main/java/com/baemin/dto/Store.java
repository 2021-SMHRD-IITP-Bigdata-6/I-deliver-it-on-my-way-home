package com.baemin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Store {
	private int store_id;
	private int category;
	private String store_name;
	private int storeaddress1;
	private String store_address2;
	private String store_address3;
	private String store_phone;
	private String store_img;
	private String store_thumb;
	private int opening_time;
	private int closing_time;
	private int min_delevery;
	private int delevery_time;
	private int delevery_tip;
	private String store_des;
}

