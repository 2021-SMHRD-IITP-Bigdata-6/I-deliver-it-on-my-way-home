package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.dto.memberDAO.UserDAO;
import com.my.dto.memberDTO.Member;

@Service
public class UserServiceImp implements UserService {
 
	@Autowired
	private UserDAO userDAO;
	
	public void join(Member join) {
		userDAO.join(join);
	}
	
 
	@Override
	public int overlapCheck(String value, String valueType) {
		return userDAO.overlapCheck(value, valueType);
	}
 
}
