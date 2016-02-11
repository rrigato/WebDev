<%-- 
    Document   : welcome
    Created on : Feb 1, 2016, 4:28:33 PM
    Author     : Ryan Rigato

This is the first page the user sees when they go onto the website
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Ryan Rigato</title>

    </head>
    <body>
        <c:import url="Header.jsp"/>
        <h1>Welcome to my website</h1>
        <c:import url="footer.jsp"/> 
    </body>

</html>
