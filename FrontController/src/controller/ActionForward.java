package controller;
// 페이지 전달방식, 경로 
public class ActionForward {
	private boolean redirect;
	private String path;


// Getter & Setter	
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
}
