package model.bank;

public class BBankVO {
	private int bid;
	private String name;
	private int balance;
	
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	@Override
	public String toString() {
		return "BBankVO [bid=" + bid + ", name=" + name + ", balance=" + balance + "]";
	}
	
	
	
	
	
}
