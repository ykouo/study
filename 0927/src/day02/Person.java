package day02;

public class Person {
	public static void main(String[] args) {
		//GaPhone phone = new GaPhone();
		//IPhone으로 바꾸려면 또 다 바꿔야함
		BeanFactory factory = new BeanFactory();
		Phone phone=(Phone)factory.getBean(args[0]); // 빨간줄 ==> Object로 반환하기 때문에 형변환 해야함 
		//Phone phone = new GaPhone();	
		phone.powerOn();
		phone.volumeDown();
		phone.volumeUp();
		phone.powerOff();
	}
}
