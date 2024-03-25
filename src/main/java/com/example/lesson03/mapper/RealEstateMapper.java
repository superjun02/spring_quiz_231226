package com.example.lesson03.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.lesson03.domain.RealEstate;

@Mapper
public interface RealEstateMapper {
	public RealEstate selectRealEstateById(int id);

	public List<RealEstate> selectRealEstateListByRentPrice(int rentPrice);

	public List<RealEstate> selectRealEstateListByArea(
			@Param("area") int area, 
			@Param("price") int price);
}
