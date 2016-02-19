<%-- 
    Document   : histogram2
    Created on : Feb 18, 2016, 6:19:20 PM
    Author     : Ryan Rigato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<svg class="chart"></svg>
<script src="//d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script>

var width = 420,
    barHeight = 20;

var x = d3.scale.linear()
    .range([0, width]);

var chart = d3.select(".chart")
    .attr("width", width);

d3.csv("Data/graduationRate.csv", type, function(error, data) {
  x.domain([0, d3.max(data, function(d) { return parseFloat(d.Percent); })]);

  chart.attr("height", barHeight * data.length);

  var bar = chart.selectAll("g")
      .data(data)
    .enter().append("g")
      .attr("transform", function(d, i) { return "translate(0," + i * barHeight + ")"; });
console.log(bar);
  bar.append("rect")
      .attr("width", function(d) { return x(parseFloat(d.Percent)); })
      .attr("height", barHeight - 1);

  bar.append("text")
      .attr("x", function(d) { return x(parseFloat(d.Percent)) - 3; })
      .attr("y", barHeight / 2)
      .attr("dy", ".35em")
      .text(function(d) { return parseFloat(d.Percent); });
});

function type(d) {
  d.Percent = +d.Percent; // coerce to number
  return d;
}

</script>
    </body>
</html>
