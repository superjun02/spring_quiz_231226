package com.quiz.lesson07;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson07.bo.RecruitBO;
import com.quiz.lesson07.entity.RecruitEntity;

@RequestMapping("/lesson07/quiz02")
@RestController
public class Lesson07Quiz02RestController {
	@Autowired
	private RecruitBO recruitBO;
	
	@GetMapping("/1")
	public RecruitEntity q1() {
		return recruitBO.findById(8);
	}
	
	@GetMapping("/2")
	public List<RecruitEntity> q2() {
		return recruitBO.findByCompanyId(1);
	}
	
	@GetMapping("/3")
	public List<RecruitEntity> q3() {
		return recruitBO.findByPositionAndType("웹 back-end 개발자", "정규직");
	}
	
	@GetMapping("/4")
	public List<RecruitEntity> q4() {
		return recruitBO.findByTypeOrSalaryGreaterThanEqual("정규직", 9000);
	}
	
	@GetMapping("/5")
	public List<RecruitEntity> q5() {
		return recruitBO.findTop3ByTypeOrderBySalaryDesc("계약직");
	}
	
	@GetMapping("/6")
	public List<RecruitEntity> q6() {
		return recruitBO.findByRegionAndSalaryBetween("성남시 분당구", 7000, 8500);
	}
}
