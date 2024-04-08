package com.quiz.booking.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.quiz.booking.domain.Booking;

@Mapper
public interface BookingMapper {

	public List<Booking> selectBookingList();

	public void deleteBookingById(int deleteId);

	public void insertBooking(
			@Param("name") String name,
			@Param("headcount") int headcount,
			@Param("day") String day,
			@Param("date") Date date,
			@Param("phoneNumber") String phoneNumber,
			@Param("state") String state);

	public boolean isBookingByNameAndPhoneNumber(
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber);

	public Booking selectBookingByNameAndPhoneNumber(
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber);
}
