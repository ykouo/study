package join;

public class MemberVO {
	private String userName;
	private String userId;
	private String userPw;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	// �⺻������
	public MemberVO() {}
	
	public MemberVO(String userName, String userId, String userPw) {
		this.userName = userName;
		this.userId = userId;
		this.userPw = userPw;
	}
	
	public void addMember() {
	//	if(userId.equals(�Է¹��������̸�))
		
	}
	
}
