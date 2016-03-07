<%-- 
    Document   : create
    Created on : Jan 24, 2016, 3:22:38 PM
    Author     : Ryan

This page is sent to after someone creates an account
Depends on the LoginCreate Java Servlet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script src="include/js/jquery-1.12.0.js"></script>    
        <script src="include/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="include/styles/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="include/styles/confirmation.css" type="text/css"/>
        
         <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>       
        <title>Ryan Rigato </title>
        
    </head>
    <body>
        <%--import header --%>
        <c:import url="Header.jsp"/>        
        <h2>${msg}</h2>
        <p>Your created Account Username: ${username}</p>
        <br>
        <p>Your created Account email: ${email}</p>
        

        
        <c:import url="footer.jsp"/>
    </body>
</html>
