<%-- 
    Document   : admin
    Created on : Jan 27, 2016, 6:35:44 PM
    Author     : Ryan Rigato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link rel="stylesheet" href="include/styles/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="include/styles/newcss.css" type="text/css"/>
        <script src="include/js/bootstrap.min.js"></script>
        <script src="include/js/jquery-1.12.0.js"></script>
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
        <title>Administration Page</title>
    </head>
    <body>
        <%--import header --%>
        <c:import url="Header.jsp"/>
        <div class="container">
        <h1>Welcome to the Admin Page!!!</h1>
         <p>You are logged in as: ${sessionScope.user.username}</p>
         <table class="table">
             <tr>
                 <th>First Name</th>
                 <th>Last Name</th>
                 <th>Email</th>
                 <th>Username</th>
             </tr>
             <c:forEach var="user" items = "${requestScope.userlist}">
                 <tr>
                     <td>${user.firstname}</td>
                     <td>${user.lastname}</td>
                     <td>${user.email}</td>
                     <td>${user.username}</td>
                 </tr>
                 
             </c:forEach>
         </table>
         </div>
    </body>
</html>
