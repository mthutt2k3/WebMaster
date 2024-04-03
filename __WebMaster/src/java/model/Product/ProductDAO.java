/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.Product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.MyDAO;

/**
 *
 * @author lap21
 */
public class ProductDAO extends MyDAO{
    public List<Product> getListProduct() {
           List<Product> t = new ArrayList<>();
           xSql = "select * from Product";
           try {
             ps = con.prepareStatement(xSql);
             rs = ps.executeQuery();
             while(rs.next()) {
                int xId = rs.getInt("id");
                String xProductName = rs.getString("productName");
                String xThumbnail = rs.getString("thumbnail");
                String xDescription = rs.getString("description");
                String xType = rs.getString("type");
                float xCost = rs.getFloat("cost");
                String xSource = rs.getString("source");
                int purchased = rs.getInt("purchased");
                float rate = rs.getFloat("rate");
               Product  x = new Product(xId, xProductName, xThumbnail, xDescription, xType, xCost, xSource, purchased, rate);
               t.add(x);
             }
             rs.close();
             ps.close();
            }
            catch(SQLException e) {
            }
        return(t);
    }
    
    public Product getProduct(int xId) {
        Product x = null;
        xSql = "select * from Product where id=?"; 
        try {
         ps = con.prepareStatement(xSql);
         ps.setInt(1, xId);
         rs = ps.executeQuery();
         if(rs.next()){
                String xProductName = rs.getString("productName");
                String xThumbnail = rs.getString("thumbnail");
                String xDescription = rs.getString("description");
                String xType = rs.getString("type");
                float xCost = rs.getFloat("cost");
                String xSource = rs.getString("source");
                int purchased = rs.getInt("purchased");
                float rate = rs.getFloat("rate");
               x = new Product(xId, xProductName, xThumbnail, xDescription, xType, xCost, xSource, purchased, rate);
         }
         rs.close();
         ps.close();
        }     
        catch(SQLException e) {
        }
        return(x);
    }
    public boolean isNameExist(String xProductName) {
        xSql = "select * from Product where productName='" + xProductName + "'"; 
        try {
         ps = con.prepareStatement(xSql);
         rs = ps.executeQuery();
         if(rs.next()){
               return true;
         }
         rs.close();
         ps.close();
        }     
        catch(SQLException e) {
        }
        return false;
    }
    public boolean isSourceExist(String xSource) {
        xSql = "select * from Product where source='" + xSource + "'"; 
        try {
         ps = con.prepareStatement(xSql);
         rs = ps.executeQuery();
         if(rs.next()){
               return true;
         }
         rs.close();
         ps.close();
        }     
        catch(SQLException e) {
        }
        return false;
    }
    
    public List<Product> searchByType(String sType) {
           List<Product> t = new ArrayList<>();
           xSql = "select * from Product where type like'%" + sType + "%'";
           try {
             ps = con.prepareStatement(xSql);

             rs = ps.executeQuery();
             while(rs.next()) {
                int xId = rs.getInt("id");
                String xProductName = rs.getString("productName");
                String xThumbnail = rs.getString("thumbnail");
                String xDescription = rs.getString("description");
                String xType = rs.getString("type");
                float xCost = rs.getFloat("cost");
                String xSource = rs.getString("source");
                int purchased = rs.getInt("purchased");
                float rate = rs.getFloat("rate");
                Product x = new Product(xId, xProductName, xThumbnail, xDescription, xType, xCost, xSource, purchased, rate);
                t.add(x);
            }
             rs.close();
             ps.close();
            }
            catch(SQLException e) {
            }
        return(t);
    }
    
    public List<Product> searchProduct(String xString) {
           List<Product> t = new ArrayList<>();
           xSql = "select * from Product WHERE productName like '%" + xString + "%' or description like '%" + xString + "%'";
           try {
             ps = con.prepareStatement(xSql);
             rs = ps.executeQuery();
             while(rs.next()) {
                int xId = rs.getInt("id");
                String xProductName = rs.getString("productName");
                String xThumbnail = rs.getString("thumbnail");
                String xDescription = rs.getString("description");
                String xType = rs.getString("type");
                float xCost = rs.getFloat("cost");
                String xSource = rs.getString("source");
                int purchased = rs.getInt("purchased");
                float rate = rs.getFloat("rate");
                Product x = new Product(xId, xProductName, xThumbnail, xDescription, xType, xCost, xSource, purchased, rate);
                t.add(x);
                }
             rs.close();
             ps.close();
            }
            catch(SQLException e) {
            }
        return(t);
    }
    public List<Product> orderBy(String xColName, String xSortType){
        List<Product> t = new ArrayList<>();
        xSql = "select * from Product order by [" + xColName + "] " + xSortType;
        try {
             ps = con.prepareStatement(xSql);
             rs = ps.executeQuery();
             while(rs.next()) {
                int xId = rs.getInt("id");
                String xProductName = rs.getString("productName");
                String xThumbnail = rs.getString("thumbnail");
                String xDescription = rs.getString("description");
                String xType = rs.getString("type");
                float xCost = rs.getFloat("cost");
                String xSource = rs.getString("source");
                int purchased = rs.getInt("purchased");
                float rate = rs.getFloat("rate");
               Product  x = new Product(xId, xProductName, xThumbnail, xDescription, xType, xCost, xSource, purchased, rate);
               t.add(x);
             }
             rs.close();
             ps.close();
            }
            catch(SQLException e) {
            }
        return(t);
    }
    
    public void insert(Product x) {
     xSql = "INSERT INTO Product([productName], [thumbnail], [description], [type], [cost], [source]) VALUES (?,?,?,?,?,?)"; 
     try {
      ps = con.prepareStatement(xSql);
      ps.setString(1, x.getProductName());
      ps.setString(2, x.getThumbnail());
      ps.setString(3, x.getDescription());
      ps.setString(4, x.getType());
      ps.setFloat(5, x.getCost());
      ps.setString(6, x.getSource());
      ps.executeUpdate();
      ps.close();
     }     
     catch(SQLException e) {
     }
  }
    public void update(int xId, Product x) {
         xSql = "update Product set [productName]=?, [thumbnail]=?, [description]=?, [type]=?, [cost]=?, [source]=? where id=?";
         try {      
            ps = con.prepareStatement(xSql);
            ps.setString(1, x.getProductName());
            ps.setString(2, x.getThumbnail());
            ps.setString(3, x.getDescription());
            ps.setString(4, x.getType());
            ps.setFloat(5, x.getCost());
            ps.setString(6, x.getSource());
            ps.setInt(7, xId);
            ps.executeUpdate();
            ps.close();
         }
          catch(SQLException e) {
          }
    }
    public void delete(int xId){
     xSql = "DELETE from Product where id=?";
     try {
        ps = con.prepareStatement(xSql);
        ps.setInt(1, xId);
        ps.executeUpdate();
        //con.commit();
        ps.close();
     }
     catch(SQLException e) {
     }
  }
    
}
