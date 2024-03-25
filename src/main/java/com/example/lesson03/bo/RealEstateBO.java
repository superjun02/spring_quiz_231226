package com.example.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.lesson03.domain.RealEstate;
import com.example.lesson03.mapper.RealEstateMapper;

@Service
public class RealEstateBO {
	@Autowired
	private RealEstateMapper realEstateMapper;
	
	public RealEstate getRealEstateById(int id) {
		return realEstateMapper.selectRealEstateById(id);
	}

	public List<RealEstate> getRealEstateListByRentPrice(int rentPrice) {
		return realEstateMapper.selectRealEstateListByRentPrice(rentPrice);
	}

	public List<RealEstate> getRealEstateListByArea(int area, int price) {
		return realEstateMapper.selectRealEstateListByArea(area, price);
	}
}
