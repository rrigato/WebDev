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

    //initializes the width and height of the svg in addition to margins
    var topMargin = 25, rightMargin = 25,
        bottomMargin = 35, leftMargin = 35,
        height = 530 - topMargin - bottomMargin,
        width = 775 - leftMargin - rightMargin;

    //Ordinal scale is used to map the qualitative year variable to 
    //the display range
    var x = d3.scale.ordinal()
        .rangeRoundBands([0, width], .1);

    //linear mapping for the quantitative variable
    var y = d3.scale.linear()
        .range([height, 0]);

    //Orients the x axis at the bottom of the graph
    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom");

    // y axis is to the left of the graph
    //also formats the ticks
    var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left")
        .ticks(10, "%");

    //Uses the variables above to define the svg element 
    var svg = d3.select("body").append("svg")
        .attr("width", width + leftMargin + rightMargin)
        .attr("height", height + topMargin + bottomMargin)
        .append("g")
          .attr("transform", "translate(" + leftMargin + "," + topMargin + ")");

    // loads the csv file
    // the convert function turns the string number into an actual numeric value
    d3.csv("Data/graduationRate.csv", convert, function(error, data) {
      if (error) throw error;

      //After the data is downloaded, these two calls fill in the domain for 
      // x and y scales
      x.domain(data.map(function(d) { return d.Year; }));
      y.domain([0, d3.max(data, function(d) { return d.Percent; })]);

      //appends the svg element for x axis
      svg.append("g")
          .attr("class", "x axis")
          .attr("transform", "translate(0," + height + ")")
          .call(xAxis);

     //appends the y axis 
      svg.append("g")
          .attr("class", "y axis")
          .call(yAxis)
          .append("text")
              .attr("transform", "rotate(-90)")
              .attr("y", 6)
              .attr("dy", ".71em")
              .style("text-anchor", "end")
              .text("Frequency");


      //appends the bars for the histogram
      //have to use .enter() because of data joining
      //rangeBand() function allows to have the gaps between each bar
      // have to subtract actual value from the height because I want the
      // the height to go from the bottom to top
      svg.selectAll(".bar")
          .data(data)
           .enter().append("rect")
              .attr("class", "bar")
              .attr("x", function(d) { return x(d.Year); })
              .attr("width", x.rangeBand())
              .attr("y", function(d) { return y(d.Percent); })
              .attr("height", function(d) { return height - y(d.Percent); });
    });


    //Turns the string into a numeric
    function convert(d) {
      d.Percent = parseFloat(d.Percent);
      return d;
    }

</script>
    </body>
</html>
