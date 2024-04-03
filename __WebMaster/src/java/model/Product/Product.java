/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.Product;

/**
 *
 * @author lap21
 */
public class Product{
    int id;
    String productName;
    String thumbnail;
    String description;
    String type;
    float cost;
    String source;
    int purchased;
    float rate;

    public Product() {
    }

    public Product(int id, String productName, String thumbnail, String description, String type, float cost, String source, int purchased, float rate) {
        this.id = id;
        this.productName = productName;
        this.thumbnail = thumbnail;
        this.description = description;
        this.type = type;
        this.cost = cost;
        this.source = source;
        this.purchased = purchased;
        this.rate = rate;
    }

    public Product(String productName, String thumbnail, String description, String type, float cost, String source) {
        this.productName = productName;
        this.type = type;
        this.thumbnail = thumbnail;
        this.description = description;
        this.cost = cost;
        this.source = source;
    }

    public int getPurchased() {
        return purchased;
    }

    public float getRate() {
        return rate;
    }

    public String getType() {
        return type;
    }

    public int getId() {
        return id;
    }

    public String getProductName() {
        return productName;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public String getDescription() {
        return description;
    }

    public float getCost() {
        return cost;
    }    

    public String getSource() {
        return source;
    }

    public void setPurchased(int purchased) {
        this.purchased = purchased;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }
    
}
