package com.tj.mmcine.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mmcine.dao.INoticeDao;
import com.tj.mmcine.model.Notice;

@Service
public class NoticeService implements INoticeService {

	@Autowired
	private INoticeDao noticeDao;
	private String savePath = "C:/Users/Leodays/Desktop/Dev/webstudy/MMcine/MMcine/src/main/webapp/noticeFile/";

	@Override
	public List<Notice> listNotice(Notice notice) {
		return noticeDao.listNotice(notice);
	} // paging List

	@Override
	public List<Notice> listNoticeNewFive(Notice notice) {
		return noticeDao.listNoticeNewFive(notice);
	} // 5행 구하기

	@Override
	public int getNoticeCnt() {
		return noticeDao.getNoticeCnt();
	} // 공지 갯수 구하기 : paging
	
	@Override
	public Notice getNotice(Notice notice) {
		return noticeDao.getNotice(notice);
	}	// 공지 한 행 가져오기

	@Override
	public int writNotice(Notice notice, MultipartHttpServletRequest mRequest) {
		
		String uploadPath = mRequest.getRealPath("noticeFile/");
		Iterator<String> iterator = mRequest.getFileNames();
		
		String nfile[] = new String[1]; // 첨부파일 1
		int idx = 0;
		while (iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);// 실제파일 받아오기
			String originFileName = mFile.getOriginalFilename();
			nfile[idx] = originFileName;// 실제저장되는 파일 이름
			
			if (nfile[idx] != null && !nfile[idx].equals("")) {
				if (new File(uploadPath + nfile[idx]).exists() || new File(savePath + nfile[idx]).exists()) {
					nfile[idx] = System.currentTimeMillis() + "_" + nfile[idx];
				}
				try {
					
					System.out.println(idx + "번재 서버: " + uploadPath + nfile[idx]);
					System.out.println(idx + "번재 저장: " + savePath + nfile[idx]);
					mFile.transferTo(new File(uploadPath + nfile[idx]));
					int result = copy(uploadPath + nfile[idx], savePath + nfile[idx]);
					System.out.println(result == 1 ? nfile[idx] + "영화 이미지 넣음" : nfile[idx] + "영화 이미지 못 넣음");
					
				} catch (IllegalStateException e) {
					System.out.println(e.getMessage() + "예외1");
				} catch (IOException e) {
					System.out.println(e.getMessage() + "예외2");
				}
			} else {
				
			}
			idx++;
		} // while
		// 인자값 묶어서 처리
		
		notice.setnBoardId(mRequest.getParameter("nBoardId"));
		notice.setnBoardTitle(mRequest.getParameter("nBoardTitle"));
		notice.setnBoardContent(mRequest.getParameter("nBoardContent"));
		
		notice.setnBoardImg(nfile[0]); // 첨부 파일
		
		System.out.println(notice);
		
		return noticeDao.writNotice(notice);
		} // 공지 쓰기
		
	@Override
	public int modifyNotice(Notice notice, MultipartHttpServletRequest mRequest) {
		
		String uploadPath = mRequest.getRealPath("noticeFile/");
		Iterator<String> iterator = mRequest.getFileNames();
		String nfile[] = {""};
		int idx = 0;
		
		while (iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);// 실제파일 받아오기
			String originFileName = mFile.getOriginalFilename();
			nfile[idx] = originFileName;// 실제저장되는 파일 이름
			
			if (nfile[idx] != null && !nfile[idx].equals("")) {
				
				if (new File(uploadPath + nfile[idx]).exists() || new File(savePath + nfile[idx]).exists()) {
					
					nfile[idx] = System.currentTimeMillis() + "_" + nfile[idx];
					
				}
				try {
					
					mFile.transferTo(new File(uploadPath + nfile[idx]));
					int result = copy(uploadPath + nfile[idx], savePath + nfile[idx]);
					System.out.println(result == 1 ? nfile[idx] + "영화 이미지 넣음" : nfile[idx] + "영화 이미지 넣음");
					
				} catch (IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
			idx++;
		} // while
		// 인자값 묶어서 처리
		notice.setnBoardId(mRequest.getParameter("nBoardId"));
		notice.setnBoardTitle(mRequest.getParameter("nBoardTitle"));
		notice.setnBoardContent(mRequest.getParameter("nBoardContent"));
		
		notice.setnBoardImg(nfile[0]); // 첨부 파일
		
		notice.setnBoardNum(Integer.parseInt(mRequest.getParameter("nBoardNum")));
		
		return noticeDao.modifyNotice(notice);
	} // 공지 수정

	@Override
	public int deleteNotice(int nBoardNum) {
		return noticeDao.deleteNotice(nBoardNum);
	} // 공지 삭제
	
	// 파일 복사
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



}
