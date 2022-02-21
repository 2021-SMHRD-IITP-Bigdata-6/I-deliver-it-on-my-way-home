package kr.smhrd.myapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.domain.Board;
import kr.smhrd.mapper.BoardMapper;

@RestController
public class RestBoardController {
	@Autowired
	private BoardMapper Service;
	
	@RequestMapping("/boardList.do")
	public  List<Board> boardList() {
		List<Board> list=Service.selectAll();
		
		return list;
	}
	
	@RequestMapping("/boardContentUpdate.do")
	public  void boardContentUpdate(Board vo) {
		Service.boardContentUpdate(vo);
	}

	@RequestMapping("/boardInsert.do")
	public  void boardInsert(Board vo){
		Service.boardInsert(vo);
	}	
	@RequestMapping("/boardDelete.do")
	public  void boardDelete(int idx){
		Service.boardDelete(idx);
	}
	@RequestMapping("/boardUpdateTW.do")
	public  void boardUpdategTW(Board vo) {
		Service.boardUpdateTW(vo);
	}
}
