/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.Users;

/**
 *
 * @author lap21
 */
public class Users {
    String firstName;
    String lastName;
    String email;
    String password;
    float balance;
    boolean role;
    boolean premium;

    public Users() {
    }

    public Users(String firstName, String lastName, String email, String password, float balance, boolean role, boolean premium) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.balance = balance;
        this.role = role;
        this.premium = premium;
    }
    public Users(String firstName, String lastName, String email, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.role = false;
        this.premium = false;
    }
    public Users(String firstName, String lastName, String email, String password, float balance) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.balance = balance;
        this.role = false;
        this.premium = false;
    }
    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }
    
    public float getBalance() {
        return balance;
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }
    
    public boolean isAdmin() {
        return this.role;
    }

    public boolean isPremium() {
        return this.premium;
    }

//    public void setFirstName(String firstName) {
//        this.firstName = firstName;
//    }
//
//    public void setLastName(String lastName) {
//        this.lastName = lastName;
//    }
//
//    public void setEmail(String email) {
//        this.email = email;
//    }
//
//    public void setPassword(String password) {
//        this.password = password;
//    }
//
    public void setRole(boolean role) {
        this.role = role;
    }
//
//    public void setPremium(boolean premium) {
//        this.premium = premium;
//    }
}
