/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LoginCreate;

import edu.csueb.cs3520.bean.User;
import edu.csueb.cs3520.utils.AuthUtils;
import edu.csueb.cs3520.utils.DBUtils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ryan
 * 
 * Servlet that handles the logic behind logining and creating an account
 * Forwards to either loginAccount.jsp or createAccount.jsp
 * 
 * 
 */
public class LoginCreate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


                String url = "/createAccount.jsp";

                try{
                    /*
                    gets the hidden value of the formType,
                    */
                String formType = request.getParameter("formType");
                
                /*
                Gets the email and username from the request scope
                */
                String email = request.getParameter("email");
                String username = request.getParameter("username");


                /*
                This block executes if the user is trying to login and
                clicks the submit button for login
                */
                if(formType != null && formType.equals("login")){
                    //gets the password from the request scope
                    String password = request.getParameter("password");
                      

                    //do some logic to validate credentials
                    
                    //checks if the user is an admin in the AuthUtils class
                    //if they are they are sent to the admin page
                    
                    if(AuthUtils.isAdmin(username, password)){
                        url = "/AdminServlet";  
                        
                    }else if (username != null && password!=null && AuthUtils.authenticate(username,password)){
                        request.setAttribute("username", username);
                        
                        //Creates a user object and stores it in the session scope
                        User user = new User();
                        user.setUsername(username);
                        
                        request.getSession().setAttribute("user", user);
                        url = "/loginAccount.jsp";
                        request.setAttribute("msg", "Thank you for signing in");
                        
                        

                    }
                    else{
                        request.setAttribute("errorMsg", "Please Login with correct username/password");
                        url="/index.jsp";
                    }
                } else if (formType.equals("create")){
                    // handle an account create
                    String firstname= request.getParameter("firstname");
                    String lastname = request.getParameter("lastname");
                    String password = request.getParameter("password");
 

                    request.setAttribute("username", username);
                    request.setAttribute("email", email);
                    
                    
                    //Adds a new User to the database from the 
                    if (firstname != null && lastname != null && email!= null && username!= null && password != null ){
                        
                        //Adds a new user to the user object
                        User user = new User(firstname, lastname, email, username, password);
                        
                        //places the user in the database
                        boolean success = DBUtils.createUser(user);
                        
                        //sends a message to a jsp dependent on whether the user was added to the database
                        //or not
                        if (success){
                             request.setAttribute("msg", "Thank you for creating an Account, please go to login");
                        }else
                        {
                           request.setAttribute("msg", "Error: Unable to create account, please try again");   
                        }
                        

                    }
                    url="/createAccount.jsp";
                }


        }catch(Exception e){
        System.err.println("Error occured in " + this.getClass());
        e.printStackTrace();
        }finally{
                            this.getServletContext().getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
