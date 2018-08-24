package com.tj.mmcine.model;

public class Admin {
	private String aId; 
	private String aPw;
	private String aName;
	public String getaId() {
		return aId;
	}
	public void setaId(String aId) {
		this.aId = aId;
	}
	public String getaPw() {
		return aPw;
	}
	public void setaPw(String aPw) {
		this.aPw = aPw;
	}
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	@Override
	public String toString() {
		return "Admin [aId=" + aId + ", aPw=" + aPw + ", aName=" + aName + "]";
	} 
	
	
}
