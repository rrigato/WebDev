/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.csueb.cs3520.utils;

/**
 *
 * @author Ryan
 */
public class AuthUtils {
        public static boolean authenticate(String username, String password){
            boolean status = false;
            if (username.equals("ryan")){
                status = true;
            }
            return status;
        }
    
}
