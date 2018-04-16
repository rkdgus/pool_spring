package com.dgit.domain;

import java.util.Date;

public class ClassVO {
	private int cno;
	private int tno;
	private int classmate;
	private boolean reclass;
	private String level;
	private String time;
	private Date s_day;
	private int pay;
	

	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getClassmate() {
		return classmate;
	}
	public void setClassmate(int classmate) {
		this.classmate = classmate;
	}
	public boolean isReclass() {
		return reclass;
	}
	public void setReclass(boolean reclass) {
		this.reclass = reclass;
	}
	public Date getS_day() {
		return s_day;
	}
	public void setS_day(Date s_day) {
		this.s_day = s_day;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getLevel() {
		return level; 
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public ClassVO() {}
	@Override
	public String toString() {
		return String.format("ClassVO [cno=%s, tno=%s, classmate=%s, reclass=%s, level=%s, time=%s, s_day=%s]", cno,
				tno, classmate, reclass, level, time, s_day);
	}

}
