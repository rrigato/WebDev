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
 */
public class AuthUtils {
        public static boolean authenticate(String username, String password){
//            boolean status = false;
//            if (username.equals("ryan") || username.equals("admin")){
//                status = true;
//            }
//            return status;


            List <User> userlist  = DBUtils.getPass(); 

            return searchList(userlist, username, password);
            
            
           
        }
        
        
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
        
        public static boolean isAdmin(String username, String password){
            
            List <User> userlist  = DBUtils.getPass(); 

            
            if (username.equals("admin") ){
               return searchList(userlist, username, password);
                
            }
            return false;
        }
    
}
