package com.tj.mmcine.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mmcine.model.Movie;

@Repository
public class MovieDao implements IMovieDao {
	
	public static final int SUCCESS = 1; // 성공값
	public static final int FAIL = 0; // 실패값
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List<Movie> movieListNewFour(Movie movie) {
		return sessionTemplate.selectList("movieListNewFour", movie);
	}

	@Override
	public List<Movie> movieListPaging(Movie movie) {
		return sessionTemplate.selectList("movieListPaging", movie);
	} // 박스 오피스 [누적 관객]
	
	@Override
	public List<Movie> movieOpen(Movie movie) {
		return sessionTemplate.selectList("movieOpen", movie);
	} // 최신 개봉일
	
	@Override
	public List<Movie> movieExpected(Movie movie) {
		return sessionTemplate.selectList("movieExpected", movie);
	} // 상영 예정
	
	@Override
	public List<Movie> getMovieDetail(String movieCode) {
		return sessionTemplate.selectList("getMovieDetail", movieCode);
	} // 상세보기
	
	@Override
	public List<Movie> getMovieComant(Movie movie) {
		return sessionTemplate.selectList("getMovieComant", movie);
	} // 상세보기 코멘트
	
	@Override
	public int writeMovieGrade(Movie movie) {
		return sessionTemplate.insert("writeMovieGrade", movie);
	} // 영화 평가 쓰기

	@Override
	public int writeMovieComant(Movie movie) {
		return sessionTemplate.insert("writeMovieComant", movie);
	} // 영화 코멘트 쓰기
	
	@Override
	public int writeMovie(Movie movie) {
		return sessionTemplate.insert("writeMovie", movie);
	} //영화 쓰기
	
	@Override
	public int modifyMovie(Movie movie) {
		return sessionTemplate.update("modifyMovie", movie);
	} //영화 수정
	
	@Override
	public int deleteMovie(Movie movie) {
		return sessionTemplate.delete("deleteMovie", movie);
	} //영화 삭제
	
	@Override
	public int deleteComant(String rCode) {
		return sessionTemplate.delete("deleteComant", rCode);
	}// 평가글 삭제
	
	@Override
	public int cntMovie() {
		return sessionTemplate.selectOne("cntMovie");
	} //영화 등록수 구하기
	
	@Override
	public int cntReview(String movieCode) {
		return sessionTemplate.selectOne("cntReview", movieCode);
	} //영화 등록수 구하기

	@Override
	public int movieVoteCnt(String movieCode) {
		return sessionTemplate.selectOne("movieVoteCnt", movieCode);
	} // 특정 영화 투표된 수 구하기

	@Override
	public int getMovieRecomm(Movie movie) {
		return sessionTemplate.selectOne("getMovieRecomm", movie);
	} //영화 추천 여부확인

	@Override
	public int getRecommCnt(Movie movie) {
		return sessionTemplate.selectOne("getRecommCnt", movie);
	} // 영화 추천수 구하기

	@Override
	public int writeRecomm(Movie movie) {
		return sessionTemplate.insert("writeRecomm", movie);
	}

	@Override
	public int updateRecomm(Movie movie) {
		return sessionTemplate.update("updateRecomm", movie);
	}
	
}
