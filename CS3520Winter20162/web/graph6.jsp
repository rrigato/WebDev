<%-- 
    Document   : graph6
    Created on : Mar 5, 2016, 10:59:21 PM
    Author     : Ryan Rigato
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
        <link rel="stylesheet" href="include/styles/graph6.css" type="text/css"/> 
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>        
        <title>Kaggle Users</title>
        <script src="//d3js.org/d3.v3.min.js"></script>
    </head>

    <c:import url="Header.jsp"/>    
    <body>
        <h2>Kaggle Users Points, Ranking and Highest Rank by Creation Date</h2>
       <script>
                var marginTop = 30, marginBottom = 30,
                    marginLeft = 60, marginRight = 85,
                    width = 1050 - marginLeft - marginRight,
                    height = 600 - marginTop - marginBottom ;     
            
            var parseDate = d3.time.format("%m/%d/%Y").parse;
            
            var x = d3.time.scale()
                    .range([0,width]);
            var y = d3.scale.linear()
                    .range([height-50,0]);
            
            var color = d3.scale.category10();
            
            var xAxis = d3.svg.axis()
                    .scale(x)
                    .orient("bottom");
            
            
            var yAxis = d3.svg.axis()
                    .scale(y)
                    .orient("left");
            
            
            //The d.rank will be the actual datapoints
            //These will be parsed once the data is loaded
            var line = d3.svg.line()
                    .interpolate("basis")
                    .x(function(d){ return x(d.date);})
                    .y(function(d){ return y(d.rank);});
            
            //Creating SVG element
            var svg = d3.select("body").append("svg")
                    .attr("width", width + marginLeft + marginRight )
                    .attr("height", height + marginTop + marginBottom)
                    .append("g")
                        .attr("transform", "translate(" + marginLeft + "," + marginTop + ")");
                
            
            d3.csv("Data/kaggleUsers3.csv", function(error,data){
                if (error) throw error;
                
                //Making the color a function of the different ranking variables
                //So each ranking variable line will have its own color
                color.domain(d3.keys(data[0]).filter(function(key) { return key !== "date" ;}));
                
                //returns the date of each Time
                data.forEach(function(d){ 
                    d.date = parseDate(d.date);
                });

                //anonymous function that creates the d.rank which is simply the 
                //data and returns it as an object literal
                  var cities = color.domain().map(function(name) {
                            return {
                              name: name,
                              values: data.map(function(d) {
                                return {date: d.date, rank: +d[name]};
                              })
                            };
                          });
                 
                    x.domain(d3.extent(data, function(d){ return d.date ;}));
        
        
                //Adjusts the display of x now that the data has loaded
                //function of the cities object literal
                //c and v are just placeholders for the data from the cities object
                y.domain([
                    d3.min(cities, function(c){ return d3.min(c.values, function(v){ return v.rank ;}) ;}),
                    d3.max(cities, function(c){return  d3.max(c.values, function(v){ return v.rank ;}) ;})
                    
                ]);
                
                
                //Appending the xAxis
                svg.append("g")
                        .attr("class", "x axis")
                        .attr("transform", "translate(0," + height + ")")
                        .call(xAxis);
                
                //appending the y axis to the svg
                svg.append("g")
                        .attr("class", "y Axis")
                        .call(yAxis)
                        .append("text")
                            .attr("transform", "rotate(-90)")
                            .attr("y", 8)
                            .attr("dy", ".71em")
                            .style("text-anchor", "end")
                            .text("Amount");
                    
                    
                    //select all previous svg elements and appends the city 
                    //which will be added.
                    var city = svg.selectAll(".city")
                            .data(cities)
                            .enter().append("g")
                                .attr("class", city);
                    
                    //This is the actual line
                    city.append("path")
                            .attr("class", "line")
                            .attr("d", function(d){ return line(d.values);})
                            .style("stroke", function(d){return color(d.name) ;});
                    
                    
                    //This function appends the text to each line
                    city.append("text")
                            .datum(function(d){ return {name:d.name, value: d.values[d.values.length -1]}  ;})
                            .attr("transform", function(d) { return "translate(" + x(d.value.date) + "," + y(d.value.rank) + ")"; })
                            .attr("x", 2)
                            .attr("dy", ".70em")
                            .text(function(d) {  return d.name ;});
            });
        
        </script>
        <div class ="explanation">
            <p>
                Kaggle is a website where users can compete in order to predict
                the future with data. The goal of kaggle is to learn about the 
                entire machine learning process. This includes everything from 
                cleaning the data to model creation and testing.
            </p>
            
            <p>
                Once a Kaggle Competition is completed, a user recieves a certain
                number of points. Each user is then ranked by the number of points 
                they have received in all the competitions they have competed in.
                The Highest Rank is the best ranking that a Kaggle user has 
                ever had.
            </p>
                
            <p>
                The above graph demonstrates points, ranking, and highest rank 
                compared to the first registration date. The interesting takeaway 
                from the above graph is that when a user first registers does
                not dramatically impact their points or current ranking. It does 
                have a slight impact on highest rank, because earlier users to register
                typically have a higher rank.
            </p>
            
            
            <a href ="https://www.kaggle.com/kaggle/meta-kaggle">Source: Kaggle</a>
        </div>
    </body>
    <c:import url="footer.jsp"/> 
</html>
