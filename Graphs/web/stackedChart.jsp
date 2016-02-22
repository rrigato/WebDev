<%-- 
    Document   : stackedChart
    Created on : Feb 21, 2016, 8:27:08 PM
    Author     : Ryan Rigato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="//d3js.org/d3.v3.min.js"></script>
    </head>
    
    <style>

body {
  font: 10px sans-serif;
}

.axis path,
.axis line {
  fill: none;
  stroke: #000;
  shape-rendering: crispEdges;
}

.bar {
  fill: steelblue;
}

.x.axis path {
  display: none;
}

</style>
    <body>
        <script>
                   var marginTop = 30, marginBottom = 30,
        marginLeft = 35, marginRight = 35,
        width = 960 - marginLeft - marginRight,
        height = 500 - marginTop - marginBottom ;

        var x = d3.scale.ordinal()
            .rangeRoundBands([0, width], .1);

        var x1 = d3.scale.ordinal();

        var y = d3.scale.linear()
            .rangeRound([height, 0]);
    
        var color = d3.scale.ordinal()
        .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);

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
            
            //
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
            
            
          
          
          
          
          
          
      });

        </script>
    </body>
    
   <a href ="http://www.animenewsnetwork.com/news/2015-01-02/top-selling-manga-in-japan-by-volume-2014/.82827">Source: ANN</a>

</html>
