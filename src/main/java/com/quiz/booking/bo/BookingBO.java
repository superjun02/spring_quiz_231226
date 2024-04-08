package com.quiz.booking.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.booking.domain.Booking;
import com.quiz.booking.mapper.BookingMapper;

@Service
public class BookingBO {
	@Autowired
	private BookingMapper bookingMapper;
	public List<Booking> getBookingList() {
		return bookingMapper.selectBookingList();
	}
	public void deleteBookingById(int deleteId) {
		bookingMapper.deleteBookingById(deleteId);
	}
	public void addBooking(String name, int headcount, String day, Date date, String phoneNumber) {
		String state = "대기중";
		bookingMapper.insertBooking(name, headcount, day, date, phoneNumber, state);
	}
	public Booking getBookingByNameAndPhoneNumber(String name, String phoneNumber) {
		
		if (bookingMapper.isBookingByNameAndPhoneNumber(name, phoneNumber)) {
			return bookingMapper.selectBookingByNameAndPhoneNumber(name, phoneNumber);
		} else {
			Booking booking = new Booking();
			return booking;
		}
		
	}
	
}
