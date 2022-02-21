package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;

import kr.smhrd.domain.Board;

//JDBC = [ Java+SQL ] -> 향상된거 - >DB Framework(MyBatis)
//1. 생산성이 떨어진다.[개발속도가 늦다]
//2. 유지보수가 어렵다

// DBFramework(MyBatis API=http://mybatis.org)
// 1. Java SQL Mapping Framework
// 2. Java소스코드와 SQL 쿼리를 분리해서 개발.

//Mapper Interface
//1. Mapper interface + Mapper XML(SQL)
//2. Mapper interface + @(애노테이션) < 이건 매퍼.xml에 중복해서 sql문장 만들면 안된다. ,
public interface BoardMapper {

	public List<Board> selectAll();//추상메소드
	public void boardInsert(Board vo); //insert SQL~
	public Board boardContent(int idx); //select SQL~
	@Delete("delete from board where idx=#{idx}")
	public void boardDelete(int idx);//delete SQL~
	
	public void boardUpdate(Board vo);// update SQL~
}
