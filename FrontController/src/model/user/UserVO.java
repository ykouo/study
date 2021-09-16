package model.user;

import java.sql.Date;

public class UserVO {
	private String userid;
	private String username;
	private String userpw;
	private Date udate;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public Date getUdate() {
		return udate;
	}
	public void setUdate(Date udate) {
		this.udate = udate;
	}
	
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", username=" + username + ", userpw=" + userpw + ", udate=" + udate + "]";
	}
	
	
}
