package day2;

public class Calc {
	// ���ɺи� (concern�и�)
	//-> ����� ���ε��� ����
	// == ��������
	// == �������� ��
	// ��ɺ����� Ŭ���� ���� -> ��� == ������Ʈ == ���� : M
	
	int result =0;
	
	public Calc(int num1, int num2, String op) {
		
		if(op.equals("+")) {
			result = num1+num2;
		}else if(op.equals("-")) {
			result = num1-num2;
		}else if(op.equals("x")) {
			result = num1*num2;
		}else if(op.equals("/")) {
			result = num1/num2;
		}
	}

	public int getResult() {
		return result;
	}

	
}
