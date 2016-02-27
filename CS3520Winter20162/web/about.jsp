<%-- 
    Document   : about
    Created on : Feb 1, 2016, 9:37:37 PM
    Author     : Ryan Rigato


This page contains links to external sources on other web pages about me.

About servlet links to this page
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
        <title>About Ryan Rigato</title>
    </head>
    <body>
        <%--import header --%>
        <c:import url="Header.jsp"/>
        
        <h2>About this site</h2>
            <div class ="explanation">
                <p>The purpose of this site is to demonstrate how visualizing data
                can impart ideas easier than the dataset itself. I developed this website
                as an experiment in storytelling with data. Any feedback about the site
                and the visualizations created are much appreciated.</p>

            </div>
        
        
        <h3>Here is some information about me</h3>
        <%--External link to GitHub--%>
        <a href ="https://github.com/rrigato">Check out my GitHub account</a>
        
        <br>       
        <br>
        <a href ="https://www.kaggle.com/ryanrigato">Take a look at my Kaggle Profile </a>
        
        <br>       
        <br>
        <a href ="https://www.linkedin.com/in/ryan-rigato-a9248397">Connect with me on Linkedin </a>
        <c:import url="footer.jsp"/>
    </body>
</html>
