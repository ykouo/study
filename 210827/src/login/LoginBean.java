package login;

public class LoginBean { // 로그인 정보가 있는지 인증하는 기능 
	private String userID; //멤버변수명=view(.jsp, .html)의 name속성의 이름과 일치시킨다!
	private String userPW;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	
	//DAO
	final String dbID = "kim"; //DB역할 / 값을 상수화
	final String dbPW = "1234";
	public boolean check() { //해당 Bean의 기능
 		if(userID.equals(dbID)&&userPW.equals(dbPW)) {
			return true;
	}
	return false;
	}
}
