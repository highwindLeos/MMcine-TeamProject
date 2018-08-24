package com.tj.mmcine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.mmcine.model.Movie;
import com.tj.mmcine.model.Notice;
import com.tj.mmcine.service.IMovieService;
import com.tj.mmcine.service.INoticeService;

@Controller
public class MainController {
	
	@Autowired
	private IMovieService movieService;
	@Autowired
	private INoticeService noticeService;
	
	@RequestMapping(value ="main", method=RequestMethod.GET)
	public String movieListPage(Movie movie, Notice notice, Model model) {
		
		model.addAttribute("movieList", movieService.movieListNewFour(movie));
		model.addAttribute("noticeNew", noticeService.listNoticeNewFive(notice));
		
		return "main/main";
	}
	@RequestMapping(value="main", method=RequestMethod.POST)
	public String mainPost(Movie movie, Model model) {
		
		model.addAttribute("movieList", movieService.movieListNewFour(movie));
		
		return "main/main";
	}
	
}
