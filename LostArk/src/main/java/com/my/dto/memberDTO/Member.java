package com.my.dto.memberDTO;
import lombok.*;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.Pattern;

@Getter
@Setter
@ToString

@Data
public class Member {

	 private String mem_id; // 아이디(PK)
	 private String mem_pw; // 비밀번호 
	 private String mem_name;//이름
	 private String mem_gender;//성별
	 private String mem_phone;//폰
	 private String mem_addr;//주소
	 private String mem_joindate;//가입날짜
	 private String delivery_yn;//배달여부
	 private String admin_yn;//어드민여부
	 
}
