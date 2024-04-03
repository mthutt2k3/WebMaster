/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.Purchased;

import java.sql.Date;

/**
 *
 * @author lap21
 */
public class Purchased {
    int id;
    int ProductID;
    String email;
    Date date;

    public Purchased() {
    }

    public Purchased(int id, int ProductID, String email, Date date) {
        this.id = id;
        this.ProductID = ProductID;
        this.email = email;
        this.date = date;
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

    public Date getDate() {
        return date;
    }
}
