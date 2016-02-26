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
       
        //connects to the database on port 3306
        private static String url = "jdbc:mysql://localhost:3306/cs3520";

        //username and password to the dataset
        private static String username ="root";
        private static String password = "forCS";
    
    //returns a connection to the database    
    public static Connection getConnection(){
        try{
                  Class.forName("com.mysql.jdbc.Driver");
                    
                  //gets the connection by passing a url, username, and password
                  conn = DriverManager.getConnection(url, username, password);



            } catch(Exception e){
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
        //returns the connection object which is connected to the database
        return conn;

    }//getConnection function

    //This function returns a list of users from the database
    public static List<User>  getUsers(){
                Connection connection = getConnection();
                ResultSet rs ;
                rs = null;
                Statement stmt; 
                stmt = null;
                
                //initializing a list that will be used to return the users
                List <User> users = new ArrayList<User>();
                try{
                   stmt = connection.createStatement();
                   
                   //sql query to get the result from
                     rs = stmt.executeQuery("Select * from User" 
                    );
                    //while there is a new row
                    

                    User user;
                    
                    //rs.next() starts at -1 and goes to 0
                    //will return false when there are no more rows to read
                    while(rs.next()){
                        //System.out.println("Name: " + rs.getString("firstname") + " " + rs.getString("lastname"));
                        //uses the java bean to get the
                        //rs.attributeName with the name of the column in the string
                        user = new User(rs.getString("firstname"), rs.getString("lastname"), 
                                rs.getString("email"), rs.getString("username"));
                        //adds each to the userlist
                        users.add(user);
                    }
                }catch(Exception e){
                    e.printStackTrace();
                }finally{
                    try{
                    //if statements prevent closing the database from throwing a null pointer exception
                    if (rs != null){
                         rs.close();
                    }

                    if (stmt != null){
                        stmt.close();
                    }
                    if(connection != null)
                    {
                        connection.close();
                    }
                    
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                }  
                //returns the userlist to the servlet
                return users;

            }//getUsers method
            
    
            //This function creates a new user in the database
            public static boolean createUser(User user){
                    Connection connection = getConnection();
                    ResultSet rs = null;
                    Statement stmt = null;

                    //status that will be returned
                    boolean status = false;
                    try{
                        stmt = connection.createStatement();

                        //Inserts the user list into the database
                     int rowCount =    stmt.executeUpdate("Insert INTO User(firstname, lastname, email, username, password)"
                                + "VALUES ( '" + user.getFirstname() + "', '" + user.getLastname() + "', '"+
                             user.getEmail() + "', '" + user.getUsername() + "', '" + user.getPassword() + "')");

                     if (rowCount >0 ){
                         status = true;
                     }

                    }

                catch(Exception e){
                    e.printStackTrace();
                }finally{
                    try{
                        //if statements prevent closing the database from throwing a null pointer exception
                        if(rs != null){
                            rs.close();
                        }
                        if (stmt != null){
                            stmt.close();
                        }
                        if (connection != null){
                            connection.close();
                        }
                        }catch(Exception e){
                            e.printStackTrace();
                        }
                }
                    return status;
                        
            }//createUser method
            
            //update the a user attribute
            public static boolean updateUser(User user){
                    Connection connection = getConnection();
                    Statement stmt = null;

                    //status that will be returned
                    boolean status = false;
                    try{
                        stmt = connection.createStatement();

                        //Inserts the user list into the database
                     int rowCount =    stmt.executeUpdate("Update User SET firstname='"  + user.getFirstname() +
                             "', lastname='" + user.getLastname() +  
                             "', username = '" + user.getUsername() + 
                             "', password = '" + user.getPassword() + 
                             "' " + "WHERE email = '" + user.getEmail() + "'");

                     if (rowCount >0 ){
                         status = true;
                     }

                    }

                catch(Exception e){
                    e.printStackTrace();
                }finally{
                    try{
                        //if statements prevent closing the database from throwing a null pointer exception
                        if (stmt != null){
                            stmt.close();
                        }
                        if (connection != null){
                            connection.close();
                        }
                        }catch(Exception e){
                            e.printStackTrace();
                        }
                }
                    return status;
                        
            }//updateUser method
                        
                
            public static boolean deleteUser(User user){
                    Connection connection = getConnection();
                    Statement stmt = null;

                    //status that will be returned
                    boolean status = false;
                    try{
                        stmt = connection.createStatement();

                        //Inserts the user list into the database
                     int rowCount =    stmt.executeUpdate("DELETE FROM User "
                             + "WHERE email = '" + user.getEmail() + "'");

                     if (rowCount >0 ){
                         status = true;
                     }

                    }

                catch(Exception e){
                    e.printStackTrace();
                }finally{
                    try{
                        //if statements prevent closing the database from throwing a null pointer exception
                        if (stmt != null){
                            stmt.close();
                        }
                        if (connection != null){
                            connection.close();
                        }
                        }catch(Exception e){
                            e.printStackTrace();
                        }
                }
                    return status;
                        
            }//updateUser method            
            
            
            
            
                        
}//dbutils class