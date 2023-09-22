package com.hh.db;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

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

}
