
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import java.sql.*;
public class categoryDao {
    Connection con;

    public categoryDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveCat(Category cat){
        boolean f=false;
        try {
            String q = "insert into categories(name,description) values(?,?)";
            PreparedStatement p = this.con.prepareStatement(q);
            p.setString(1, cat.getName());
            p.setString(2,cat.getDescription());
            p.executeUpdate();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean deleteCategory(int cid) {
        boolean f = false;
        try {
            String q = "DELETE FROM categories WHERE cid=?";
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, cid);
            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
