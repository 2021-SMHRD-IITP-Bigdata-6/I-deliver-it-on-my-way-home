package com.baemin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.baemin.Baemin")
public class BaeminApplication {

	public static void main(String[] args) {
		SpringApplication.run(BaeminApplication.class, args);
	}

}
