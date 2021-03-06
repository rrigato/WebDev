<%-- 
    Document   : index
    Created on : Jan 25, 2016, 8:24:47 PM
    Author     : Ryan

Login page where users can login or create an account
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
        <title>Ryan Rigato HW #2</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="include/js/jquery-1.12.0.js"></script>
        <script src="include/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="include/styles/confirmation.css" type="text/css"/>        

        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
    </head>
    <body>
        
        <%--import header --%>
        <c:import url="Header.jsp"/>        
        <div class="container">
            <div>
                <div class="row">
                    <h3>Create New Account:</h3>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <form action="createAccount" method="post">
                            <input type="hidden" name="formType" value="create"/>
                             <div class="row">
                                    <div class="col-md-2">
                                        <label class="control-label">FirstName</label>
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" name="firstname"/>
                                    </div>
                                </div>
                            
                             <div class="row">
                                    <div class="col-md-2">
                                        <label class="control-label">Lastname</label>
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" name="lastname"/>
                                    </div>
                                </div>
                            
                                <div class="row">
                                    <div class="col-md-2">
                                        <label class="control-label">Username</label>
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" name="username"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <label>Password</label>
                                    </div>
                                    <div class="col-md-10">
                                        <input type="password" name="password"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <label>Email</label>
                                    </div>
                                    <div class="col-md-10">
                                        <input type="email" name="email"/>
                                    </div>
                                </div>
                            <button type="submit" value="Create">Create</button>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <h3>Login To Existing Account:</h3>
                </div>
                <br>
                <div class="row">
                    <c:if test="${requestScope.errorMsg!=null}">
                        <%-- uses an if test in EL --%>                   
                        <div class="alert alert-warning" >${errorMsg == null?'There was an issue': errorMsg}</div>
                    </c:if>
                    <div class="col-md-12">
                        <form action="loginAccount" method="post">
                            <input type="hidden" name="formType" value="login"/>
                                <div class="row">
                                    <div class="col-md-2">
                                        <label>Username</label>
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" name="username"/>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Password</label>
                                    </div>
                                    <div class="col-md-10">
                                        <input type="password" name="password"/>
                                    </div>
                                </div>
                            <button type="submit" value="Login">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
       <c:import url="footer.jsp"/> 
    </body>
</html>
