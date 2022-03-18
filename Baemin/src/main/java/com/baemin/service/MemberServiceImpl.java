package com.baemin.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baemin.dao.MemberDAO;
import com.baemin.dto.User;

@Service // service bean으로 등록
public class MemberServiceImpl implements MemberService {

@Autowired
private MemberDAO memberDao;
@Override
public String loginCheck(User user, HttpSession session) {
String mem_name = memberDao.loginCheck(user);
 if (mem_name != null) { // 세션 변수 저장
  session.setAttribute("mem_id", user.getMem_id());
  session.setAttribute("mem_name", mem_name);
}
 return mem_name; 
}

@Override
public void logout(HttpSession session) {
 session.invalidate(); // 세션 초기화
 }
}