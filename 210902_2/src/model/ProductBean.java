package model;

public class ProductBean {
	// vo �κ�
	private String[] productName = {"�ڵ�","������","����","�޷�","����"};
	private int[] productPrice = {3000 , 6000 , 5000 , 10000, 15000};
	
	public String[] getProductName() {
		return productName;
	}
	
	public int[] getProductPrice() {
		return productPrice;
	}
		
	// dao �κ� 
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
