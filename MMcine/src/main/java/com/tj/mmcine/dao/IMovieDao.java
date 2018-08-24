package com.tj.mmcine.dao;
import java.util.List;

import com.tj.mmcine.model.Movie;
public interface IMovieDao {
		
	public List<Movie> movieListNewFour(Movie movie);
	
	public List<Movie> movieListPaging(Movie movie);
	
	public List<Movie> movieOpen(Movie movie);
	
	public List<Movie> movieExpected(Movie movie);
	
	public List<Movie> getMovieDetail(String movieCode);
	
	public List<Movie> getMovieComant(Movie movie);
	
	public int getRecommCnt(Movie movie);
	
	public int getMovieRecomm(Movie movie);
	
	public int movieVoteCnt(String movieCode);
	
	public int writeMovieGrade(Movie movie);
	
	public int writeMovieComant(Movie movie);
	
	public int writeRecomm(Movie movie);
	
	public int writeMovie(Movie movie);
	
	public int updateRecomm(Movie movie);

	public int modifyMovie(Movie movie);
	
	public int deleteMovie(Movie movie);
	
	public int deleteComant(String rCode);
	
	public int cntMovie();
	
	public int cntReview(String movieCode);
}
