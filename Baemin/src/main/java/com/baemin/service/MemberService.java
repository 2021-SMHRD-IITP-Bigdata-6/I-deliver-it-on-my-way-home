package com.baemin.service;

import javax.servlet.http.HttpSession;

import com.baemin.dto.User;

public interface MemberService {
    public String loginCheck(User user, HttpSession session);
    public void logout(HttpSession session);
}