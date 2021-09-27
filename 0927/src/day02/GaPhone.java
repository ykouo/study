package day02;

public class GaPhone implements Phone {

	@Override
	public void powerOn() {
		// TODO Auto-generated method stub
		System.out.println("Hi Galaxy!");
	}
	@Override
	public void powerOff() {
		// TODO Auto-generated method stub
		System.out.println("Bye~ Galaxy!!");
	}
	@Override
	public void volumeUp() {
		// TODO Auto-generated method stub
		System.out.println("家府+=10");
	}
	@Override
	public void volumeDown() {
		// TODO Auto-generated method stub
		System.out.println("家府-=10");
	}
}
