package day02_2;

public class Hyundae implements Car{
	@Override
	public void bootOn() {
		System.out.println("Hyundae �õ� On!");
		
	}

	@Override
	public void gearP() {
		System.out.println("Hyundae �����ġ : Parking");
	}

	@Override
	public void gearN() {
		System.out.println("Hyundae �����ġ : Neutral");
	}

	@Override
	public void gearR() {
		System.out.println("Hyundae �����ġ : Reverse ");
	}

	@Override
	public void gearD() {
		System.out.println("Hyundae �����ġ : Drive");
	}

	@Override
	public void br() {
		System.out.println("Hyundae �극��ũ! ����!!!");
	}

	@Override
	public void accelerator() {
		System.out.println("Hyundae �׼�������! SpeedUp");
	}

	@Override
	public void bootOff() {
		System.out.println("Hyundae �õ� Off!");
	}
}
