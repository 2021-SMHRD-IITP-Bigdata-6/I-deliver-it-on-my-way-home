
package com.baemin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.baemin.dto.join;
import com.baemin.service.UserService;

@Controller
@SpringBootApplication
public class UserController {
	
	
   @Autowired
   private UserService userService;
   
   @GetMapping("/Mypage")
   public String MyPage() {
      return "user/Mypage";
   }
   
   @GetMapping("/login")
   public String login() {
      return "user/login";
   }
   
   @GetMapping("/join2")
   public String join() {
      return "user/join2";
   }
  /* @RequestMapping(value="Join", method= {RequestMethod.GET, RequestMethod.POST})
	public String joinProc(Join join) {
		
		System.out.println(join);
		
		return "user/Join";
	}*/
//   @RequestMapping(value="/Join")
//   public String Join() {
//      return "user/Join";
//   }
   // 윤서가추가함.
   // 정곤 추가부분 RequestMapping
//   @RequestMapping(value="/Join", method=RequestMethod.GET)
//   public String goJoin(Join join) {
//	   return "user/Join";
//   }
   
   @RequestMapping("/join1")
	public String join(@Valid join join, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
			List<FieldError> list = bindingResult.getFieldErrors();
			Map<String, String> errorMsg = new HashMap<>();
			for(int i=0;i<list.size();i++) {
				String field = list.get(i).getField(); 
				String message = list.get(i).getDefaultMessage(); 
				errorMsg.put(field, message);
			}
			model.addAttribute("errorMsg", errorMsg);
			return "user/join2";
		}
		
		userService.join(join);
		
	
		 return "redirect:/login"; 
	}
   
   
   @ResponseBody
   @GetMapping("/overlapCheck")
   public int overlapCheck(String value, String valueType) {
//      value = 중복체크할 값
//      valeuType = username, nickname
      System.out.println(value);
      System.out.println(valueType);
      int count = userService.overlapCheck(value, valueType);
      
      System.out.println(count);
      return count;
   }

   
}