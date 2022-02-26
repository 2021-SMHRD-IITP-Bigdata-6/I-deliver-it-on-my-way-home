package com.my.dto.memberDAO;

import com.my.dto.memberDTO.Member;

public interface UserDAO {
	void join(Member join);
	int overlapCheck(String value, String valueType);
}