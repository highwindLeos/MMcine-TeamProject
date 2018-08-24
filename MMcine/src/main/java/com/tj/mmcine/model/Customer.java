package com.tj.mmcine.model;

import java.sql.Date;

public class Customer {
	private String cusId ; 
	private String cusPw ;
	private String cusName ; 
	private String cusNick ;
	private Date cusBirth ;
	private String cusPhone ; 
	private String cusEmail ; 
	private String cusAddress ;
	private String cusGender ;
	private String cusPhoto ;
	private int cusSum ;
	private int cusPoint; 
	private Date cusRdate ;
	private int cusBlack ;
	private String cusGrade;
	private int cusDiscount;
	
	
	public String getCusId() {
		return cusId;
	}
	public void setCusId(String cusId) {
		this.cusId = cusId;
	}
	public String getCusPw() {
		return cusPw;
	}
	public void setCusPw(String cusPw) {
		this.cusPw = cusPw;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getCusNick() {
		return cusNick;
	}
	public void setCusNick(String cusNick) {
		this.cusNick = cusNick;
	}
	public Date getCusBirth() {
		return cusBirth;
	}
	public void setCusBirth(Date cusBirth) {
		this.cusBirth = cusBirth;
	}
	public String getCusPhone() {
		return cusPhone;
	}
	public void setCusPhone(String cusPhone) {
		this.cusPhone = cusPhone;
	}
	public String getCusEmail() {
		return cusEmail;
	}
	public void setCusEmail(String cusEmail) {
		this.cusEmail = cusEmail;
	}
	public String getCusAddress() {
		return cusAddress;
	}
	public void setCusAddress(String cusAddress) {
		this.cusAddress = cusAddress;
	}
	public String getCusGender() {
		return cusGender;
	}
	public void setCusGender(String cusGender) {
		this.cusGender = cusGender;
	}
	public String getCusPhoto() {
		return cusPhoto;
	}
	public void setCusPhoto(String cusPhoto) {
		this.cusPhoto = cusPhoto;
	}
	public int getCusSum() {
		return cusSum;
	}
	public void setCusSum(int cusSum) {
		this.cusSum = cusSum;
	}
	public int getCusPoint() {
		return cusPoint;
	}
	public void setCusPoint(int cusPoint) {
		this.cusPoint = cusPoint;
	}
	public Date getCusRdate() {
		return cusRdate;
	}
	public void setCusRdate(Date cusRdate) {
		this.cusRdate = cusRdate;
	}
	public int getCusBlack() {
		return cusBlack;
	}
	public void setCusBlack(int cusBlack) {
		this.cusBlack = cusBlack;
	}
	
	public String getCusGrade() {
		return cusGrade;
	}
	public void setCusGrade(String cusGrade) {
		this.cusGrade = cusGrade;
	}
	public int getCusDiscount() {
		return cusDiscount;
	}
	public void setCusDiscount(int cusDiscount) {
		this.cusDiscount = cusDiscount;
	}
	@Override
	public String toString() {
		return "Customer [cusId=" + cusId + ", cusPw=" + cusPw + ", cusName=" + cusName + ", cusNick=" + cusNick
				+ ", cusBirth=" + cusBirth + ", cusPhone=" + cusPhone + ", cusEmail=" + cusEmail + ", cusAddress="
				+ cusAddress + ", cusGender=" + cusGender + ", cusPhoto=" + cusPhoto + ", cusSum=" + cusSum
				+ ", cusPoint=" + cusPoint + ", cusRdate=" + cusRdate + ", cusBlack=" + cusBlack + ", cusGrade="
				+ cusGrade + ", cusDiscount=" + cusDiscount + "]";
	}
	
	
	
	
}
