package test;

public class Student { // VO역할
	private String name;
	private int score;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}

	
	// 생성자 
	public Student(String name, int score) {
		this.name = name;
		this.score = score;
	}
	
	
	

}
