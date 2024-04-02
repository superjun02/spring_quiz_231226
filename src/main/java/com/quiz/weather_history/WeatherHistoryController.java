package com.quiz.weather_history;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.weather_history.bo.WeatherHistoryBO;
import com.quiz.weather_history.domain.WeatherHistory;

@RequestMapping("/weather")
@Controller
public class WeatherHistoryController {
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	@GetMapping("/history-view")
	public String historyView(Model model) {
		List<WeatherHistory> weatherHistory = new ArrayList<>();
		
		weatherHistory = weatherHistoryBO.getWeatherHistory();
		model.addAttribute("weatherHistory", weatherHistory);
		
		return "weather_history/weatherList";
	}
	
	@GetMapping("/add-weather-view")
	public String addWeatherView() {
		return "weather_history/addWeather";
	}
	
	@PostMapping("/add-weather")
	public String addWeather(
			@RequestParam(value="date") String dateStr,
			@RequestParam(value="weather") String weather,
			@RequestParam(value="temperatures") double temperatures,
			@RequestParam(value="precipitation") double precipitation,
			@RequestParam(value="microDust") String microDust,
			@RequestParam(value="windSpeed") double windSpeed) throws ParseException {
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(dateStr);
		
		WeatherHistory weatherHistory = new WeatherHistory();
		
		weatherHistory.setDate(date);
		weatherHistory.setWeather(weather);
		weatherHistory.setTemperatures(temperatures);
		weatherHistory.setPrecipitation(precipitation);
		weatherHistory.setMicroDust(microDust);
		weatherHistory.setWindSpeed(windSpeed);
		
		weatherHistoryBO.addWeatherHistory(weatherHistory);
		
		return "redirect:/weather/history-view";
	}
	
		
}
