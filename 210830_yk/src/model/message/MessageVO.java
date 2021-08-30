package model.message;

import java.sql.Date;

public class MessageVO {
	int mnum;
	String title;
	String content;
	String writer;
	Date wdate;
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	@Override
	public String toString() {
		return "MessageVO [mnum=" + mnum + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", wdate=" + wdate + "]";
	}

	

}
