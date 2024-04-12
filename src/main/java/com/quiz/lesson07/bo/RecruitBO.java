package com.quiz.lesson07.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson07.entity.RecruitEntity;
import com.quiz.lesson07.repository.RecruitRepository;

@Service
public class RecruitBO {
	@Autowired
	private RecruitRepository recruitRepository;
	
	public RecruitEntity findById(int id) {
		return recruitRepository.findById(id);
	}

	public List<RecruitEntity> findByCompanyId(int companyId) {
		return recruitRepository.findByCompanyId(companyId);
	}

	public List<RecruitEntity> findByPositionAndType(String position, String type) {
		return recruitRepository.findByPositionAndType(position, type);
	}

	public List<RecruitEntity> findByTypeOrSalaryGreaterThanEqual(String type, int salary) {
		return recruitRepository.findByTypeOrSalaryGreaterThanEqual(type, salary);
	}

	public List<RecruitEntity> findTop3ByTypeOrderBySalaryDesc(String type) {
		return recruitRepository.findTop3ByTypeOrderBySalaryDesc(type);
	}

	public List<RecruitEntity> findByRegionAndSalaryBetween(String region, int startNum, int endNum) {
		return recruitRepository.findByRegionAndSalaryBetween(region, startNum, endNum);
	}

	
}
