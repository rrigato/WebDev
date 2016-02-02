<%-- 
    Document   : loginAccount
    Created on : Jan 25, 2016, 8:51:34 PM
    Author     : Ryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link rel="stylesheet" href="include/styles/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="include/styles/confirmation.css" type="text/css"/>
        <title>Successful login page</title>
    </head>
    <body>
        <h1>${msg}</h1>
        <p>Your Account Username: ${username}</p>
        <a href="AdminServlet">Admin Page</a>
        <br>

    </body>
</html>
