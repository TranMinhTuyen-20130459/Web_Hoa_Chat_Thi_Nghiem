package model.shop;

public class Bill_MT {

    // đây là class được tạo bởi Minh Tuyên

    private String nameCustomer;
    private String phoneCustomer;
    private String emailCustomer;
    private String to_province_name;
    private String to_district_name;
    private String to_ward_name;
    private String address;

    private String from_province_id;

    private String from_district_id;

    private String from_ward_id;

    private String to_province_id;

    private String to_district_id;

    private String to_ward_id;

    private double ship_price;
    private double bill_price_before;

    public Bill_MT(String nameCustomer, String phoneCustomer, String emailCustomer, String to_province_name, String to_district_name, String to_ward_name, String address, String from_province_id, String from_district_id, String from_ward_id, String to_province_id, String to_district_id, String to_ward_id, double ship_price, double bill_price_before) {
        this.nameCustomer = nameCustomer;
        this.phoneCustomer = phoneCustomer;
        this.emailCustomer = emailCustomer;
        this.to_province_name = to_province_name;
        this.to_district_name = to_district_name;
        this.to_ward_name = to_ward_name;
        this.address = address;
        this.from_province_id = from_province_id;
        this.from_district_id = from_district_id;
        this.from_ward_id = from_ward_id;
        this.to_province_id = to_province_id;
        this.to_district_id = to_district_id;
        this.to_ward_id = to_ward_id;
        this.ship_price = ship_price;
        this.bill_price_before = bill_price_before;
    }

    public Bill_MT(String nameCustomer, String phoneCustomer, String emailCustomer, String to_province_name, String to_district_name, String to_ward_name, String address, double bill_price_before) {
        this.nameCustomer = nameCustomer;
        this.phoneCustomer = phoneCustomer;
        this.emailCustomer = emailCustomer;
        this.to_province_name = to_province_name;
        this.to_district_name = to_district_name;
        this.to_ward_name = to_ward_name;
        this.address = address;
        this.bill_price_before = bill_price_before;
    }

    public String getNameCustomer() {
        return nameCustomer;
    }

    public String getPhoneCustomer() {
        return phoneCustomer;
    }

    public String getEmailCustomer() {
        return emailCustomer;
    }

    public String getProvinceName() {
        return to_province_name;
    }

    public String getDistrictName() {
        return to_district_name;
    }

    public String getWardName() {
        return to_ward_name;
    }

    public String getAddress() {
        return address;
    }

    public double getBill_price_before() {
        return bill_price_before;
    }
}
