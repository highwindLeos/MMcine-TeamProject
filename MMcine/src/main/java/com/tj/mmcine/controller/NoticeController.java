package com.tj.mmcine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mmcine.dao.NoticeDao;
import com.tj.mmcine.model.Notice;
import com.tj.mmcine.service.INoticeService;
import com.tj.mmcine.service.Paging;

@Controller
public class NoticeController {
	
	@Autowired
	private INoticeService noticeService;
	
	@RequestMapping(value="notice", method=RequestMethod.GET)
	public String noticeListGet(Notice notice, String pageNum, Model model) {
		
		System.out.println(pageNum);
		
		int cntNotice = noticeService.getNoticeCnt();
		Paging paging = new Paging(cntNotice, pageNum, 10, 5); 
		
		notice.setStartRow(paging.getStartRow());
		notice.setEndRow(paging.getEndRow());
		
		model.addAttribute("listNotice", noticeService.listNotice(notice)); 
		model.addAttribute("paging", paging);
		
		return "notice/noticeBoard";
	}
	@RequestMapping(value="notice", method=RequestMethod.POST)
	public String noticeListPost(Notice notice, String pageNum, Model model) {
		
		System.out.println(pageNum);
		
		int cntNotice = noticeService.getNoticeCnt();
		Paging paging = new Paging(cntNotice, pageNum, 10, 5); // 이 서비스는 pageSize = 15, blockSize는 5로 함
		
		notice.setStartRow(paging.getStartRow());
		notice.setEndRow(paging.getEndRow());
		
		model.addAttribute("listNotice", noticeService.listNotice(notice)); 
		model.addAttribute("paging", paging);
		
		return "notice/noticeBoard";
	}
	
	@RequestMapping(value="noticeWriteForm", method=RequestMethod.GET)
	public String noticeWriteForm(String pageNum, Model model) {
		
		int cntNotice = noticeService.getNoticeCnt();
		Paging paging = new Paging(cntNotice, pageNum);
		
		model.addAttribute("paging", paging);
		
		return "notice/noticeWriteForm";
	}
	@RequestMapping(value="writeNotice", method=RequestMethod.POST)
	public String writeNotice(Notice notice, String pageNum, Model model, MultipartHttpServletRequest mRequest) {
		
		int writeResult = noticeService.writNotice(notice, mRequest);
		if (writeResult == NoticeDao.SUCCESS) {
			model.addAttribute("writeResult", "공지사항 쓰기 성공");
		}
		model.addAttribute("pageNum", pageNum);
		
		return "forward:notice.do";
	}
	
	@RequestMapping(value="noticeModifyForm", method=RequestMethod.GET)
	public String noticeModifyForm(Notice notice, String pageNum, Model model) {
		
		int cntNotice = noticeService.getNoticeCnt();
		Paging paging = new Paging(cntNotice, pageNum);
		
		model.addAttribute("noticeDetail", noticeService.getNotice(notice));
		model.addAttribute("paging", paging);
		
		return "notice/modifyNoticeForm";
	}
	@RequestMapping(value="modifyNotice", method=RequestMethod.POST)
	public String modifyNotice(Notice notice, String pageNum, Model model, MultipartHttpServletRequest mRequest) {
		
		int writeResult = noticeService.modifyNotice(notice, mRequest);
		if (writeResult == NoticeDao.SUCCESS) {
			model.addAttribute("modifyNotice", "공지사항 수정 성공");
		}
		model.addAttribute("pageNum", pageNum);
		
		return "forward:notice.do";
	}
	
	@RequestMapping(value="deleteNotice", method=RequestMethod.GET)
	public String deleteNotice(Notice notice, String pageNum, Model model) {
		
		int deleteResult = noticeService.deleteNotice(notice.getnBoardNum());
		if (deleteResult == NoticeDao.SUCCESS) {
			model.addAttribute("deleteNotice", "공지사항 삭제 성공");
		}
		
		model.addAttribute("pageNum", pageNum);
		
		return "forward:notice.do";
	}

}
