package com.tj.mmcine.service;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mmcine.model.Notice;
public interface INoticeService {
	
	// 게시글 리스트 ArrayList<BoardDto> listBoard(Notice notice)
	public List<Notice> listNotice(Notice notice);
	
	// 게시글 리스트 ArrayList<BoardDto> listBoard(Notice notice)
	public List<Notice> listNoticeNewFive(Notice notice);
	
	// 글 갯수 int getBoardCnt()
	public int getNoticeCnt();
	
	// 글 한행 가져오기
	public Notice getNotice(Notice notice);
	
	// 글쓰기 int writeBoard(dto)
	public int writNotice(Notice notice, MultipartHttpServletRequest mRequest);
	
	// 글 수정
	public int modifyNotice(Notice notice, MultipartHttpServletRequest mRequest);

	// 글 삭제 int deleteBoard(bId)
	public int deleteNotice(int nBoardNum);
	
}
