<%-- 
    Document   : heatMap
    Created on : Feb 23, 2016, 5:40:45 PM
    Author     : Ryan Rigato


Heat Map 'Batman Versus Superman' google search trends
for 2/16 until 2/23
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
            <style>
      rect.bordered {
        stroke: #E6E6E6;
        stroke-width:2px;   
      }

      text.mono {
        font-size: 9pt;
        font-family: Consolas, courier;
        fill: #aaa;
      }

      text.axis-workweek {
        fill: #000;
      }

      text.axis-worktime {
        fill: #000;
      }
    </style>
    
        <script src="http://d3js.org/d3.v3.js"></script>

    </head>
    <body>
        <h1>Heat Map of Batman versus Superman </h1>
            <div id="chart"></div>
            <div id="dataset-picker"> </div>
        <script>
            
            // variables for the margin
            var marginTop = 30, marginBottom = 30,
                marginLeft = 35, marginRight = 35,
                width = 960 - marginLeft - marginRight,
                height = 500 - marginTop - marginBottom ;
            
            
            var gridSize = Math.floor(width/24),
                    buckets = 9,
                    legendWidth = gridSize * 2,
                     colors = ["#ffffd9","#edf8b1","#c7e9b4","#7fcdbb","#41b6c4","#1d91c0","#225ea8","#253494","#081d58"];
            
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
            var heatMap = function(dataLocation){
                    d3.csv(dataLocation, function (d){
                        return {
                            day: +d.Day,
                            hour: +d.Hour,
                            number: +d.Number 
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
                        tiles.transition().duration(1000)
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
                
                heatMap("Data/batmanSuperman.csv");
                

        </script>
        
        
    </body>
    <a href ="https://www.google.com/trends/explore#q=Batman%20versus%20Superman&date=now%207-d&cmpt=q&tz=Etc%2FGMT%2B8">
        Source: Google Trends Data
    </a>
</html>
