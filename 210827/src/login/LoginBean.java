package login;

public class LoginBean { // �α��� ������ �ִ��� �����ϴ� ��� 
	private String userID; //���������=view(.jsp, .html)�� name�Ӽ��� �̸��� ��ġ��Ų��!
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
	final String dbID = "kim"; //DB���� / ���� ���ȭ
	final String dbPW = "1234";
	public boolean check() { //�ش� Bean�� ���
 		if(userID.equals(dbID)&&userPW.equals(dbPW)) {
			return true;
	}
	return false;
	}
}
