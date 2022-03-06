
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Helper {
    public static boolean deleteFile(String path){
        boolean f=false;
        try {
            File file = new File(path);
            f =file.delete();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public static boolean saveFile(InputStream is, String path){
       boolean f=false;
        try {
            byte b[] = new byte[is.available()];
            is.read(b);
            
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            fos.close();
            f=true;
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public static int countUsers(Connection con){
        int count=0;
        try {
            String q="select count(*) from user";
            PreparedStatement p = con.prepareStatement(q);
            ResultSet set=p.executeQuery();
            if(set.next()){
                count = set.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }
    
    public static int countPosts(Connection con){
        int count=0;
        try {
            String q="select count(*) from posts";
            PreparedStatement p = con.prepareStatement(q);
            ResultSet set=p.executeQuery();
            if(set.next()){
                count = set.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }
    
}
