<%-- 
    Document   : footer
    Created on : Feb 7, 2016, 7:26:09 PM
    Author     : Ryan Rigato

Footer now contains a users login information
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>


    <footer>

                <c:if test="${sessionScope.user.username !=null}">            
                <p>Login Status: ${sessionScope.user.username == null ? 
                                   'Not logged in':sessionScope.user.username  }</p>
               </c:if>
       
             <p>&copy;Ryan Rigato 2016 </p>
     </footer>

</html>
