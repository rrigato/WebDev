<%-- 
    Document   : Header
    Created on : Feb 3, 2016, 7:42:49 PM
    Author     : Ryan Rigato

This is a standard HTML document that will be used as the header
Make sure all jsps include this web page.

This header contains the navbar which is accesible at all pages
--%>

<html>
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="include/styles/bootstrap.min.css" type="text/css"/>
        <script src="include/js/jquery-1.12.0.js"></script>
        <script src="include/js/bootstrap.min.js"></script>

        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
    </head>
    <body>

        <nav class="navbar navbar-default">
            <div class="container-fluid">

                <!-- Logo -->
                <div class="navbar-header">
                    <a href="welcome.jsp" class="navbar-brand" 
                       data-toggle="tooltip" title="Click to go back to homepage">Ryan Rigato</a>
                </div>

                <!-- Menu Items -->
                <div>
                    <ul class="nav navbar-nav">
                       <!-- One for menu item-->
                        <li><a href="graph1.jsp" data-toggle="tooltip" 
                               title="Click for a graph of HS grad rates">Grad Rates </a></li>
                        <li><a href="graph2.jsp" data-toggle="tooltip" 
                               title="Click for a graph of Pokemon Video Game Sales">
                                Pokemon Video Games Sold</a></li>
                        <li><a href="graph3.jsp" data-toggle="tooltip" 
                               title="Click for a graph of Labor Union Strikes in China">
                                China Strikes</a></li>
                        <li><a href="graph4.jsp" data-toggle="tooltip" 
                               title="Click for a graph of Batman vs Superman google trends">
                                Batman vs Superman</a></li>
                        <li><a href="graph5.jsp" data-toggle="tooltip" 
                               title="Click for a graph of Bleach, Naruto and One Piece Manga Sales">
                                Manga Sales</a></li>
                        <li><a href ="graph6.jsp" data-toggle="tooltip" 
                               title="Click for a graph of Kaggle User Rankings over time">
                                Kaggle Users</a></li>
                        <li><a href="IndexServlet" data-toggle="tooltip" 
                               title="Click to login or create an account">Login</a></li>
                        
                        <li><a href="AboutServlet" data-toggle="tooltip" 
                               title="Click to see my bio, pull source code, browse my open source contributions on github,contact me on linkedin, or view my kaggle profile">
                                About</a></li>

                    </ul>
                </div>

            </div>
        </nav>

    </body>
</html>

