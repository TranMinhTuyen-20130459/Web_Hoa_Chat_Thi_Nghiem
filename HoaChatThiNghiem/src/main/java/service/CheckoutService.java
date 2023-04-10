package service;

import model.shop.Bill_MT;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;
import org.jdbi.v3.core.statement.Update;

public class CheckoutService {

    public static int addNewBill(Jdbi jdbi, Bill_MT bill, String idUser) {
        Handle handle = null;
        try {
            handle = jdbi.open();
            Update update = handle.createUpdate("INSERT INTO bills(id_user,id_status_bill,to_name,to_phone,to_address,to_ward_name,to_district_name,to_province_name,email_customer,bill_price_before)" +
                    " VALUES(:id_user,1,:to_name,:to_phone,:to_address,:to_ward_name,:to_district_name,:to_province_name,:email_customer,:bill_price_before)");
            update.bind("id_user", idUser)
                    .bind("to_name", bill.getNameCustomer())
                    .bind("to_phone", bill.getPhoneCustomer())
                    .bind("to_address", bill.getAddress())
                    .bind("to_ward_name", bill.getWard())
                    .bind("to_district_name", bill.getDistrict())
                    .bind("to_province_name", bill.getCity())
                    .bind("email_customer", bill.getEmailCustomer())
                    .bind("bill_price_before", bill.getBill_price_before());

            int rowInsert = update.execute();

            if (rowInsert == 1) {
                Query query = handle.createQuery("SELECT LAST_INSERT_ID()");
                int first = (int) query.mapTo(Integer.class).one(); // Phương thức one() sẽ trả về giá trị của cột đầu tiên nếu có bản ghi được trả về từ câu truy vấn, ngược lại sẽ ném ra một ngoại lệ.
                return first;
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return -1;
        } finally {
            handle.close();
        }
        return -1;
    }

    public static void addBillDetail(Jdbi jdbi, int billId, int productId, int quantity, double listedPrice, double currentPrice) {

        try {

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

}
