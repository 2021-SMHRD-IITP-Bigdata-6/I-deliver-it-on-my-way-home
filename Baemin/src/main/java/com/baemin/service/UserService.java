package com.baemin.service;

import com.baemin.dto.join;

public interface UserService {
	void join(join join);
	 
	int overlapCheck(String value, String valueType);
}


