<%-- 
    Document   : graph5
    Created on : Mar 4, 2016, 10:59:27 PM
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
        <link rel="stylesheet" href="include/styles/graph5.css" type="text/css"/>
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>        
        <title>Bleach, Naruto and One Piece Manga Sales</title>
        <script src="//d3js.org/d3.v3.min.js"></script>
    </head>

    <c:import url="Header.jsp"/>    
    <body>
       <h2>Number of Bleach, Naruto and One Piece Manga Volumes Sold</h2>
        <script>
            var marginTop = 30, marginBottom = 30,
                        marginLeft = 45, marginRight = 35,
                        width = 960 - marginLeft - marginRight,
                        height = 500 - marginTop - marginBottom ;

            var x = d3.scale.ordinal()
                .rangeRoundBands([0, width], .1);

            var x1 = d3.scale.ordinal();

            var y = d3.scale.linear()
                .rangeRound([height, 0]);

            var color = d3.scale.ordinal()
            .range(["rgb(204, 51, 0)",  "rgb(0, 204, 0)",  "rgb(255, 0, 255)"]);

        var xAxis = d3.svg.axis()
            .scale(x)
            .orient("bottom");

        var yAxis = d3.svg.axis()
            .scale(y)
            .orient("left")
            .tickFormat(d3.format(".2s"));


            var svg = d3.select("body").append("svg")
                .attr("width", width + marginLeft + marginRight)
                .attr("height", height + marginTop + marginBottom )
                .append("g")
                  .attr("transform", "translate(" + marginLeft + "," + marginTop + ")");
          d3.csv("Data/manga.csv", function(error,data){
                if (error) throw error;

                //Getting the keys which map the data to the display
                color.domain(d3.keys(data[0]).filter(function(key){return key !=="Volume";}));

                
                data.forEach(function(d){
                    var y0 = 0;
                    d.series = color.domain().map(function(name){return {name:name, y0: y0, 
                            y1: y0 += +d[name]};});
                    d.total = d.series[d.series.length - 1].y1;
                });

                //maps the domain of the different manga volumes
                x.domain(data.map(function(d) {return d.Volume;}));

                //maps the disply now that the data is loaded
                y.domain([0,d3.max(data, function(d) {return d.total;})]);


                //adding the x axis to the svg
                svg.append("g")
                        .attr("class", "x axis")
                        .attr("transform", "translate(0," + height + ")")
                        .call(xAxis);

                //adding the y axis
                svg.append("g")
                        .attr("class", "y axis")
                        .call(yAxis)
                        .append("text")
                            .attr("transform", "rotate(-90)") 
                            .attr("y", 10)
                            .attr("dy", ".71em")
                            .style("text-anchor", "end")
                            .text("Volumes Sold");

               var volume = svg.selectAll(".volume")
                       .data(data)
                       .enter().append("g")
                       .attr("class", "g")
                       .attr("transform", function(d) {return "translate(" + x(d.Volume) + ",0)"; });



                    volume.selectAll("rect")
                            .data(function(d) {return d.series;})
                            .enter().append("rect")
                            .attr("width", x.rangeBand())
                            .attr("y", function(d){ return y(d.y1);})
                            .attr("height", function(d){return y(d.y0) - y(d.y1);})
                            .style("fill", function(d) {return color(d.name);});


              //Appending an svg element to be used for a legend
                   //that will say which years correspond to which color of the bar
                   var legend = svg.selectAll(".legend")
                           .data(color.domain())
                           .enter().append("g")
                               .attr("class", "legend")
                               .attr("transform", function(d,i) {return "translate(0," + i*15 + ")";});


                   //Append the bars for the legend
                   legend.append("rect")
                           .attr("x", width -20)
                           .attr("width", 20)
                           .attr("height", 20)
                           .style("fill", color);

                   //Append the text to the legend
                   legend.append("text")
                           .attr("x", width - 22)
                           .attr("y", 7)
                           .attr("dy", ".35em")
                           .style("text-anchor", "end")
                           .text(function(d){return d;});





          });

        </script>
    </body>
    <div class="explanation">
        <p>
            Manga is the Japanese popular culture equivalent of comic books and is an art form that has
            been around since the late 19th century. The main difference between Manga 
            and American style comic books is that the former typically is drawn using 
            only black and white.
        </p>

        <p>
            Although Manga is most popular in Japan, many of the most popular series are
            translated into other languages and distributed across the world. One of 
            the most popular Manga genres is Shonen, of which Bleach, Naruto and 
            One Piece are three of the most popular series.
        </p>
        <p>
            While individual chapters are distributed in a weekly magazine, a volume 
            (called a Tankobon) of these chapters are also sold. The above graph compares
            the sales of Volumes 55 through Volume 64 for Bleach, Naruto and One Piece in
            the form of a stacked bar chart.
        </p>

       <a href ="http://www.animenewsnetwork.com/news/2015-01-02/top-selling-manga-in-japan-by-volume-2014/.82827">Source: ANN</a>
   </div>
    </body>
    
    <c:import url="footer.jsp"/> 
</html>
