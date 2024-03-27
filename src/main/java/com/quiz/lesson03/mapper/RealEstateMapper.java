package com.quiz.lesson03.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.quiz.lesson03.domain.RealEstate;

@Mapper
public interface RealEstateMapper {
	public RealEstate selectRealEstateById(int id);

	public List<RealEstate> selectRealEstateListByRentPrice(int rentPrice);

	public List<RealEstate> selectRealEstateListByArea(
			@Param("area") int area, 
			@Param("price") int price);

	public int insertRealEstate(RealEstate realEstate);

	public int insertRealEstateAsField(
			@Param("realtorId") int realtorId
			,@Param("address") String address
			,@Param("area") int area
			,@Param("type") String type
			,@Param("price") int price
			,@Param("rentPrice") int rentPrice);

	public int updateRealEstateById(
			@Param("id") int id
			,@Param("type") String type
			,@Param("price") int price);

	public int deleteRealEstateById(int id);
}
