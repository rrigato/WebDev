/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LoginCreate;

import edu.csueb.cs3520.bean.User;
import edu.csueb.cs3520.utils.DBUtils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ryan Rigato
 * 
 * Sets a userlist object to the request scope and
 * forwards control to admin.jsp
 * 
 * The adminservlet places a userlist in the request scope 
 * 
 * And can be user for formType edit or delete
 */
public class AdminServlet extends HttpServlet {

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
        

        
        /*
            Gets the value of the formType which determines whether the admin
            wants to edit or delete a user.
        
        */
          String type  = request.getParameter("formType");
          /*
          This if statement is chosen if the admin selected the edit modal
          If this is the case, a new user object is created and 
          the firstname, lastname, username, email and password are stored
          in that object.
          
          The user object is then passed to DBUtils, where the changes are
          updated into the database
          */
        if(null != type && type.equals("edit")){

                               User user = new User( );
                               user.setFirstname(request.getParameter("firstname"));
                               user.setLastname(request.getParameter("lastname"));
                               user.setUsername(request.getParameter("username"));
                               user.setPassword(request.getParameter("password"));
                               user.setEmail(request.getParameter("email"));

                               DBUtils.updateUser(user);
        }
        
        
                        

         /*
        This if statement is if the admin selected the delete modal from the
        admin page.
        The admin types in the email of the user he wants to delete, and the 
        user is taken from the request scope and placed into a new user object
        
        This user object is sent to the DBUtils class where the row is deleted 
        from the database
        */                                              
        if(null != type && type.equals("delete")){
  

                               User user = new User( );

                               user.setEmail(request.getParameter("email"));
                               
                               DBUtils.deleteUser(user);
        }
       
        
        
        List <User> userlist  = DBUtils.getUsers(); 

  
        
        request.setAttribute("userlist", userlist);
        this.getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);

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
