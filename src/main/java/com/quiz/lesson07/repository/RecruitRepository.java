package com.quiz.lesson07.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.quiz.lesson07.entity.RecruitEntity;

public interface RecruitRepository extends JpaRepository<RecruitEntity, Integer> {
	public RecruitEntity findById(int id);

	public List<RecruitEntity> findByCompanyId(int companyId);

	public List<RecruitEntity> findByPositionAndType(String position, String type);

	public List<RecruitEntity> findByTypeOrSalaryGreaterThanEqual(String type, int salary);

	public List<RecruitEntity> findTop3ByTypeOrderBySalaryDesc(String type);

	public List<RecruitEntity> findByRegionAndSalaryBetween(String region, int startNum, int endNum);

	@Query(value = "select * from `recruit` where `deadline` > :deadline and `salary` >= :startSalary and `type` = :type", nativeQuery = true)
	public List<RecruitEntity> findByDeadlineAndSalaryAndType(@Param("deadline") String deadline,
			@Param("startSalary")int startSalary,
			@Param("type") String type);
}
