<%-- 
    Document   : loginAccount
    Created on : Jan 25, 2016, 8:51:34 PM
    Author     : Ryan


Page that shows up after you login.
Gets the user object from the sessionScope
And links to the admin Servlet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        
        <link rel="stylesheet" href="include/styles/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="include/styles/confirmation.css" type="text/css"/>
        
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
        <title>Successful login page</title>
    </head>
    <body>
        <%--import header --%>
        <c:import url="Header.jsp"/>        
        <h1>${msg}</h1>
        <p>Your Account Username: ${sessionScope.user.username}</p>
        <a href="AdminServlet">Admin Page</a>
        <br>
        <c:import url="footer.jsp"/>
    </body>
</html>
