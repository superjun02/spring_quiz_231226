package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.domain.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {
	@Autowired
	private RealtorBO realtorBO;
	
	@RequestMapping("/add-realtor-view")
	public String addRealtorView() {
		return "lesson04/addRealtor";
	}
	
	@RequestMapping("/add-realtor")
	public String addRealtor(@ModelAttribute Realtor realtor, Model model) {
		
		// DB INSERT 
		realtorBO.addRealtor(realtor);
		
		//GET ID
		int id = realtor.getId();
		
		// DB SELECT BY ID
		Realtor result = new Realtor();
		result = realtorBO.getRealtorById(id);
		
		model.addAttribute("data", result);
		return "lesson04/afterAddRealtor";
	}
}
