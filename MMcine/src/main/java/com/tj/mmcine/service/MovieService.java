package com.tj.mmcine.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mmcine.dao.IMovieDao;
import com.tj.mmcine.model.Movie;

@Service
public class MovieService implements IMovieService {

	@Autowired
	private IMovieDao movieDao;
	private String savePath = "C:/Users/Leodays/Desktop/Dev/webstudy/MMcine/MMcine/src/main/webapp/movieImg/";

	@Override
	public List<Movie> movieListNewFour(Movie movie) {
		return movieDao.movieListNewFour(movie);
	}
	
	@Override
	public List<Movie> movieListPaging(Movie movie) {
		return movieDao.movieListPaging(movie);
	}
	
	@Override
	public List<Movie> movieOpen(Movie movie) {
		return movieDao.movieOpen(movie);
	}

	@Override
	public List<Movie> movieExpected(Movie movie) {
		return movieDao.movieExpected(movie);
	}

	@Override
	public List<Movie> getMovieDetail(String movieCode) {
		return movieDao.getMovieDetail(movieCode);
	}
	
	@Override
	public List<Movie> getMovieComant(Movie movie) {
		return movieDao.getMovieComant(movie);
	}
	
	@Override
	public int writeMovieGrade(Movie movie) {
		return movieDao.writeMovieGrade(movie);
	}

	@Override
	public int writeMovieComant(Movie movie) {
		return movieDao.writeMovieComant(movie);
	}
	
	@Override
	public int movieVoteCnt(String movieVoteCnt) {
		return movieDao.movieVoteCnt(movieVoteCnt);
	}

	@Override
	public int writeMovie(Movie movie,MultipartHttpServletRequest mRequest) {
		
		String uploadPath = mRequest.getRealPath("movieImg/");
		Iterator<String> iterator = mRequest.getFileNames();
		
		String mimg[] = new String[5]; // 이미지 5 
		int idx = 0;
		while (iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);// 실제파일 받아오기
			String originFileName = mFile.getOriginalFilename();
			mimg[idx] = originFileName;// 실제저장되는 파일 이름
			
			if (mimg[idx] != null && !mimg[idx].equals("")) {
				if (new File(uploadPath + mimg[idx]).exists() || new File(savePath + mimg[idx]).exists()) {
					mimg[idx] = System.currentTimeMillis() + "_" + mimg[idx];
				}
				try {
					
					System.out.println(idx + "번재 서버: " + uploadPath + mimg[idx]);
					System.out.println(idx + "번재 저장: " + savePath + mimg[idx]);
					mFile.transferTo(new File(uploadPath + mimg[idx]));
					int result = copy(uploadPath + mimg[idx], savePath + mimg[idx]);
					System.out.println(result == 1 ? mimg[idx] + "영화 이미지 넣음" : mimg[idx] + "영화 이미지 못 넣음");
					
				} catch (IllegalStateException e) {
					System.out.println(e.getMessage() + "예외1");
				} catch (IOException e) {
					System.out.println(e.getMessage() + "예외2");
				}
			} else {
				
			}
			idx++;
		} // while
		
		movie.setMovieCode(movie.getMovieGener());
		
		String movieSummary = movie.getMovieSummary();
		movie.setMovieSummary(movieSummary.replaceAll("\r\n", "<br>")); // 영화 설명
		
		String mImg0 =  mimg[0];
		String mImg1 =  mimg[1];
		String mImg2 =  mimg[2];
		String mImg3 =  mimg[3];
		String mImg4 =  mimg[4];
		
		movie.setMovieImg1(mImg0); // 이미지 1
		
		if (mImg1.equals("")) {
			movie.setMovieImg2("mImg02.jpg"); // 이미지 2
		} else {
			movie.setMovieImg2(mImg1); // 이미지 2
		}
		
		if (mImg2.equals("")) {
			movie.setMovieImg3("mImg03.jpg"); // 이미지 3
		} else {
			movie.setMovieImg3(mImg2); // 이미지 3
		}
		
		if (mImg3.equals("")) {
			movie.setMovieImg4("mImg04.jpg"); // 이미지 4
		} else {
			movie.setMovieImg4(mImg3); // 이미지 4
		}
		
		if (mImg4.equals("")) {
			movie.setMovieImg5("mImg05.jpg"); // 이미지 5
		} else {
			movie.setMovieImg5(mImg4); // 이미지 5
		}
						
		return movieDao.writeMovie(movie);
	}// 글 쓰기
	

	@Override
	public int modifyMovie(Movie movie, MultipartHttpServletRequest mRequest) {
		
		String uploadPath = mRequest.getRealPath("movieImg/");
		Iterator<String> iterator = mRequest.getFileNames();
		String mimg[] = { "", "", "", "", ""};
		int idx = 0;
		
		while (iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);// 실제파일 받아오기
			String originFileName = mFile.getOriginalFilename();
			mimg[idx] = originFileName;// 실제저장되는 파일 이름
			
			if (mimg[idx] != null && !mimg[idx].equals("")) {
				
				if (new File(uploadPath + mimg[idx]).exists() || new File(savePath + mimg[idx]).exists()) {
					
					mimg[idx] = System.currentTimeMillis() + "_" + mimg[idx];
					
				}
				try {
					
					mFile.transferTo(new File(uploadPath + mimg[idx]));
					int result = copy(uploadPath + mimg[idx], savePath + mimg[idx]);
					System.out.println(result == 1 ? mimg[idx] + "영화 이미지 넣음" : mimg[idx] + "영화 이미지 넣음");
					
				} catch (IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
			idx++;
		} // while
		// 인자값 묶어서 처리
		
		String movieSummary = movie.getMovieSummary();
		movie.setMovieSummary(movieSummary.replaceAll("\r\n", "<br>")); // 영화 설명
		
		String mImg0 =  mimg[0];
		String mImg1 =  mimg[1];
		String mImg2 =  mimg[2];
		String mImg3 =  mimg[3];
		String mImg4 =  mimg[4];
		
		movie.setMovieImg1(mImg0); // 이미지 1
		
		if (mImg1.equals("")) {
			movie.setMovieImg2("mImg02.jpg"); // 이미지 2
		} else {
			movie.setMovieImg2(mImg1); // 이미지 2
		}
		
		if (mImg2.equals("")) {
			movie.setMovieImg3("mImg03.jpg"); // 이미지 3
		} else {
			movie.setMovieImg3(mImg2); // 이미지 3
		}
		
		if (mImg3.equals("")) {
			movie.setMovieImg4("mImg04.jpg"); // 이미지 4
		} else {
			movie.setMovieImg4(mImg3); // 이미지 4
		}
		
		if (mImg4.equals("")) {
			movie.setMovieImg5("mImg05.jpg"); // 이미지 5
		} else {
			movie.setMovieImg5(mImg4); // 이미지 5
		}
				
		return movieDao.modifyMovie(movie);
	} // 글수정
	
	@Override
	public int deleteMovie(Movie movie) {
		return movieDao.deleteMovie(movie);
	}

	@Override
	public int deleteComant(String rCode) {
		return movieDao.deleteComant(rCode);
	}

	@Override
	public int cntMovie() {
		return movieDao.cntMovie();
	}
	
	@Override
	public int cntReview(String movieCode) {
		return movieDao.cntReview(movieCode);
	}

	private int copy(String originalFile, String targetFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(originalFile);
			os = new FileOutputStream(targetFile);
			byte[] buff = new byte[1024 * 1024];
			int nRead;
			while ((nRead = is.read(buff)) != -1) {
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (is != null)
					is.close();
				if (os != null)
					os.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	} // 파일 카피 

	@Override
	public int getMovieRecomm(Movie movie) {
		return movieDao.getMovieRecomm(movie);
	}

	@Override
	public int getRecommCnt(Movie movie) {
		return movieDao.getRecommCnt(movie);
	}

	@Override
	public int writeRecomm(Movie movie) {
		return movieDao.writeRecomm(movie);
	}

	@Override
	public int updateRecomm(Movie movie) {
		return movieDao.updateRecomm(movie);
	}

}
