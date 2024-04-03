package model.Cart;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.MyDAO;
/**
 *
 * @author lap21
 */
public class CartDAO extends MyDAO {
    public List<Cart> getCartOf(String xEmail) {
           List<Cart> t = new ArrayList<>();
           xSql = "select * from Cart where email=?";
           try {
             ps = con.prepareStatement(xSql);
             ps.setString(1, xEmail);
             rs = ps.executeQuery();
             while(rs.next()) {
               int xId = rs.getInt("id");
               int xProductID = rs.getInt("ProductID");
               Cart x = new Cart(xId, xProductID, xEmail);
               t.add(x);
             }
             rs.close();
             ps.close();
            }
            catch(SQLException e) {
            }
        return(t);
    }
    public void addCart(int xProductID, String xEmail){
        xSql = "INSERT INTO Cart([ProductID], [email]) VALUES (?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, xProductID);
            ps.setString(2, xEmail);
            ps.executeUpdate();
            ps.close();
       }     
       catch(SQLException e) {
       }
    }
    public boolean isAddedCart(int xProductID, String xEmail){
        xSql = "SELECT * FROM Cart WHERE [ProductID]= "+ xProductID +" AND [email]= " + "'"+ xEmail +"'";
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
    public int getCartId(int xProductID, String xEmail){
        xSql = "SELECT * FROM Cart WHERE [ProductID]= "+ xProductID +" AND [email]= " + "'"+ xEmail +"'";
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
    public void deleteByID(int xId){
     xSql = "delete from Cart where id=?";
     try {
        ps = con.prepareStatement(xSql);
        ps.setInt(1, xId);
        ps.executeUpdate();
        //con.commit();
        ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    }
}
