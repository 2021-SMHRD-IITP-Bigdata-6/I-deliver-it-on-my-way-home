package kr.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //lombok API - >이클립스에게 setter, getter 만들어주라는 요청
//@AllArgsConstructor
//@NoArgsConstructor
public class Board {
	// property(프로퍼티)
	private int idx; // 번호
	private String title; // 제목
	private String content;// 내용
	private String writer; // 작성자
	private String indate; // 작성일
	private int count; // 조회수
	//setter, getter method를 자동으로 만들어 주는 api
	
	

	
}
