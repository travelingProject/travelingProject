package com.hh.db;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class ReservationSort {
	
    // 예약 정보 리스트를 체크인 날짜가 빠른 순서로 정렬
    public static void sortByCheckInDate(List<MyPageObj> rinfoList) {
        Collections.sort(rinfoList, new Comparator<MyPageObj>() {
            @Override
            public int compare(MyPageObj r1, MyPageObj r2) {
                // 체크인 날짜를 비교하여 정렬 순서를 결정
                return r1.getCheckInDate().compareTo(r2.getCheckInDate());
            }
        });
    }

}
