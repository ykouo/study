package day02_2;

public class Kia implements Car{

	@Override
	public void bootOn() {
		System.out.println("Kia �õ� On!");
		
	}

	@Override
	public void gearP() {
		System.out.println("Kia �����ġ : Parking");
	}

	@Override
	public void gearN() {
		System.out.println("Kia �����ġ : Neutral");
	}

	@Override
	public void gearR() {
		System.out.println("Kia �����ġ : Reverse ");
	}

	@Override
	public void gearD() {
		System.out.println("Kia �����ġ : Drive");
	}

	@Override
	public void br() {
		System.out.println("Kia �극��ũ! ����!!!");
	}

	@Override
	public void accelerator() {
		System.out.println("Kia �׼�������! �ӵ�����");
	}

	@Override
	public void bootOff() {
		System.out.println("Kia �õ� Off!");
	}

}
