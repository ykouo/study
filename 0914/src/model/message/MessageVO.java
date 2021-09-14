package model.message;

import java.sql.Date;

public class MessageVO {
	private int mid;
	private String userid;
	private String msg;
	private int favcount;
	private int replycount;
	private Date mdate;
	
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getFavcount() {
		return favcount;
	}
	public void setFavcount(int favcount) {
		this.favcount = favcount;
	}
	public int getReplycount() {
		return replycount;
	}
	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	
	@Override
	public String toString() {
		return "MessageVO [mid=" + mid + ", userid=" + userid + ", msg=" + msg + ", favcount=" + favcount
				+ ", replycount=" + replycount + ", mdate=" + mdate + "]";
	}
	
	
	


}
