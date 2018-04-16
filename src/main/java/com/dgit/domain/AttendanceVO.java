package com.dgit.domain;

import java.util.Date;

public class AttendanceVO {
	private Date date;
	private int mno;
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public AttendanceVO() {}
	
	@Override
	public String toString() {
		return String.format("AttendanceVO [date=%s, mno=%s]", date, mno);
	}
	
	
}
