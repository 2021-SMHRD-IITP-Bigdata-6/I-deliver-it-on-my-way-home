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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.domain.Board;
import kr.smhrd.mapper.BoardMapper;

@Controller //전처리기능
public class BoardController{
	
	
	@RequestMapping("/") // <- http://127.0.0.1:8081/myapp
	public String main() {
		return "basic";
	}
	
}
