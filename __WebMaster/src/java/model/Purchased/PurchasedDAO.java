/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.Purchased;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Cart.CartDAO;
import model.MyDAO;
/**
 *
 * @author lap21
 */
public class PurchasedDAO extends MyDAO{
    public List<Purchased> purchasedListOf(String xEmail) {
           List<Purchased> t = new ArrayList<>();
           xSql = "select * from Purchased where email=? order by date DESC";
           try {
             ps = con.prepareStatement(xSql);
             ps.setString(1, xEmail);
             rs = ps.executeQuery();
             while(rs.next()) {
               int xId = rs.getInt("id");
               int xProductID = rs.getInt("ProductID");
               Date xDate = (java.sql.Date) rs.getDate("date");
               Purchased x = new Purchased(xId, xProductID, xEmail, xDate);
               t.add(x);
             }
             rs.close();
             ps.close();
            }
            catch(SQLException e) {
            }
        return(t);
    }
    
    public int isPurchased(int xProductID, String xEmail){
        xSql = "SELECT * FROM Purchased WHERE [ProductID]= "+ xProductID +" AND [email]= " + "'"+ xEmail +"'";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            if(rs.next()) {
                int xId = rs.getInt("id");
                return xId;
            }
            rs.close();
            ps.close();
       }     
       catch(SQLException e) {
       }
       return 0;
    }
    
    public void purchase(int xProductID, String xEmail){
        CartDAO cDAO = new CartDAO();
        int cID = cDAO.getCartId(xProductID, xEmail);
        if(cID != 0){
            cDAO.deleteByID(cID);
        }
        LocalDate currentDate = LocalDate.now();
        Date currentSqlDate = Date.valueOf(currentDate);
        xSql = "INSERT INTO Purchased ([ProductID], [email], [date]) VALUES (?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, xProductID);
            ps.setString(2, xEmail);
            ps.setDate(3, currentSqlDate);
            ps.executeUpdate();
            ps.close();
       }     
       catch(SQLException e) {
       }
    }
}
