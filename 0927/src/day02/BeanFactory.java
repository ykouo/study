package day02;

public class BeanFactory {
	/* ���� Ŭ���� 
	 DAO�� ������ ģ����
	 DAO == ����Ͻ� �޼��带 ������ �ִ� ��ü
	 == ��� 
	*/
	public Object getBean(String beanName) {
		if(beanName.equals("Ga")) {
			return new GaPhone();
		}else if(beanName.equals("I")) {
			return new IPhone();
		}
		
		return null;
	}
	
	
	
	
}
