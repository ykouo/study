package model;

public class DataBean {
	private String[] dataList= {"apple","banana","orange","kiwi","home","action"};
	
	private int data1=10;
	private int data2=20;
	
	// EL1 -> EL2�� ������ ������ �ʿ��� get�޼��� ���� 
	public String[] getDataList() {
		return dataList;
	}
	public int getData1() {
		return data1;
	}
	public int getData2() {
		return data2;
	}
}
