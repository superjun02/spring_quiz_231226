package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.domain.RealEstate;

@RestController
@RequestMapping("/lesson03/quiz02")
public class Lesson03Quiz02RestController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	@RequestMapping("/1")
	public String quiz01() {
		RealEstate realEstate = new RealEstate();
		
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
		int rowCouunt = realEstateBO.addRealEstate(realEstate);
		
		return "입력 성공: " + rowCouunt;
	}
	
	@RequestMapping("/2")
	public String quiz02(
			@RequestParam(value = "realtorId") int realtorId) {
		int rowCount = realEstateBO.addRealEstateAsField(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		
		return "입력 성공: " + rowCount;
	}
	
	@RequestMapping("/3")
	public String quiz03(
			@RequestParam(value = "id") int id
			,@RequestParam(value = "type") String type 
			,@RequestParam(value = "price") int price) {
		int rowCount = realEstateBO.updateRealEstateById(id, type, price);
		
		return "수정 성공: " + rowCount;
	}
}	
