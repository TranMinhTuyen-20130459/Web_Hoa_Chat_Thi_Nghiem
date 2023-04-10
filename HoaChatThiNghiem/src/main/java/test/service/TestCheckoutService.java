package test.service;

import database.JDBiConnector;
import model.shop.Bill_MT;
import service.CheckoutService;

public class TestCheckoutService {

    public static void TestAddNewBill() {
        Bill_MT bill = new Bill_MT("tran minh tuyen", "0379342981", "ttt@gmail.com", "hồ chí minh", "bình tân", "bình hưng hòa a", "256 Lê Văn Quới", 200000);
        System.out.println(CheckoutService.addNewBill(JDBiConnector.me(), bill, "6"));
    }

    public static void main(String[] args) {

        for (int i = 0; i < 100; i++) {
            TestAddNewBill();
        }

    }
}
