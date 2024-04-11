package com.quiz.lesson07.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.quiz.lesson07.entity.RecruitEntity;

public interface RecruitRepository extends JpaRepository<RecruitEntity, Integer> {
	public RecruitEntity findById(int id);

	public List<RecruitEntity> findByCompanyId(int companyId);

	public List<RecruitEntity> findByPositionAndType(String position, String type);

	public List<RecruitEntity> findByTypeOrSalaryAfter(String type, int salary);

	public List<RecruitEntity> findTop3ByTypeOrderBySalaryDesc(String type);

	public List<RecruitEntity> findByRegionAndSalaryBetween(String region, int startNum, int endNum);
}
