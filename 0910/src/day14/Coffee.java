package day14;

public class Coffee {
	
	private String name;
	private int price;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return name ;
	}
	/**
	 * @param name
	 * @param price
	 */
	//  생성자 만들기 
	public Coffee(String name, int price) {
		this.name = name;
		this.price = price;
	}
	
	
	
}
