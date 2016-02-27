/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.csueb.cs3520.utils;

import edu.csueb.cs3520.bean.User;
import static java.nio.file.Files.list;
import static java.util.Collections.list;
import java.util.List;

/**
 *
 * @author Ryan
 * 
 * Authenticates login when called
 * Authenticates user password and username  when called
 * password and username are provided by loginCreate
 */
public class AuthUtils {
    
      /*
         Gets a userlist from the database, and returns true if they do,
         false otherwise
     */
        public static boolean authenticate(String username, String password){



            List <User> userlist  = DBUtils.getPass(); 

            return searchList(userlist, username, password);
            
            
           
        }
        
        /*
         Every row that is returned by the database is iterated through.
         if the username and password provided by a user in LoginCreate.java
         match, then the function returns true. Otherwise it returns false
         */
        
        public static boolean searchList(List<User> list, String username, String password) {
                for (int i = 0; i < list.size(); i++){
                    if (list.get(i).getUsername().equals(username)
                        && list.get(i).getPassword().equals(password) )
                    {
                        return true;
                    }
                }
                   return false;
            }
        
        
        /*
         Checks if a user is an Admin, currently their is only one admin 'admin'
         However, this can be changed by simply using the roleid in the database
         and querying the database looking for user who match those privledges
         */
        
        public static boolean isAdmin(String username, String password){
            
            List <User> userlist  = DBUtils.getPass(); 

            
            if (username.equals("admin") ){
               return searchList(userlist, username, password);
                
            }
            return false;
        }
    
}
