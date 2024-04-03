/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.Cart;

/**
 *
 * @author lap21
 */
public class Cart {
    int id;
    int ProductID;
    String email;

    public Cart() {
    }

    public Cart(int id, int ProductID, String email) {
        this.id = id;
        this.ProductID = ProductID;
        this.email = email;
    }
    public Cart(int ProductID, String email) {
        this.ProductID = ProductID;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public int getProductID() {
        return ProductID;
    }

    public String getEmail() {
        return email;
    }
}
