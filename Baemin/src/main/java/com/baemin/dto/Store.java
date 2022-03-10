package com.baemin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Store {
	private int id;
	private int category;
	private String storename;
	private int storeaddress1;
	private String storeaddress2;
	private String storeaddress3;
	private String storephone;
	private String storeimg;
	private String storethumb;
	private int openingtime;
	private int closingtime;
	private int mindelevery;
	private int deleverytime;
	private int deleverytip;
	private String storedes;
}

