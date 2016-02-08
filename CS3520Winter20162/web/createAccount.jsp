<%-- 
    Document   : create
    Created on : Jan 24, 2016, 3:22:38 PM
    Author     : Ryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="include/styles/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="include/styles/confirmation.css" type="text/css"/>
        <title>Ryan Rigato HW #2</title>
        
    </head>
    <body>
        <%--import header --%>
        <c:import url="Header.jsp"/>        
        <h1>${msg}</h1>
        <p>Your created Account Username: ${username}</p>
        <br>
        <p>Your created Account email: ${email}</p>
    </body>
</html>
