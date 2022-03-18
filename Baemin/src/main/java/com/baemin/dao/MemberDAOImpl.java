package com.baemin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baemin.dto.User;

@Repository // 현재 클래스를 dao bean으로 등록
public class MemberDAOImpl implements MemberDAO {

@Autowired
private SqlSession sqlSession; // SqlSession 의존관계 주입

@Override
public String loginCheck(User user) {
return sqlSession.selectOne("member.login_check", user);
 }
}