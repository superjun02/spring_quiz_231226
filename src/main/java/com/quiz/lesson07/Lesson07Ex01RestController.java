package com.quiz.lesson07;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson07.bo.CompanyBO;
import com.quiz.lesson07.entity.CompanyEntity;

@RequestMapping("/lesson07/quiz01")
@RestController
public class Lesson07Ex01RestController {
	@Autowired
	private CompanyBO companyBO;
	
	@GetMapping("/update")
	public CompanyEntity update() {
		int id = 8;
		String scale = "중소기업";
		int headcount = 34;
		
		return companyBO.updateScaleAndHeadCountById(id, scale, headcount);
	}
	
	@GetMapping("/delete")
	public String delete() {
		companyBO.deleteCompanyById(8);
		
		return "수행 완료";
	}
}
