package com.spring_boot.MiniProject;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.spring_boot.MiniProject"})
@MapperScan(basePackages = {"com.spring_boot.MiniProject"})
public class SpringBootMiniProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootMiniProjectApplication.class, args);
	}

}
