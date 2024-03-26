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

	public int addRealEstate(RealEstate realEstate) {
		return realEstateMapper.insertRealEstate(realEstate);
	}

	public int addRealEstateAsField(int realtorId, String address, int area, String type, int price, int rentPrice) {
		return realEstateMapper.insertRealEstateAsField(realtorId, address, area, type, price, rentPrice);
	}

	public int updateRealEstateById(int id, String type, int price) {
		return realEstateMapper.updateRealEstateById(id, type, price);
	}
}
