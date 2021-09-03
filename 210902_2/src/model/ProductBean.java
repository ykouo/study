package model;

public class ProductBean {
	// vo 부분
	private String[] productName = {"자두","복숭아","포도","메론","수박"};
	private int[] productPrice = {3000 , 6000 , 5000 , 10000, 15000};
	
	public String[] getProductName() {
		return productName;
	}
	
	public int[] getProductPrice() {
		return productPrice;
	}
		
	// dao 부분 
	public int totalPrice(String pname, int cnt) {
		int total = 0;
		for(int i=0;i<productName.length;i++) {
			if(productName[i].equals(pname)) {
				total = productPrice[i]*cnt;
			}
		}
		return total;
	}

}
