package com.dgit.domain;

import java.util.Date;

public class MemberVO {
	
	private int mno;
	private String name;
	private int age;
	private String tell;
	private Date date;
	private String email;
	private String gender;
	private String pw;
	private String id;
	
	public MemberVO() {}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getTell() {
		return tell;
	}

	public void setTell(String tell) {
		this.tell = tell;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return String.format("MemberVO [mno=%s, name=%s, age=%s, tell=%s, date=%s, email=%s, gender=%s, pw=%s, id=%s]",
				mno, name, age, tell, date, email, gender, pw, id);
	}
	
}
