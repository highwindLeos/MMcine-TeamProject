package com.tj.mmcine.service;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mmcine.model.Movie;
public interface IMovieService {
	
	public List<Movie> movieListNewFour(Movie movie);
	
	public List<Movie> movieListPaging(Movie movie);
	
	public List<Movie> movieOpen(Movie movie);
	
	public List<Movie> movieExpected(Movie movie);
	
	public List<Movie> getMovieDetail(String movieCode);
	
	public List<Movie> getMovieComant(Movie movie);
	
	public int getRecommCnt(Movie movie);
	
	public int getMovieRecomm(Movie movie);
	
	public int writeMovieGrade(Movie movie);
	
	public int writeMovieComant(Movie movie);
	
	public int writeRecomm(Movie movie);
	
	public int writeMovie(Movie movie, MultipartHttpServletRequest mRequest);
	
	public int modifyMovie(Movie movie, MultipartHttpServletRequest mRequest);

	public int updateRecomm(Movie movie);
	
	public int movieVoteCnt(String movieVoteCnt);
	
	public int deleteMovie(Movie movie);
	
	public int deleteComant(String rCode);
	
	public int cntMovie();
	
	public int cntReview(String movieCode);
	
}
