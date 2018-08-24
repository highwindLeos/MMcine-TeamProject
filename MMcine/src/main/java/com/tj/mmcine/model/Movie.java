package com.tj.mmcine.model;

import java.sql.Date;

public class Movie {
	
	private String movieCode;
	private String movieName;
	private String movieGener;
	private Date movieOpenDate;
	private int movieAccrue;
	private String movieSummary;
	private String movieImg1;
	private String movieImg2;
	private String movieImg3;
	private String movieImg4;
	private String movieImg5;
	private String movieVideo;
	//고객 테이블
	private String cusId;
	private String cusPhoto;	
	// 영화 평점
	private int mScore;
	private int mRecomm;
	//영화 코멘트 
	private int rCode;
	private String rTitle;
	private String rContent;
	private Date rRdate;
	// 페이징 변수
	private int startRow;
	private int endRow;
	
	@Override
	public String toString() {
		return "Movie [movieCode=" + movieCode + ", movieName=" + movieName + ", movieGener=" + movieGener
				+ ", movieOpenDate=" + movieOpenDate + ", movieAccrue=" + movieAccrue + ", movieSummary=" + movieSummary
				+ ", movieImg1=" + movieImg1 + ", movieImg2=" + movieImg2 + ", movieImg3=" + movieImg3 + ", movieImg4="
				+ movieImg4 + ", movieImg5=" + movieImg5 + ", movieVideo=" + movieVideo + ", cusId=" + cusId
				+ ", cusPhoto=" + cusPhoto + ", mScore=" + mScore + ", mRecomm=" + mRecomm + ", rCode=" + rCode
				+ ", rTitle=" + rTitle + ", rContent=" + rContent + ", rRdate=" + rRdate + ", startRow=" + startRow
				+ ", endRow=" + endRow + "]";
	}
	
	public String getMovieCode() {
		return movieCode;
	}
	public void setMovieCode(String movieCode) {
		this.movieCode = movieCode;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getMovieGener() {
		return movieGener;
	}
	public void setMovieGener(String movieGener) {
		this.movieGener = movieGener;
	}
	public Date getMovieOpenDate() {
		return movieOpenDate;
	}
	
	public void setMovieOpenDate(Date movieOpenDate) {
		this.movieOpenDate = movieOpenDate;
	}
	
	public int getMovieAccrue() {
		return movieAccrue;
	}
	public void setMovieAccrue(int movieAccrue) {
		this.movieAccrue = movieAccrue;
	}
	public String getMovieSummary() {
		return movieSummary;
	}
	public void setMovieSummary(String movieSummary) {
		this.movieSummary = movieSummary;
	}
	public String getMovieImg1() {
		return movieImg1;
	}
	public void setMovieImg1(String movieImg1) {
		this.movieImg1 = movieImg1;
	}
	public String getMovieImg2() {
		return movieImg2;
	}
	public void setMovieImg2(String movieImg2) {
		this.movieImg2 = movieImg2;
	}
	public String getMovieImg3() {
		return movieImg3;
	}
	public void setMovieImg3(String movieImg3) {
		this.movieImg3 = movieImg3;
	}
	public String getMovieImg4() {
		return movieImg4;
	}
	public void setMovieImg4(String movieImg4) {
		this.movieImg4 = movieImg4;
	}
	public String getMovieImg5() {
		return movieImg5;
	}
	public void setMovieImg5(String movieImg5) {
		this.movieImg5 = movieImg5;
	}
	public String getMovieVideo() {
		return movieVideo;
	}
	public void setMovieVideo(String movieVideo) {
		this.movieVideo = movieVideo;
	}

	public String getCusId() {
		return cusId;
	}

	public void setCusId(String cusId) {
		this.cusId = cusId;
	}

	public String getCusPhoto() {
		return cusPhoto;
	}

	public void setCusPhoto(String cusPhoto) {
		this.cusPhoto = cusPhoto;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrRdate() {
		return rRdate;
	}

	public void setrRdate(Date rRdate) {
		this.rRdate = rRdate;
	}

	public int getmScore() {
		return mScore;
	}
	public void setmScore(int mScore) {
		this.mScore = mScore;
	}
	public int getmRecomm() {
		return mRecomm;
	}
	public void setmRecomm(int mRecomm) {
		this.mRecomm = mRecomm;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getrCode() {
		return rCode;
	}

	public void setrCode(int rCode) {
		this.rCode = rCode;
	}
	
}
