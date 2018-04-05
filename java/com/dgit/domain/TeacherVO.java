package com.dgit.domain;

public class TeacherVO {
	
	private int tno;
	private String name;
	private String tell;
	private String title;
	private String pw;
	private String id;
	
	
	public TeacherVO() {}
	
	public int getTno() { 
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
		return String.format("TeacherVO [tno=%s, name=%s, tell=%s, title=%s, pw=%s, id=%s]", tno, name, tell, title, pw,
				id);
	}
	
	
	
	
}
