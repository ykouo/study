package model;

public class ProductBean {
	private String[] product = {"�ڵ�","����","������"};
	private int[] price = {2000,3000,5000};
	
	public String[] getProduct() {
		return product;
	}

	public int[] getPrice() {
		return price;
	}
	
	public int calc(String pname, int cnt) {
		int total =0 ; //����ڰ� �����Է����� �ʴ� ������ --> �ʱ�ȭ �ʼ� ��� 
		for(int i=0;i<product.length;i++) {
			if(product[i].equals(pname)) {
				total=price[i]*cnt;		
			}
		}
		return total;
	}
	

}
