package com.dgit.domain;

import java.util.Date;

public class QnaBoardVO {
	private int bno;
	private String writer;
	private String title;
	private String content;
	private Date regdate;
	private Date updatedate;
	private boolean replycheck;
	private String answer;
	private Date answerdate;
	private String imgpath;
	private String email;
	private String pw;
	private String id;
	
	
	public QnaBoardVO() {}
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public boolean isReplycheck() {
		return replycheck;
	}
	public void setReplycheck(boolean replycheck) {
		this.replycheck = replycheck;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getAnswerdate() {
		return answerdate;
	}
	public void setAnswerdate(Date answerdate) {
		this.answerdate = answerdate;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}


	@Override
	public String toString() {
		return String.format(
				"QnaBoardVO [bno=%s, writer=%s, title=%s, content=%s, regdate=%s, updatedate=%s, replycheck=%s, answer=%s, answerdate=%s, imgpath=%s, email=%s, pw=%s, id=%s]",
				bno, writer, title, content, regdate, updatedate, replycheck, answer, answerdate, imgpath, email, pw,
				id);
	}
	
} 
