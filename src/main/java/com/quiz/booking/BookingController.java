package com.quiz.booking;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.booking.bo.BookingBO;
import com.quiz.booking.domain.Booking;

@RequestMapping("/booking")
@Controller
public class BookingController {
	@Autowired
	private BookingBO bookingBO;
	@GetMapping("/check-booking-view")
	public String checkBookingView() {
		return "booking/checkBooking";
	}
	
	@GetMapping("/booking-list-view")
	public String bookingListView(Model model) {
		
		List<Booking> bookingList = new ArrayList<>();
		
		bookingList = bookingBO.getBookingList();
		
		model.addAttribute("bookingList", bookingList);
		return "booking/bookingList";
	}
	
	@GetMapping("/make-booking-view")
	public String makeBookingView() {
		return "booking/makeBooking";
	}
	
	@ResponseBody
	@PostMapping("/delete-booking")
	public Map<String, Object> deleteBooking(
			@RequestParam(value="id") String id) {
		Map<String, Object> result = new HashMap<>();
		
		int deleteId = Integer.valueOf(id);
		
		bookingBO.deleteBookingById(deleteId);
		
		result.put("code", 200); // 성공
		result.put("is_delete", true);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/make-booking")
	public Map<String, Object> makeBooking(
			@RequestParam(value="name") String name, 
			@RequestParam(value="headcount") int headcount,
			@RequestParam(value="day") String day,
			@RequestParam(value="date") String dateStr,
			@RequestParam(value="phoneNumber") String phoneNumber) throws ParseException {
		Map<String, Object> result = new HashMap<>();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(dateStr);
		
		bookingBO.addBooking(name, headcount, day, date, phoneNumber);
		
		result.put("code", 200); // 성공
		result.put("is_make", true);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/check-booking")
	public Map<String, Object> checkBooing(
			@RequestParam(value="name") String name, 
			@RequestParam(value="phoneNumber") String phoneNumber) {
		Map<String, Object> result = new HashMap<>();
		
		Booking reserveInfo = bookingBO.getBookingByNameAndPhoneNumber(name, phoneNumber);
		
		result.put("code", 200); // 성공
		result.put("reserveInfo", reserveInfo);
		
		return result;
	}
	
	
}
