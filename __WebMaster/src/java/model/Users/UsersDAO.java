/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.Users;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.MyDAO;

/**
 *
 * @author lap21
 */
public class UsersDAO extends MyDAO {

    public List<Users> getListUsers() {
        List<Users> t = new ArrayList<>();
        xSql = "select * from Users";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String xFirstName = rs.getString("firstName");
                String xLastName = rs.getString("lastName");
                String xEmail = rs.getString("email");
                String xPassword = rs.getString("password");
                float xBalance = rs.getFloat("balance");
                boolean xRole = rs.getBoolean("role");
                boolean xPremium = rs.getBoolean("premium");
                Users x = new Users(xFirstName, xLastName, xEmail, xPassword, xBalance, xRole, xPremium);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public Users getUsersByEmail(String xEmail) {
        Users x = null;
        String xFirstName, xLastName, xPassword;
        boolean xRole, xPremium;
        xSql = "select * from Users where email=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, xEmail);
            rs = ps.executeQuery();
            if (rs.next()) {
                xFirstName = rs.getString("firstName");
                xLastName = rs.getString("lastName");
                xPassword = rs.getString("password");
                float xBalance = rs.getFloat("balance");
                xRole = rs.getBoolean("role");
                xPremium = rs.getBoolean("premium");
                x = new Users(xFirstName, xLastName, xEmail, xPassword, xBalance, xRole, xPremium);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public boolean isAdmin(String xEmail) {
        Users x = getUsersByEmail(xEmail);
        return x.isAdmin();
    }

    public void insert(Users x) {
        xSql = "INSERT INTO Users([firstName], [lastName], [email], [password], [balance], [role], [Premium]) VALUES (?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, x.getFirstName());
            ps.setString(2, x.getLastName());
            ps.setString(3, x.getEmail());
            ps.setString(4, x.getPassword());
            ps.setFloat(5, x.getBalance());
            ps.setBoolean(6, x.isAdmin());
            ps.setBoolean(7, x.isPremium());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteByEmail(String xEmail) {
        xSql = "delete from Users where email=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, xEmail);
            ps.executeUpdate();
            //con.commit();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Users> searchUsers(String xString) {
        List<Users> t = new ArrayList<>();
        xSql = "select * from Users WHERE firstName like '%" + xString + "%' or lastName like '%" + xString + "%'";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String xFirstName = rs.getString("firstName");
                String xLastName = rs.getString("lastName");
                String xEmail = rs.getString("email");
                String xPassword = rs.getString("password");
                float xBalance = rs.getFloat("balance");
                boolean xRole = rs.getBoolean("role");
                boolean xPremium = rs.getBoolean("premium");
                Users x = new Users(xFirstName, xLastName, xEmail, xPassword, xBalance, xRole, xPremium);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
        }
        return (t);
    }

    public List<Users> orderBy(String xColName, String xSortType) {
        List<Users> t = new ArrayList<>();
        xSql = "select * from Users order by [" + xColName + "] " + xSortType;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String xFirstName = rs.getString("firstName");
                String xLastName = rs.getString("lastName");
                String xEmail = rs.getString("email");
                String xPassword = rs.getString("password");
                float xBalance = rs.getFloat("balance");
                boolean xRole = rs.getBoolean("role");
                boolean xPremium = rs.getBoolean("premium");
                Users x = new Users(xFirstName, xLastName, xEmail, xPassword, xBalance, xRole, xPremium);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
        }
        return (t);
    }

    public void update(String xEmail, Users xUsers) {
        xSql = "update Users set firstName=?, lastName=?, password=?, balance=? where email=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, xUsers.getFirstName());
            ps.setString(2, xUsers.getLastName());
            ps.setString(3, xUsers.getPassword());
            ps.setFloat(4, xUsers.getBalance());
            ps.setString(5, xUsers.getEmail());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
        }
    }

    public void setRole(String xEmail, boolean role) {
        xSql = "update Users set role=? where email=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setBoolean(1, role);
            ps.setString(2, xEmail);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
        }
    }

    public void updateBalance(String xEmail, float balance) {
        xSql = "update Users set balance=? where email=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setFloat(1, balance);
            ps.setString(2, xEmail);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
        }
    }
}
