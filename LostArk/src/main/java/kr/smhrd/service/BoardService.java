package kr.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.smhrd.domain.Board;
import kr.smhrd.mapper.BoardMapper;

public class BoardService {

	 @Autowired
	 BoardMapper mapper;
	 
	 public List<Board> selectAll(){
		 List<Board> list = mapper.selectAll();
				 return list;
	 }
	 public void boardInsert(Board vo) {
		 mapper.boardInsert(vo);
	 }
	 public Board boardContent(int idx) {
		Board vo = mapper.boardContent(idx);
		return vo;
	 }
	 public void boardDelete(int idx) {
		 mapper.boardDelete(idx);
	 }
	 public void boardUpdate(Board vo) {
		 mapper.boardUpdate(vo);
	 }
	 public void boardContentUpdate(Board vo) {
		 mapper.boardContentUpdate(vo);
		
	 }
	 public void boardUpdateTW(Board vo) {
		 mapper.boardUpdateTW(vo);
	 }
}
