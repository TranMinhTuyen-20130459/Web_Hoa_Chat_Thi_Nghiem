package service;

import bean.Log;
import model.shop.Customer;
import model.shop.CustomerRowMapper;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;
import org.jdbi.v3.core.statement.Update;
import utils.FacebookUtils;
import utils.GoogleUtils;

import java.sql.SQLException;
import java.util.List;

public class FacebookGoogleService {

    public static boolean checkExistAcc(Jdbi jdbi, String id_user_fb_gg, int typeAcc) {

        /*
            - b1: kiểm tra thông tin tài khoản FB/GG đã tồn tại trong hệ thống hay chưa
            - b2: trả về kết quả true/false
         */

        try {

            jdbi.registerRowMapper(new CustomerRowMapper());

            if (typeAcc == FacebookUtils.ACC_FACEBOOK) {

                List<Customer> customers = jdbi.withHandle(handle -> {
                    Query query = handle.createQuery("SELECT username FROM account_customers WHERE id_user_fb = :id_user_fb_gg AND id_type_acc= :typeAcc");
                    query.bind("id_user_fb_gg", id_user_fb_gg);
                    query.bind("typeAcc", typeAcc);
                    return query.mapTo(Customer.class).list();
                });

                if (customers.size() == 1) {
                    return true;
                }

            } else if (typeAcc == GoogleUtils.ACC_GOOGLE) {

                List<Customer> customers = jdbi.withHandle(handle -> {
                    Query query = handle.createQuery("SELECT username FROM account_customers WHERE id_user_gg = :id_user_fb_gg AND id_type_acc= :typeAcc");
                    query.bind("id_user_fb_gg", id_user_fb_gg);
                    query.bind("typeAcc", typeAcc);
                    return query.mapTo(Customer.class).list();
                });

                if (customers.size() == 1) {
                    return true;
                }

            }
            return false;

        } catch (Exception e) {
            return false;
        }
    }

    public static int createAccPro(Jdbi jdbi, Customer infor, int typeAcc, Log logCreateAcc, Log logSignIn) {

          /*
            - b1 : ghi thông tin tài khoản FB/GG của customer vào bảng account_customers
            - b2 : ghi log tạo tài khoản vào bảng logs
            - b3 : ghi log đăng nhập vào bảng logs
            - b4 : trả về kết quả
                   + nếu = 1 thì tài khoản được tạo thành công và cho phép đăng nhập vào hệ thống
                   + nếu = 0 thì tài khoản không được tạo và không thể được đăng nhập vào hệ thống
                   + nếu = -1 thì có nghĩa là đã xảy ra lỗi

            Author : Minh Tuyên
         */

        try {
            return jdbi.withHandle(handle -> {

                Update update = null;
                if (typeAcc == FacebookUtils.ACC_FACEBOOK) {

                    update = handle.createUpdate("INSERT INTO account_customers(id_status_acc,id_city,username,pass,full_name,emai_customer,id_type_acc,id_user_fb) VALUES (1,0,:username,:pass,:full_name,:email_customer,:id_type_acc,:id_user_fb)");
                    update.bind("username", "FB" + infor.getId_user_fb())
                            .bind("pass", infor.getId_user_fb() + "@fb123")
                            .bind("full_name", infor.getFullname())
                            .bind("email_customer", infor.getEmail_customer())
                            .bind("id_type_acc", FacebookUtils.ACC_FACEBOOK)
                            .bind("id_user_fb", infor.getId_user_fb());

                } else if (typeAcc == GoogleUtils.ACC_GOOGLE) {

                    update = handle.createUpdate("INSERT INTO account_customers(id_status_acc,id_city,username,pass,full_name,emai_customer,id_type_acc,id_user_gg) VALUES (1,0,:username,:pass,:full_name,:email_customer,:id_type_acc,:id_user_gg)");
                    update.bind("username", "GG" + infor.getId_user_gg())
                            .bind("pass", infor.getId_user_gg() + "@gg123")
                            .bind("full_name", infor.getFullname())
                            .bind("email_customer", infor.getEmail_customer())
                            .bind("id_type_acc", GoogleUtils.ACC_GOOGLE)
                            .bind("id_user_gg", infor.getId_user_gg());

                }

                try {
                    handle.begin(); // bắt đầu một Transaction
                    int numRowInsert = update.execute();
                    if (numRowInsert > 0) {

                        logCreateAcc.insert(jdbi); // -> ghi log tạo tài khoản vào bảng Log
                        logSignIn.insert(jdbi); // -> ghi log đăng nhập vào bảng Log

                        handle.commit();
                        return 1;
                    }
                } catch (Exception e) {

                    handle.rollback();
                    return -1;
                }

                return 0;
            });

        } catch (Exception e) {

            return -1;
        }

    }
}
