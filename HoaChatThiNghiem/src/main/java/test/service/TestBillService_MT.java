package test.service;

import service.BillService_MT;

public class TestBillService_MT {

    public static void Test_GetAllBills() {
        System.out.println(BillService_MT.getAllBills());
        System.out.println(BillService_MT.getAllBillsPro());
    }

    public static void main(String[] args) {

        Test_GetAllBills();

    }
}
