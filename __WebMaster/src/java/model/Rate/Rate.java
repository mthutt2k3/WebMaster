/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.Rate;

/**
 *
 * @author lap21
 */
public class Rate {
    int ProductID;
    String email;
    int rate;

    public Rate(int ProductID, String email, int rate) {
        this.ProductID = ProductID;
        this.email = email;
        this.rate = rate;
    }

    public Rate() {
    }
}
