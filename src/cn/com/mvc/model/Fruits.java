package cn.com.mvc.model;

public class Fruits {
    private String name;  //水果的名字
    private double price;//水果的价格
    private String production_area;//水果的产地

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getProduction_area() {
        return production_area;
    }

    public void setProduction_area(String production_area) {
        this.production_area = production_area;
    }
}
