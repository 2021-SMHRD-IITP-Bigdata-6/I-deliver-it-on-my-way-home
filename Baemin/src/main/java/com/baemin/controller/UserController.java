
package com.baemin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.baemin.dto.User;
import com.baemin.dto.join;
import com.baemin.service.MemberService;
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
   @Autowired
   private MemberService memberService;
   
  @RequestMapping("/login")
   public String login() {
    return "user/login";
  }

  @RequestMapping("/login_check")
  public ModelAndView login_check(@ModelAttribute User user, HttpSession session) {
   String mem_name = memberService.loginCheck(user, session);  
   
   ModelAndView mav = new ModelAndView();
    if (mem_name != null) { // 로그인 성공 시
     mav.setViewName("user/Mypage"); // 뷰의 이름
     } else { // 로그인 실패 시
       mav.setViewName("user/login"); 
       mav.addObject("message", "error");
       System.out.println("실패");
       }
       return mav;
     }
     
  

@RequestMapping("logout.do")
  public ModelAndView logout(HttpSession session, ModelAndView mav) {
  memberService.logout(session); 
   mav.setViewName("user/login"); 
   mav.addObject("message", "logout"); 
    return mav;
    }
   
}