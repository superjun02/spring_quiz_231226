package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;

@RestController
@RequestMapping("/lesson03/quiz03")
public class Lesson03Quiz03RestController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	@RequestMapping("/1")
	public String quiz03(
			@RequestParam(value = "id") int id
			,@RequestParam(value = "type") String type 
			,@RequestParam(value = "price") int price) {
		int rowCount = realEstateBO.updateRealEstateById(id, type, price);
		
		return "수정 성공: " + rowCount;
	}
}
