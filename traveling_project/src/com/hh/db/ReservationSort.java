package com.hh.db;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.hh.DTO.MyPlanner;

public class ReservationSort {
	
    // ���� ���� ����Ʈ�� üũ�� ��¥�� ���� ������ ����
    public static void sortByCheckInDate(List<MyPageObj> rinfoList) {
        Collections.sort(rinfoList, new Comparator<MyPageObj>() {
            @Override
            public int compare(MyPageObj r1, MyPageObj r2) {
                // üũ�� ��¥�� ���Ͽ� ���� ������ ����
                return r1.getCheckInDate().compareTo(r2.getCheckInDate());
            }
        });
    }
    
    // ���� �÷��� ���������� üũ�� ��¥�� ���� ������ ����
    public static void sortByCheckInDateForPlanner(List<MyPlanner> selList) {
        Collections.sort(selList, new Comparator<MyPlanner>() {
            @Override
            public int compare(MyPlanner r1, MyPlanner r2) {
                // üũ�� ��¥�� ���Ͽ� ���� ������ ����
                return r1.getCheck_in_date().compareTo(r2.getCheck_in_date());
            }
        });
    }

}
