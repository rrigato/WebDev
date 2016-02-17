<%-- 
    Document   : histogram
    Created on : Feb 16, 2016, 12:48:02 PM
    Author     : Ryan Rigato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>

                .bar {
                  fill: steelblue;
                }

                .bar:hover {
                  fill: brown;
                }

                .axis {
                  font: 10px sans-serif;
                }

                .axis path,
                .axis line {
                  fill: none;
                  stroke: #000;
                  shape-rendering: crispEdges;
                }

                .x.axis path {
                  display: none;
                }

        </style>
    </head>
    <body>

<body>
<script src="//d3js.org/d3.v3.min.js"></script>
<script>

var margin = {top: 20, right: 20, bottom: 30, left: 40},
    width = 960 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

var x = d3.scale.ordinal()
    .rangeRoundBands([0, width], .1);

var y = d3.scale.linear()
    .range([height, 0]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left")
    .ticks(10, "%");

var svg = d3.select("body").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

d3.csv("Data/graduationRate.csv", type, function(error, data) {
  if (error) throw error;

  x.domain(data.map(function(d) { return d.year; }));
  y.domain([0, d3.max(data, function(d) { return d.percent; })]);

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Frequency");

  svg.selectAll(".bar")
      .data(data)
    .enter().append("rect")
      .attr("class", "bar")
      .attr("x", function(d) { return x(d.year); })
      .attr("width", x.rangeBand())
      .attr("y", function(d) { return y(d.percent); })
      .attr("height", function(d) { return height - y(d.percent); });
});

function type(d) {
  d.percent = +d.percent;
  return d;
}

</script>
    </body>
</html>
