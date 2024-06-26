package com.quiz.lesson06;

import java.util.ArrayList;
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

import com.quiz.lesson06.bo.BookmarkBO;
import com.quiz.lesson06.domain.Bookmark;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Quiz01Controller {
	@Autowired
	private BookmarkBO bookmarkBO;
	
	@GetMapping("/add-bookmark-view")
	public String addBookmarkView() {
		return "lesson06/addBookmark";
	}
	
	@ResponseBody
	@PostMapping("/add-bookmark")
	public String addBookmark(
			@RequestParam(value="name") String name,
			@RequestParam(value="url") String url) {
		
		bookmarkBO.addBookmark(name, url);
		
		return "성공";
	}
	
	@GetMapping("bookmark-list-view")
	public String bookmarkListView(Model model) {
		List<Bookmark> bookmarkList = new ArrayList<>();
		
		bookmarkList = bookmarkBO.getBookmarkList();
		
		model.addAttribute("bookmarkList", bookmarkList);
		return "lesson06/bookmarkList";
	}
	
	@ResponseBody
	@GetMapping("/is-duplication-url")
	public Map<String, Object> isDuplicationUrl(
			@RequestParam(value="url") String url) {
		// DB 조회
		boolean isDuplication = bookmarkBO.isDuplicationByUrl(url);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("is_duplication", isDuplication);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/delete-bookmark")
	public String deleteBookmark(@RequestParam(value="id") String id) {
		int deleteId = Integer.valueOf(id);
		
		bookmarkBO.deleteBookmarkById(deleteId);
		return "성공";
	}
}
