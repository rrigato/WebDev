<%-- 
    Document   : admin
    Created on : Jan 27, 2016, 6:35:44 PM
    Author     : Ryan Rigato

This is the admin page that displays who is logged in
Depends on the Admin Servlet 

Admin.jsp is only seen by the admin when he logs in.
The admin page gets a user table from the database.

The admin can edit or delete a user from this page.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="include/styles/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="include/styles/confirmation.css" type="text/css"/> 
        <title>Administration Page</title>
    </head>
        <%--import header --%>
        <c:import url="Header.jsp"/>
    <body>
        <%-- Prepopulates the modal that comes up with 
         the information from the row--%>
        <script>
            //document.ready waits until all the dom objects are loaded
                        //befor it calls the anonymous funciton            
                        $(document).ready(function(){
                         
                           $(".edit-button").click(function(){
                               /*
                                * gets the email from the id
                                and the rest of the fields from the row it is 
                                closest too
                                */
                                var $email = $(this).attr("id");
                                var $tableRow =  $(this).closest("tr");
                                var $firstname = $tableRow.children(".firstname-cell").text();
                                var $lastname = $tableRow.children(".lastname-cell").text();
                                var $username = $tableRow.children(".username-cell").text();
                                var $password = $tableRow.children(".password-cell").text();
                             
                             
                             //id selector that places the variables above into the fields
                             $("#email-field").val($email);
                             $("#firstname-field").val($firstname);
                             $("#lastname-field").val($lastname);
                             $("#username-field").val($username);
                             $("#password-field").val($password);

                             
                             });
                        });
                        
                        
                        
        </script>
           
        <div class="container">
        <h1>Welcome to the Admin Page!!!</h1>
         <p>You are logged in as: ${sessionScope.user.username}</p>
         <table class="table">
             <tr>
                 <th>First Name</th>
                 <th>Last Name</th>
                 <th>Email</th>
                 <th>Username</th>
                 <th>Action(s)</th>
                 <th>Action2</th>
             </tr>
             
                     <%--Runs for each user provided by adminServlet --%>
             <c:forEach var="user" items = "${requestScope.userlist}">
                 <tr>
                     <td class="firstname-cell">${user.firstname}</td>
                     <td class="lastname-cell">${user.lastname}</td>
                     <td class ="email-cell">${user.email}</td>
                     <td class = "username-cell">${user.username}</td>
                     <td>
                         <!-- Trigger the modal with a button 
                         
                         -->
                                <button class ="edit-button" id = "${user.email}" type="button" 
                                        data-toggle="modal" data-target="#editForm">Edit</button>

                     </td>
                     <%-- Triggers the delete modal --%>
                     <td>
                          <button class ="delete-button" id = "${user.email}" type="button" 
                                        data-toggle="modal" data-target="#deleteForm">Delete</button>
                     </td>
                 </tr>
                 
             </c:forEach>
         </table>
             
             
             <!-- Edit Modal -->
                    <div id="editForm" class="modal fade" role="dialog">
                      <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Modal Header</h4>
                          </div>
                          <div class="modal-body">
                            <%--All of these fields are populated by the javascript
                                once they are recieved by the AdminServlet they
                               are changed on the backend.
                               
                               Maps information to AdminServlet which then gives that
                               data to the JDBC driver to change the backend.
                               --%>
                                    <form action="AdminServlet" method="post" class = "form-horizontal" role = "form">
                                  <input  type="hidden" name="formType" value="edit"/>
                                  <input id ="email-field" type ="hidden" name ="email"/>
                                      <div class="row">
                                          <div class="col-md-2">
                                              <label class="control-label">FirstName</label>
                                          </div>
                                          <div class="col-md-10">
                                              <input id ="firstname-field" type="text" name="firstname"/>
                                          </div>
                                      </div>

                                      <div class="row">
                                          <div class="col-md-2">
                                              <label class="control-label">Lastname</label>
                                          </div>
                                          <div class="col-md-10">
                                              <input id ="lastname-field" type="text" name="lastname"/>
                                          </div>
                                      </div>

                                      <div class="row">
                                          <div class="col-md-2">
                                              <label class="control-label">Username</label>
                                          </div>
                                          <div class="col-md-10">
                                              <input id="username-field" type="text" name="username"/>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-2">
                                              <label>Password</label>
                                          </div>
                                          <div class="col-md-10">
                                              <input id="password-field" type="password" name="password"/>
                                          </div>
                                      </div>
                                      <input type ="submit" id="btn"/>
                                  </form> 
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          </div>
                        </div>

                      </div>
                    </div>
             
             <!-- Delete Modal -->
                    <div id="deleteForm" class="modal fade" role="dialog">
                      <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Modal Header</h4>
                          </div>
                          <div class="modal-body">
<%-- Admin needs to enter the email address to delete --%>   
                              <p> Are you sure you want to delete this user. Please
                              re-enter their email to confirm.</p>
  
                            <form action="AdminServlet" method="post" class = "form-horizontal" role = "form">
                                  <input  type="hidden" name="formType" value="delete"/>
                                   <div class="row">
                                          <div class="col-md-2">
                                              <label class="control-label">Email</label>
                                          </div>
                                          <div class="col-md-10">
                                              <input id ="email-field" type="text" name="email"/>
                                          </div>
                                      </div>
                                  <input type ="submit" id="btn"/>
                                    </form> 
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          </div>
                        </div>

                      </div>
                    </div>
             
             
         </div>
         
       <c:import url="footer.jsp"/>
    </body>
</html>
