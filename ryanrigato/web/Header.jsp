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
                    <a href="welcome.jsp" class="navbar-brand">Ryan Rigato</a>
                </div>

                <!-- Menu Items -->
                <div>
                    <ul class="nav navbar-nav">
                       <!-- One for menu item-->
                        <li><a href="graph1.jsp">Grad Rates </a></li>
                        <li><a href="graph2.jsp">Pokemon Video Games Sold</a></li>
                        <li><a href="graph3.jsp">China Strikes</a></li>
                        <li><a href="graph4.jsp">Batman vs Superman</a></li>
                        <li><a href="graph5.jsp">Manga Sales</a></li>
                        <li><a href ="graph6.jsp">Kaggle Users</a></li>
                        <li><a href="IndexServlet">Login</a></li>
                        
                        <li><a href="AboutServlet">About</a></li>

                    </ul>
                </div>

            </div>
        </nav>

    </body>
</html>

