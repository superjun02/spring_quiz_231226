package com.quiz.store;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.domain.Store;
import com.quiz.store.bo.ReviewBO;
import com.quiz.store.domain.Review;

@RequestMapping("/store")
@Controller
public class StoreController {
	@Autowired
	private StoreBO storeBO;
	@Autowired
	private ReviewBO reviewBO;
	
	@GetMapping("/store-list-view")
	public String storeListView(Model model) {
		List<Store> storeList = new ArrayList<>();
		
		storeList = storeBO.getStoreList();
		model.addAttribute("storeList", storeList);
		return "store/storeList";
	}
	
	@GetMapping("/store-review")
	public String storeReview(Model model,
			@RequestParam(value = "storeId") int storeId,
			@RequestParam(value = "storeName") String storeName) {
		List<Review> reviewList = new ArrayList<>();
		
		reviewList = reviewBO.getReviewListByStoreId(storeId);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("storeName", storeName);
		return "store/storeReviewList";
	}
}
