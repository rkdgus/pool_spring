package com.dgit.domain;

import java.util.Date;

public class ClassreplyVO {
	private int rno;
	private int bno;
	private String id;
	private String replytext;
	private Date regdate;
	private Date updatedate;
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
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
	@Override
	public String toString() {
		return "ClassreplyVO [rno=" + rno + ", bno=" + bno + ", id=" + id + ", replytext=" + replytext + ", regdate="
				+ regdate + ", updatedate=" + updatedate + "]";
	}
	public ClassreplyVO() {}
	
}
