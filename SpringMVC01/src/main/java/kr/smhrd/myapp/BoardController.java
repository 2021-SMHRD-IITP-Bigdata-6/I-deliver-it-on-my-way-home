package kr.smhrd.myapp;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.domain.Board;
import kr.smhrd.mapper.BoardMapper;

@Controller //전처리기능
public class BoardController{

	//게시판 리스트 요청을 받기   	: 	http://127.0.0.1:8081/myapp/boardList.do
	@Autowired //DI {의존성주입}  
	private BoardMapper mapper;
	
	
	//요청을 연결시켜주는 이노테이션 
	@RequestMapping("/boardList.do") // /WEB-INF/views/boardList.jsp
	public String boardList(Model model) {
	List<Board> list=mapper.selectAll();
		model.addAttribute("list", list);
		return "boardList";
	}
	@GetMapping("/boardForm.do")
	public String boardForm() {
		return "boardForm"; // /WEB_INF/views?boardForm.jsp
	}
	@PostMapping("/boardInsert.do")
	public String boardInsert(Board vo) {// title/content/writer
		// 파라메터 수집(vo, dto)
		mapper.boardInsert(vo);//등록끝
		
		return"redirect:/boardList.do";
		
	}
	
	@GetMapping("/boardContent.do/{idx}")
	public String boardContent(@PathVariable int idx,Model model) {  //?idx=2
		Board vo =  mapper.boardContent(idx);
		model.addAttribute("vo", vo); //객체바인딩
		return "boardContent"; // /WEB_INF/views?boardContent.jsp
	}
	@GetMapping("/boardDelete.do/{idx}")
	public String boardDelete(@PathVariable int idx) {
		mapper.boardDelete(idx);
		return "redirect:/boardList.do";
	}
	
	@RequestMapping(value="/boardUpdate.do/{idx}",method = RequestMethod.GET)
	public String boardupdate(@PathVariable int idx,Model model) {  
		Board vo =  mapper.boardContent(idx);
		model.addAttribute("vo", vo); //객체바인딩
		return "boardupdate"; // /boardUpdate.jsp
}
	
	@RequestMapping(value="/boardUpdate.do",method = RequestMethod.POST)
	public String boardupdatePost(Board vo) {  
		mapper.boardUpdate(vo);
		return "redirect:/boardList.do"; // /boardUpdate.jsp
}
}
