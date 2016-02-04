<%-- 
    Document   : welcome
    Created on : Feb 1, 2016, 4:28:33 PM
    Author     : Ryan Rigato
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="include/styles/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="include/styles/confirmation.css" type="text/css"/>
        <title>Ryan Rigato</title>

    </head>
    <body>
        <c:import url="Header.jsp"/>
        <h1>Welcome to my website</h1>
        <a href="IndexServlet">Click here to login</a>
        <br>
        <a href="AboutServlet">Click here for interesting links  </a>
    </body>
</html>
