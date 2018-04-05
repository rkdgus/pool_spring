package com.dgit.domain;

import java.util.Date;

public class ClassBoardVO {
	private int bno;
	private int cno;
	private String id;
	private String title;
	private String content;
	private Date regdate;
	private Date updatedate;
	private String imgpath; 
	private int readcnt;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "ClassBoardVo [bno=" + bno + ", cno=" + cno + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + ", imgpath=" + imgpath + ", readcnt="
				+ readcnt + "]";
	}
	public ClassBoardVO() {}
}
