package com.quiz.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.domain.Store;

@RequestMapping("/lesson02")
@RestController
public class Lesson02Quiz01RestController {
	
	@Autowired
	private StoreBO storeBO;
	
	// http://localhost:8080/lesson02/quiz01
	@RequestMapping("/quiz01")
	public List<Store> quiz01() {
		return storeBO.getStoreList();
	}
}
