package com.dgit.domain;

import java.util.Date;

public class NoticeBoardVO {
	private int nno;
	private String title;
	private String content;
	private Date regdate;
	private Date updatedate;
	private String imgpath;
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
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
	@Override
	public String toString() {
		return "NoticeBoardVO [nno=" + nno + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", updatedate=" + updatedate + ", imgpath=" + imgpath + "]";
	}
	public NoticeBoardVO() {}
	
}
