package com.baemin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baemin.dto.Delivery;

@Repository // 현재 클래스를 dao bean으로 등록
public class DeliveryDAOImpl implements DeliveryDAO {

@Autowired
private SqlSession sqlSession; // SqlSession 의존관계 주입

@Override
public Delivery Delivery_check(Delivery vo) {
	return sqlSession.selectOne("delivery.Delivery_check",vo);
 }
@Override
public Delivery Delivery_check2(Delivery vo) {
	return sqlSession.selectOne("delivery.Delivery_check",vo);
 }
@Override
public Delivery Delivery_check3(Delivery vo) {
	return sqlSession.selectOne("delivery.Delivery_check",vo);
 }
}