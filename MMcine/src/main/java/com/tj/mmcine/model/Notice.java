package com.tj.mmcine.model;

import java.sql.Date;

public class Notice {

	private int nBoardNum;
	private String nBoardId;
	private String nBoardTitle;
	private String nBoardContent;
	private String nBoardImg;
	private int nBoardHit;
	private Date nBoardRdate;
	
	private int startRow;
	private int endRow;

	@Override
	public String toString() {
		return "Notice [nBoardNum=" + nBoardNum + ", nBoardId=" + nBoardId + ", nBoardTitle=" + nBoardTitle
				+ ", nBoardContent=" + nBoardContent + ", nBoardImg=" + nBoardImg + ", nBoardHit=" + nBoardHit
				+ ", nBoardRdate=" + nBoardRdate + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}

	public int getnBoardNum() {
		return nBoardNum;
	}

	public void setnBoardNum(int nBoardNum) {
		this.nBoardNum = nBoardNum;
	}

	public String getnBoardId() {
		return nBoardId;
	}

	public void setnBoardId(String nBoardId) {
		this.nBoardId = nBoardId;
	}

	public String getnBoardTitle() {
		return nBoardTitle;
	}

	public void setnBoardTitle(String nBoardTitle) {
		this.nBoardTitle = nBoardTitle;
	}

	public String getnBoardContent() {
		return nBoardContent;
	}

	public void setnBoardContent(String nBoardContent) {
		this.nBoardContent = nBoardContent;
	}

	public String getnBoardImg() {
		return nBoardImg;
	}

	public void setnBoardImg(String nBoardImg) {
		this.nBoardImg = nBoardImg;
	}

	public int getnBoardHit() {
		return nBoardHit;
	}

	public void setnBoardHit(int nBoardHit) {
		this.nBoardHit = nBoardHit;
	}

	public Date getnBoardRdate() {
		return nBoardRdate;
	}

	public void setnBoardRdate(Date nBoardRdate) {
		this.nBoardRdate = nBoardRdate;
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
	
}
