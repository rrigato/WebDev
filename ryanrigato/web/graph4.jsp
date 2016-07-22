<%-- 
    Document   : graph4
    Created on : Mar 4, 2016, 10:48:28 PM
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
        <link rel="stylesheet" href="include/styles/graph4.css" type="text/css"/> 
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>        
        <title>Batman Versus Superman</title>
        <script src="//d3js.org/d3.v3.min.js"></script>
    </head>

    <c:import url="Header.jsp"/>    
    <body>
       <h1>Heat Map of Batman versus Superman </h1>
            <div id="chart"></div>
            <div id="dataset-picker"> </div>
        <script>
            
            // variables for the margin
            var marginTop = 30, marginBottom = 30,
                marginLeft = 35, marginRight = 35,
                width = 960 - marginLeft - marginRight,
                height = 525 - marginTop - marginBottom ;
            
            
            var gridSize = Math.floor(width/24),
                    buckets = 9,
                    legendWidth = gridSize * 2,
                     colors = ["rgb(255, 255, 102)","rgb(204, 255, 153)",
                        "rgb(255,255,217)","rgb(237,248,177)","rgb(127,205,187)",
                        "rgb(0, 255, 239)","rgb(29,145,192)","rgb(34,94,168)","rgb(153, 0, 204)"];
            
            //variables for the days and times
            var   days = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"],
          times = ["1am", "2am", "3am", "4am", "5am", "6am", "7am", "8am", "9am", "10am", "11am", 
                    "12am", "1pm", "2pm", "3pm", "4pm", "5pm", "6pm", "7pm", "8pm", "9pm", "10pm", "11pm", "12pm"];
                
                var svg = d3.select("#chart")
                        .append("svg")
                        .attr("width", width + marginLeft + marginRight)
                        .attr("height", height + marginTop + marginBottom)
                        .append("g")
                        .attr("transform", "translate(" + marginLeft + "," + marginTop + ")");
            
                //Making the labels for each day of the week
                var dayLabels = svg.selectAll(".dayLabel")
                        .data(days)
                        .enter().append("text")
                            .text(function(d) { return d ;})
                            .attr("x", 0)
                            .attr("y", function (d,i) { return i * gridSize;})
                            .style("text-anchor", "end")
                            .attr("transform", "translate(-6," + gridSize/1.5 + ")")
                            .attr("class", function (d,i) { return ((i >=0 && i <=4) ? "dayLabel mono axis axis-workweek" : "dayLabel mono axis") ;});
                    
                    //making text labels for the hours of the day
                var timeLabels = svg.selectAll(".timeLabel")
                        .data(times)
                        .enter().append("text")
                            .text(function(d) {return d;})
                            .attr("x", function(d,i) {return i * gridSize;})
                            .attr("y", 0)
                            .style("text-anchor", "middle")
                            .attr("transform", "translate(" + gridSize/2 + ",-6)")
                            .attr("class", function(d,i){  return ((i >=7 && i <= 16)? "timeLabel mono axis axis-worktime" : "timeLabel mono axis");  });
               
            //actual heatMap
            //Passed in the CSV of data from google Trends
            var heatMap = function(dataLocation){
                    d3.csv(dataLocation, function (d){
                        return {
                            day: parseInt(d.Day),
                            hour: parseInt(d.Hour),
                            number: parseInt(d.Number) 
                        };
                    },
                    function(error,data){
                        
                        //sets the domain and range for the scale of colors which will depend on
                        //the quantitative d.number which is the google trend score
                        var colorScale = d3.scale.quantile()
                                .domain([0, buckets -1, d3.max(data, function(d){return d.number;})])
                                .range(colors);
                        
                        var tiles = svg.selectAll(".hour")
                                .data(data, function(d) { return d.day + ":" + d.hour;});
                        
                        tiles.append("title");
                        
                        //adds the rectangles which represent each individual hour/day combination
                        tiles.enter().append("rect")
                                .attr("x", function(d){return (d.hour -1) * gridSize;})
                                .attr("y", function(d){return (d.day-1)*gridSize ;})
                                .attr("rx", 4)
                                .attr("ry", 5)
                                .attr("class", "hour bordered")
                                .attr("width", gridSize)
                                .attr("height", gridSize)
                                .style("fill", colors[0]);
                        
                        
                        //Fills the tile with a color based on the value of the google trend
                        tiles.transition().duration(2000)
                                .style("fill", function (d) {return colorScale(d.number);});
                        
                        tiles.select("title")
                                .text(function(d){return d.number;});
                        
                        tiles.exit().remove();
                        
                        
                       //legend variables which will show the scale of colors covered
                       //for the heat map
                        var legend = svg.selectAll(".legend")
                                .data([0].concat(colorScale.quantiles()), function(d){return d;});
                        
                        legend.enter().append("g")
                                .attr("class", "legend");
                        
                        
                        //appends each tile as an example of the color
                        legend.append("rect")
                                .attr("x", function(d,i){return legendWidth * i;})
                                .attr("y", height - 100)
                                .attr("width", legendWidth)
                                .attr("height", gridSize/2)
                                .style("fill", function(d,i){return colors[i];});
                        
                        
                        //appends the text which shows the exact value of cutoff for each 
                        //tile
                        legend.append("text")
                                .text(function(d) { return ">=" + Math.round(d);})
                                .attr("x", function(d,i){return legendWidth * i;})
                                .attr("y", height - 100 + gridSize);
                        
                        legend.exit().remove();
                        
                    });
                    
                };
                
                heatMap("Data/batmanSuperman2.csv");
        </script>
        <div class="explanation">
            <p>
                The important thing to remember when looking at the heat map is that 
                darker colors represent more people searching for the phrase "Batman 
                versus SuperMan."
            </p>
            <p>
                Batman and Superman are two of the most popular superheros in the 
                comic book world. The impact of these two pop culture giants goes 
                well beyond the world of comic books as they have both spawned 
                multiple movie franchises.
            </p>

            <p>
                While the Man of Steel and the World's Greatest Detective both 
                fight on the side of justice, fans have always fiercely debated who
                would win in a head to head fight. The above heat map demonstrates 
                the intensity of these arguments for different times of the day.
            </p>

            <p>
                The heat map was made using D3.js. Google trends search data for 
                February 16 until February 23 was used to track "Batman versus Superman."
            </p>
            <p>
                My personal favorite of the various iterations of the Batman film series
                would have to be The Dark Knight Triology. Christian Bale does a fabulous
                job portraying what Bruce Wayne should be on the silver screen.
            </p>


               <a href ="https://www.google.com/trends/explore#q=Batman%20versus%20Superman&date=now%207-d&cmpt=q&tz=Etc%2FGMT%2B8">
                    Source: Google Trends Data
               </a> 
        </div>
    </body>
 
</html>
