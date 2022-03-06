
package com.tech.blog.dao;
import com.tech.blog.entities.User;
import java.sql.*;
import java.util.ArrayList;
public class userDao {
    private Connection con;

    public userDao(Connection con) {
        this.con = con;
    }
     public boolean saveUser(User user){
         boolean f=false;
         try{
             String q ="insert into user(Name,Email,password,gender,about) values(?,?,?,?,?)";
             PreparedStatement pstmt = this.con.prepareStatement(q);
             pstmt.setString(1,user.getName());
             pstmt.setString(2,user.getEmail());
             pstmt.setString(3,user.getPassword());
             pstmt.setString(4,user.getGender());
             pstmt.setString(5,user.getAbout());
             
             pstmt.executeUpdate();
             f=true;
         }
         catch(Exception e){
             e.printStackTrace();
         }
         return f;
     }
     
     //get user by useremail and password
      
     public User getUserByEmailAndPassword(String email ,String password){
         User user =null;
         try {
             String q ="select * from user where Email=? and password=?";
             PreparedStatement pstmt = con.prepareStatement(q);
             pstmt.setString(1, email);
             pstmt.setString(2, password);
             
            ResultSet set = pstmt.executeQuery();
            if(set.next()){
                user = new User();
                user.setId(set.getInt("userId"));
                user.setName(set.getString("Name"));
                user.setEmail(set.getString("Email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDatetime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                user.setTypel(set.getString("typel"));
            }
            
             
             
         } catch (Exception e) {
             e.printStackTrace();
         }
         return user;
     }
     
     public boolean updateUser(User user){
         boolean f= false;
         try {
             String q = "update user set Name=? ,Email=? ,password=?, gender=? ,about=? ,profile=? where userId=?";
             PreparedStatement pstmt = con.prepareStatement(q);
             pstmt.setString(1,user.getName());
             pstmt.setString(2,user.getEmail());
             pstmt.setString(3,user.getPassword());
             pstmt.setString(4,user.getGender());
             pstmt.setString(5,user.getAbout());
             pstmt.setString(6,user.getProfile());
             pstmt.setInt(7,user.getId());
             
             pstmt.executeUpdate();
             f=true;

             
         } catch (Exception e) {
             e.printStackTrace();
         }
         return f;
     }
     
     public User getUserByUserId(int userId){
         User user = null;
         try {
             String q ="select * from user where userId=?";
             PreparedStatement p = this.con.prepareStatement(q);
             p.setInt(1, userId);
             ResultSet set = p.executeQuery();
             if(set.next()){
                String name=set.getString("Name");
                String email=set.getString("Email");
                String password=set.getString("password");
                String gender=set.getString("gender");
                String about=set.getString("about");
                
                user = new User(name, email, password, gender, about);
                
                
                
                
                
             }
             
         } catch (Exception e) {
             e.printStackTrace();
         }
         return user;
     }
     
     public ArrayList<User> getAllUsers(){
          ArrayList<User>  list = new ArrayList<>();
        try {
            String q ="select * from user";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while(set.next()){
                int id = set.getInt("userId");
                String name=set.getString("Name");
                String email = set.getString("Email");
                String password = set.getString("password");
                String gender = set.getString("gender");
                String about = set.getString("about");
                Timestamp rdate = set.getTimestamp("rdate");
                String profile = set.getString("profile");
                String type = set.getString("typel");
                User u = new User(id, name, email, password, gender, about, rdate,profile, type);
                list.add(u);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
     }
     
     
     public boolean deleteUser(int userid){
         boolean f=false;
         try {
             String q ="DELETE FROM user WHERE userId=?";
             PreparedStatement p = this.con.prepareStatement(q);
             p.setInt(1, userid);
             p.executeUpdate();
             f=true;
             
         } catch (Exception e) {
             e.printStackTrace();
         }
         return f;
     }
}

