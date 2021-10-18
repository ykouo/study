package model.mem;

import java.sql.Date;

public class MemVO {
	
	// ¸â¹öº¯¼ö 
	private String mid;//MID VARCHAR(50) PRIMARY KEY,
	private String mpw;//MPW VARCHAR(50) NOT NULL,
	private String mname;//MNAME VARCHAR(50) NOT NULL,
	private String call;//CALL VARCHAR(50) NOT NULL,
	private String role;//ROLE VARCHAR(50) DEFAULT 'USER',
	private Date mdate;//MDATE DATE DEFAULT SYSDATE
	
	// Getter & Setter
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getCall() {
		return call;
	}
	public void setCall(String call) {
		this.call = call;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	// toString
	@Override
	public String toString() {
		return "MemVO [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", call=" + call + ", role=" + role
				+ ", mdate=" + mdate + "]";
	}
	
	
	
	
}
