/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LoginCreate;

import edu.csueb.cs3520.utils.AuthUtils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ryan
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
                String formType = request.getParameter("formType");
                String email = request.getParameter("email");

                String username = request.getParameter("username");

                String msg = "Blank!!!";

                if(formType != null && formType.equals("login")){
                    // handle a login request
                    request.setAttribute("msg", "Hi, you tried to login!!!!");
                    String password = request.getParameter("password");

                    //do some logic to validate credentials

                    //send to appropriate page

                    if (username != null && password!=null && AuthUtils.authenticate(username,password)){
                        request.setAttribute("username", username);
                        url = "/loginAccount.jsp";
                        request.setAttribute("msg", "Too Bad I haven't set up the database");
                    }
                    else{
                        request.setAttribute("errorMsg", "Please Login with correct username/password");
                        url="/index.jsp";
                    }
                } else if (formType.equals("create")){
                    // handle an account create
                    request.setAttribute("msg", "Too Bad I haven't set up the database");
                    request.setAttribute("username", username);
                    request.setAttribute("email", email);
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
