/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.csueb.cs3520.utils;

import edu.csueb.cs3520.bean.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ryan Rigato
 */
public class DBUtils {
    
    public static Connection conn = null;
    
    private static String url = "jdbc:mysql://localhost:3306/cs3520";
    private static String username ="root";
    private static String password = "forCS";
    
    public static Connection getConnection(){
        
        try{
            if (conn == null){
                
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, username, password);
                System.out.println("connected");
            }

            } catch(Exception e){
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
        return conn;

    }

    public static List<User>  getUsers(){
                Connection connection = getConnection();
                ResultSet rs = null;
                Statement stmt = null;
                List <User> users = new ArrayList<User>();
                try{
                   stmt = connection.createStatement();
                     rs = stmt.executeQuery("Select * from User" 
                    );
                    //while there is a new row
                    

                    User user;
                    while(rs.next()){
                        //System.out.println("Name: " + rs.getString("firstname") + " " + rs.getString("lastname"));
                        user = new User(rs.getString("firstname"), rs.getString("lastname"), 
                                rs.getString("email"), rs.getString("username"));
                        users.add(user);
                    }
                }catch(Exception e){
                    e.printStackTrace();
                }finally{
                    try{
                        rs.close();
                        stmt.close();
                        connection.close();
                    }catch(Exception e){
                        
                    }
                }  
                
                return users;

            }
/*            
            public static boolean createUser(User user){
                Connection connection = getConnection();
                ResultSet rs = null;
                Statement stmt = null;
                boolean status = false;
                try{
                    stmt = connection.createStatement();
                 int rowCount =    stmt.executeUpdate("Insert INTO User(firstname, lastname, email, username, password)"
                            + "VALUES ( '" + user.getFirstname() + "', '" + user.getLastname() + "', '"+
                         user.getEmail() + "', '" + user.getUsername() + "', '" + user.getPassword() + "')");
                 
                 if (rowCount >0 ){
                     status = true;
                 }
                    
                }
                    
            catch(Exception e){
                
            }finally{
                   
            }
                return status;
                        
}*/
}