package day02;

public class Person {
	public static void main(String[] args) {
		//GaPhone phone = new GaPhone();
		//IPhone���� �ٲٷ��� �� �� �ٲ����
		BeanFactory factory = new BeanFactory();
		Phone phone=(Phone)factory.getBean(args[0]); // ������ ==> Object�� ��ȯ�ϱ� ������ ����ȯ �ؾ��� 
		//Phone phone = new GaPhone();	
		phone.powerOn();
		phone.volumeDown();
		phone.volumeUp();
		phone.powerOff();
	}
}
