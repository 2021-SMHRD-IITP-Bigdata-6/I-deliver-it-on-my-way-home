package com.my.dto.memberDAO;

import com.my.dto.memberDTO.Join;

public interface UserDAO {
	void join(Join join);
	int overlapCheck(String value, String valueType);
}