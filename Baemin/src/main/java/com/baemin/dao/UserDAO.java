package com.baemin.dao;

import com.baemin.dto.join;

public interface UserDAO {
	void join(join join);
	int overlapCheck(String value, String valueType);


}

