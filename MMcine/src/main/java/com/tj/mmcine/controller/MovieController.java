package com.tj.mmcine.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mmcine.dao.MovieDao;
import com.tj.mmcine.model.Customer;
import com.tj.mmcine.model.Movie;
import com.tj.mmcine.service.IMovieService;
import com.tj.mmcine.service.Paging;

@Controller
public class MovieController {
	
	@Autowired
	private IMovieService movieService;
	
	@RequestMapping(value="movieListPage", method=RequestMethod.GET)
	public String movieListPage(Movie movie, String pageNum, Model model, HttpSession session) {
		
		int cntMovie = movieService.cntMovie();
		Paging paging = new Paging(cntMovie, pageNum, 15, 5); // 이 서비스는 pageSize = 15, blockSize는 5로 함
		
		movie.setStartRow(paging.getStartRow());
		movie.setEndRow(paging.getEndRow());
		
		model.addAttribute("movieList", movieService.movieListPaging(movie));
		model.addAttribute("paging", paging);
		
		return "movie/movieList";
	}// 박스오피스
	@RequestMapping(value="movieListPage", method=RequestMethod.POST)
	public String movieListPagePOST(Movie movie, String pageNum, Model model, HttpSession session) {
		
		int cntMovie = movieService.cntMovie();
		Paging paging = new Paging(cntMovie, pageNum, 15, 5); // 이 서비스는 pageSize = 15, blockSize는 5로 함
		
		movie.setStartRow(paging.getStartRow());
		movie.setEndRow(paging.getEndRow());
		
		model.addAttribute("movieList", movieService.movieListPaging(movie));
		model.addAttribute("paging", paging);
		
		return "movie/movieList";
	}// 박스오피스 
	
	
	@RequestMapping(value="movieOpen", method=RequestMethod.GET)
	public String movieOpen(Movie movie, String pageNum, Model model, HttpSession session) {
		
		int cntMovie = movieService.cntMovie();
		Paging paging = new Paging(cntMovie, pageNum, 15, 5); // 이 서비스는 pageSize = 15, blockSize는 5로 함
		
		movie.setStartRow(paging.getStartRow());
		movie.setEndRow(paging.getEndRow());
		
		model.addAttribute("movieList", movieService.movieOpen(movie));
		model.addAttribute("paging", paging);
		
		return "movie/movieList";
	} // 개봉일 순 정렬
	
	@RequestMapping(value="movieExpected", method=RequestMethod.GET)
	public String movieExpected(Movie movie, String pageNum, Model model, HttpSession session) {
		
		int cntMovie = movieService.cntMovie();
		Paging paging = new Paging(cntMovie, pageNum, 15, 5); // 이 서비스는 pageSize = 15, blockSize는 5로 함
		
		movie.setStartRow(paging.getStartRow());
		movie.setEndRow(paging.getEndRow());
		
		model.addAttribute("movieList", movieService.movieExpected(movie));
		model.addAttribute("paging", paging);
		
		return "movie/movieList";
	} // 개봉예정작 
	
	@RequestMapping(value="detailMovie", method=RequestMethod.POST)
	public String detailMovie(Movie movie, String movieCode, String cusId, String pageNum, Model model, HttpSession session) {

		int cntComant = movieService.cntReview(movieCode);
		Paging paging = new Paging(cntComant, pageNum, 10, 5);
		
		movie.setStartRow(paging.getStartRow());
		movie.setEndRow(paging.getEndRow());
		
		movie.setCusId(cusId);
		movie.setMovieCode(movieCode);
		
		model.addAttribute("voteCnt", movieService.movieVoteCnt(movieCode));
		model.addAttribute("movieDetail", movieService.getMovieDetail(movieCode));
		model.addAttribute("movieComant", movieService.getMovieComant(movie));
		model.addAttribute("recommCnt", movieService.getRecommCnt(movie));
		
		int recomm = movieService.getMovieRecomm(movie);
		if(recomm != 0) {			
			model.addAttribute("movieRecomm", movieService.getMovieRecomm(movie));
		} else {
			model.addAttribute("movieRecomm", 0);
		}
		
		model.addAttribute("paging", paging);
		
		return "movie/movieDetail";
	} // Ajax request 영화 상세보기
	@RequestMapping(value="detailMovieComant")
	public String detailMovieComant(Movie movie, String movieCode, String pageNum, Model model) {
		
		int cntComant = movieService.cntReview(movieCode);
		Paging paging = new Paging(cntComant, pageNum, 10, 5);
		
		movie.setStartRow(paging.getStartRow());
		movie.setEndRow(paging.getEndRow());
		
		model.addAttribute("movieDetail", movieService.getMovieDetail(movieCode));
		model.addAttribute("movieComant", movieService.getMovieComant(movie));
		
		model.addAttribute("paging", paging);
		
		return "movie/detailMovieComant";
	} // Ajax request
	
	@RequestMapping(value="writeMovieForm")
	public String writeMovieForm() {
		
		return "movie/movieWriteForm";
	}
	
	@RequestMapping(value="writeReview", method=RequestMethod.POST)
	public String writeMovieGradeAndComant(Movie movie, HttpSession session, Model model) {
		
		movie.setmRecomm(0); // 기본 비추천
		Customer customer = (Customer) session.getAttribute("SessionCustomer");
		movie.setCusId(customer.getCusId()); //로그인한 사용자의 세션의 아이디로 입력
		
		int gradeResult = MovieDao.FAIL;
		
		if (movie.getmScore() != 0) {	// 평점이 0	이 아니라면 입력		
			gradeResult = movieService.writeMovieGrade(movie);
		} 
		
		int comantResult = movieService.writeMovieComant(movie);
		
		if (gradeResult == MovieDao.SUCCESS || comantResult == MovieDao.SUCCESS) {
			model.addAttribute("writeReviewResult", "영화의 대한 코멘트 및 평점이 등록되었습니다.");
		}
		
		return "forward:movieListPage.do";
	} // 평가와 코멘트 쓰기.
	
	@RequestMapping(value="writeRecomm")
	public String writeRecomm(Movie movie, Model model) {
		
		int recommResult = movieService.writeRecomm(movie);
		if (recommResult == MovieDao.SUCCESS) {
			model.addAttribute("writerecommResult", "보고싶어요를 했습니다.");
		}
		
		return "forward:movieListPage.do";
	} // 보고 싶어요 하기
	@RequestMapping(value="updateRecomm")
	public String updateRecomm(Movie movie, Model model) {
		
		int recommResult = movieService.updateRecomm(movie);
		if (recommResult == MovieDao.SUCCESS) {
			model.addAttribute("updaterecommResult", "보고싶어요를 취소했습니다.");
		}
		
		return "forward:movieListPage.do";
	} // 보고 싶어요 취소하기
	
	@RequestMapping(value="deleteComant")
	public String deleteComant(String rCode, Model model) {
		
		int comantDeleteResult = movieService.deleteComant(rCode);
		if (comantDeleteResult == MovieDao.SUCCESS) {
			model.addAttribute("deleteComantResult", "영화 코멘트가 삭제되었습니다.");
		}
		
		return "forward:movieListPage.do";
	} // 영화 코멘트 삭제
	
	@RequestMapping(value="writeMovie")
	public String writeMovie(Movie movie,Model model, MultipartHttpServletRequest mRequest) {
		
		int writeResult = movieService.writeMovie(movie, mRequest);
		
		if (writeResult == MovieDao.SUCCESS) {
			model.addAttribute("resultMovieWrite", "영화 입력 성공");
		} 		
		
		return "forward:movieListPage.do";
	} // 영화 쓰기
	
	@RequestMapping(value="movieModifyForm")
	public String modifyMovieForm(String movieCode, Model model) {
		System.out.println(movieCode);
		model.addAttribute("movieDetail", movieService.getMovieDetail(movieCode));
		
		return "movie/movieModifyForm";
	} // 영화 수정 페이지 가기
	@RequestMapping(value="modifyMovie")
	public String modifyMovie(Movie movie,Model model, MultipartHttpServletRequest mRequest) {
		
		int modifyResult = movieService.modifyMovie(movie, mRequest);
		
		if (modifyResult == MovieDao.SUCCESS) {
			model.addAttribute("resultMovieModify", "영화 수정 성공");
		} 		
		
		return "forward:movieListPage.do";
	} // 영화 수정 페이지 가기
	
	@RequestMapping(value="deleteMovie")
	public String deleteMovie(Movie movie, Model model) {
		
		int deleteResult = movieService.deleteMovie(movie);
		
		if (deleteResult == MovieDao.SUCCESS) {
			model.addAttribute("resultMovieDelete", "영화 삭제 성공");
		} 		
		
		return "forward:movieListPage.do";
	}
	
}
