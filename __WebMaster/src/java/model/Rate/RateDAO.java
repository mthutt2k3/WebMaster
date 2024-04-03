/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.Rate;

import java.sql.SQLException;
import model.MyDAO;

/**
 *
 * @author lap21
 */
public class RateDAO extends MyDAO{
    public boolean isRated(int xProductID, String xEmail){
        xSql = "SELECT * FROM Rate WHERE [ProductID]= "+ xProductID +" AND [email]= " + "'"+ xEmail +"'";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            if(rs.next()) {
                return true;
            }
            rs.close();
            ps.close();
       }     
       catch(SQLException e) {
       }
       return false;
    }
    public void rate(int xProductID, String xEmail, int xRate){
        xSql = "INSERT INTO Rate ([ProductID], [email], [rate]) VALUES (?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, xProductID);
            ps.setString(2, xEmail);
            ps.setInt(3, xRate);
            ps.executeUpdate(); 
            ps.close();
       }     
       catch(SQLException e) {
       }
    }
}
