<%-- 
    Document   : about
    Created on : Feb 1, 2016, 9:37:37 PM
    Author     : Ryan Rigato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="include/styles/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="include/styles/confirmation.css" type="text/css"/>
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
        <title>About Ryan Rigato</title>
    </head>
    <body>
        <%--import header --%>
        <c:import url="Header.jsp"/>
        
        <h1>Here is some information about me</h1>
        <%--External link to GitHub--%>
        <a href ="https://github.com/rrigato">Check out my GitHub account</a>
        
        <c:import url="footer.jsp"/>
    </body>
</html>
