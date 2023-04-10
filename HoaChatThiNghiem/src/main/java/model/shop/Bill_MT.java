package model.shop;

public class Bill_MT {

    // đây là class được tạo bởi Minh Tuyên

    private String nameCustomer;
    private String phoneCustomer;
    private String emailCustomer;
    private String city;
    private String district;
    private String ward;
    private String address;

    private double bill_price_before;

    public Bill_MT(String nameCustomer, String phoneCustomer, String emailCustomer, String city, String district, String ward, String address, double bill_price_before) {
        this.nameCustomer = nameCustomer;
        this.phoneCustomer = phoneCustomer;
        this.emailCustomer = emailCustomer;
        this.city = city;
        this.district = district;
        this.ward = ward;
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

    public String getCity() {
        return city;
    }

    public String getDistrict() {
        return district;
    }

    public String getWard() {
        return ward;
    }

    public String getAddress() {
        return address;
    }

    public double getBill_price_before() {
        return bill_price_before;
    }
}
