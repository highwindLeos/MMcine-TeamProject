package com.tj.mmcine.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mmcine.model.Notice;

@Repository
public class NoticeDao implements INoticeDao {

	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	
	@Autowired
	private SqlSessionTemplate sessiontemplate;

	// 게시글 리스트 List<Notice> listBoard(Notice)
	@Override
	public List<Notice> listNotice(Notice notice) {
		return sessiontemplate.selectList("listNotice", notice);
	}
	
	// 게시글 리스트 5행 List<Notice> listNoticeNewFive(Notice)
	@Override
	public List<Notice> listNoticeNewFive(Notice notice) {
		return sessiontemplate.selectList("listNoticeNewFive", notice);
	}
	
	// 글 갯수 int getBoardCnt()
	@Override
	public int getNoticeCnt() {
		return sessiontemplate.selectOne("getNoticeCnt");
	}

	// 글 한행 가져오기
	@Override
	public Notice getNotice(Notice notice) {
		return sessiontemplate.selectOne("getNotice", notice);
	}
	
	// 글쓰기 int writeBoard(notice)
	@Override
	public int writNotice(Notice notice) {
		return sessiontemplate.insert("writNotice", notice);
	}
	
	// 글 수정
	@Override
	public int modifyNotice(Notice notice) {
		return sessiontemplate.update("modifyNotice", notice);
	}

	// 글 삭제 int deleteBoard(bId)
	@Override
	public int deleteNotice(int nBoardNum) {		
		return sessiontemplate.delete("deleteNotice", nBoardNum);
	}


}
