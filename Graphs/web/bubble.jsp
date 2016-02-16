<%-- 
    Document   : bubble
    Created on : Feb 15, 2016, 4:37:52 PM
    Author     : Ryan Rigato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bubble plot</title>
        <script src="//d3js.org/d3.v3.min.js"></script>
    </head>
    <body>
        <script>
            
            
            //initialize variables
            var     color = d3.scale.category20c(),
                    width = 500,
                    height = 500;
            
            
            // layout pack is used for bubble plots
            var bubble = d3.layout.pack()
                .sort(null)
                .size([width, height])
                .padding(1.5);
        
        
        
            //create the template where the plot will go
             var template = d3.select("body")
                 .append("svg")
                 .attr("width", width)
                 .attr("height", height)
                  .attr("class", "bubble");
          
           d3.csv("Data/letters1.csv", function(data){
               


  
     
               
           });
            
            
        </script>
        
        <a href="exampleBubble.jsp">Check the example</anchor>
    </body>
</html>
