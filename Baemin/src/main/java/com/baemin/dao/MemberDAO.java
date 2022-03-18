package com.baemin.dao;

import com.baemin.dto.User;

public interface MemberDAO {
   public String loginCheck(User user);
}