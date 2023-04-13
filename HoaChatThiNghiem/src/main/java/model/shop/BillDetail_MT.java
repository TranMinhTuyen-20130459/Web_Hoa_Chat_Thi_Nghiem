package model.shop;

public class BillDetail_MT {

    private int id_bill;
    private int id_product;
    private int quantity;
    private double listed_price;
    private double current_price;

    public BillDetail_MT(int id_bill, int id_product, int quantity, double listed_price, double current_price) {
        this.id_bill = id_bill;
        this.id_product = id_product;
        this.quantity = quantity;
        this.listed_price = listed_price;
        this.current_price = current_price;
    }

    public int getId_bill() {
        return id_bill;
    }

    public int getId_product() {
        return id_product;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getListed_price() {
        return listed_price;
    }

    public double getCurrent_price() {
        return current_price;
    }
}
