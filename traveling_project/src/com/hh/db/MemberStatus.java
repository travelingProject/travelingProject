package com.hh.db;

public class MemberStatus {
	
	// �ջ� ������ ���� ����� ��� ����
	public String userGrade(int sum) {
		String grade = null;
		if (sum >= 1000000) {
			grade = "VIP";
		} else if (sum >= 500000) {
			grade = "GOLD";
		} else {
			grade = "SILVER";
		}
		return grade;
	}
	
	// ��޺� ������ ����
	public int gradePer(String grade) {
		int per = 0;
		if (grade.equals("VIP")) {
			per = 5;
		} else if (grade.equals("GOLD")) {
			per = 3;
		} else {
			per = 1;
		}
		return per;
	}

}
