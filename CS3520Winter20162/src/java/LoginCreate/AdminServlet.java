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
        

        
        
        //hard coded values that will be used for dynamic table using jstl tags
        //Can Change this in the future so that it checks which users are logged in
        //DBUtils.getUsers();
          String type  = request.getParameter("formType");
        if(null != type && type.equals("edit")){
       //     String firstname = request.getParameter("firstname");
         //        String lastname = request.getParameter("lastname");
           //             String username = request.getParameter("username");
             //                  String password = request.getParameter("password");

                               User user = new User( );
                               user.setFirstname(request.getParameter("firstname"));
                               user.setLastname(request.getParameter("lastname"));
                               user.setUsername(request.getParameter("username"));
                               user.setPassword(request.getParameter("password"));
                               user.setEmail(request.getParameter("email"));

                               DBUtils.updateUser(user);
        }
        
        
       
        
        
        List <User> userlist  = DBUtils.getUsers(); 

  



//new ArrayList<User>();
 /*      userlist.add( new User("John", "Smith", "jsmith@gmail.com", "jsmith"));
        
        userlist.add( new User("Jane", "Smith", "jane.smith@gmail.com", "jane.smith"));
        userlist.add(new User("John", "Doe", "jdoe@gmail.com", "jdoe.smith"));
        userlist.add( new User("Jane", "Doe", "jane.doe@gmail.com", "jane.doe"));
        
        userlist.add(new User("ryan", "rigato", "rrigato@gmail.com", "r.rigato"));*/
        
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
