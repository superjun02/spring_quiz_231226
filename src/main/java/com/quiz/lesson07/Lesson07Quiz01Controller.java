package com.quiz.lesson07;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson07.bo.CompanyBO;

@RequestMapping("/lesson07/quiz01")
@Controller
public class Lesson07Quiz01Controller {
	@Autowired
	private CompanyBO companyBO;
	
	@GetMapping("/save1")
	public String save1(Model model) {
		String name = "넥슨";
		String business = "컨텐츠 게임";
		String scale = "대기업";
		int headcount = 3585;
		
		model.addAttribute("data", companyBO.addCompany(name, business, scale, headcount));
		
		return "lesson07/saveData";
	}
	
	@GetMapping("/save2")
	public String save2(Model model) {
		String name = "버블팡";
		String business = "여신 금융업";
		String scale = "대기업";
		int headcount = 6834;
		
		model.addAttribute("data", companyBO.addCompany(name, business, scale, headcount));
		
		return "lesson07/saveData";
	}
}
