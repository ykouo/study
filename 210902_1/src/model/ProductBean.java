package model;

public class ProductBean {
	private String[] product = {"자두","수박","복숭아"};
	private int[] price = {2000,3000,5000};
	
	public String[] getProduct() {
		return product;
	}

	public int[] getPrice() {
		return price;
	}
	
	public int calc(String pname, int cnt) {
		int total =0 ; //사용자가 직접입력하지 않는 데이터 --> 초기화 필수 대상 
		for(int i=0;i<product.length;i++) {
			if(product[i].equals(pname)) {
				total=price[i]*cnt;		
			}
		}
		return total;
	}
	

}
