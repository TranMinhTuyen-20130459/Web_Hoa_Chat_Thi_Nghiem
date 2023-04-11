package test.dao;

import database.JDBiConnector;
import database.dao.CheckoutDAO;
import model.shop.BillDetail_MT;
import model.shop.Bill_MT;
import org.jdbi.v3.core.Handle;

public class TestCheckoutDAO {

    public static void TestAddNewBill() {
        Bill_MT bill = new Bill_MT("tran minh tuyen", "0379342981", "ttt@gmail.com", "hồ chí minh", "bình tân", "bình hưng hòa a", "256 Lê Văn Quới", 200000);
        Handle handle = JDBiConnector.me().open();
        System.out.println(CheckoutDAO.addNewBill(handle, bill, "6"));
    }

    public static void TestAddBillDetail() {
        BillDetail_MT bdt = new BillDetail_MT(224, 11, 10, 300000, 200000);
        Handle handle = JDBiConnector.me().open();
        CheckoutDAO.addBillDetail(handle, bdt);
    }

    public static void main(String[] args) {


            TestAddNewBill();
            TestAddBillDetail();

    }
}
