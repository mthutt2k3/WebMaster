/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.Blogs;

import model.Blogs.Blogs;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.MyDAO;

/**
 *
 * @author lap21
 */
public class BlogsDAO extends MyDAO{
    public List<Blogs> getListBlogs() {
           List<Blogs> t = new ArrayList<>();
           xSql = "select * from Blogs";
           try {
             ps = con.prepareStatement(xSql);
             rs = ps.executeQuery();
             while(rs.next()) {
               int xId = rs.getInt("id");
               String xTitle = rs.getString("title");
               String xPath = rs.getString("path");
               String xDescription = rs.getString("description");
               Blogs x = new Blogs(xId, xTitle, xPath, xDescription);
               t.add(x);
             }
             rs.close();
             ps.close();
            }
            catch(SQLException e) {
            }
           return(t);
    }
    
    public List<Blogs> searchBlog(String xString) {
           List<Blogs> t = new ArrayList<>();
           xSql = "select * from Blogs WHERE title like '%" + xString + "%' or description like '%" + xString + "%'";
           try {
             ps = con.prepareStatement(xSql);
             rs = ps.executeQuery();
             while(rs.next()) {
                int xId = rs.getInt("id");
                String xTitle = rs.getString("title");
                String xPath = rs.getString("path");
                String xDescription = rs.getString("description");
                Blogs x = new Blogs(xId, xTitle, xPath, xDescription);
                t.add(x);
             }
             rs.close();
             ps.close();
            }
            catch(SQLException e) {
            }
           return(t);
    }
    
    
    public Blogs getBlog(int id) {
     Blogs x = null;
     xSql = "select * from Blogs where id=?"; 
     try {
      ps = con.prepareStatement(xSql);
      ps.setInt(1, id);
      rs = ps.executeQuery();
      if(rs.next()){
            String xTitle = rs.getString("title");
            String xPath = rs.getString("path");
            String xDescription = rs.getString("description");
            x = new Blogs(id, xTitle, xPath, xDescription);
      }
      rs.close();
      ps.close();
     }     
     catch(SQLException e) {
     }
     return(x);
    }

}
