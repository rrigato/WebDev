<%-- 
    Document   : graph1
    Created on : Feb 26, 2016, 9:38:07 PM
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
        <link rel="stylesheet" href="include/styles/graph1.css" type="text/css"/> 
        
        
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>        
        <title>HS Grad Rate</title>
        <script src="//d3js.org/d3.v3.min.js"></script>
    </head>
    <c:import url="Header.jsp"/>   
 
    <body>
        <h2>High School Graduation Rate in United States 2007-2012</h2>
        <script>

        //initializes the width and height of the svg in addition to margins
        var topMargin = 25, rightMargin = 25,
            bottomMargin = 35, leftMargin = 45,
            height = 530 - topMargin - bottomMargin,
            width =825 - leftMargin - rightMargin;

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



        var colors = d3.scale.linear()
            .domain([0,100])
            .range(['#d6e9c6', '#bce8f1', '#faebcc', '#ebccd1']);


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
              .call(yAxis);


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
                  .attr("height", function(d) { return height - y(d.Percent); })
                  .style({"fill": function(data,i){return colors(i);}, 'stroke': '#31708f', 'stroke-width': '5'})
                    ;


                    svg.selectAll(".bartext")
                            .data(data)
                            .enter().append("text")
                                .attr("class", "bartext")
                                .attr("y", function(d){  return height  -300;})
                                .attr("text-anchor","right")
                                .attr("x", function(d,i){ return  40 + (x.rangeBand()/5)*i * 6 ;})
                                .attr("fill", "black")
                                .text(function(d){return d.Percent * 100 + "%";});

        });


        //Turns the string into a numeric
        function convert(d) {
          d.Percent = parseFloat(d.Percent);
          return d;
        }

    </script>


    <div class="explanation">
    <p>
        The above graph demonstrates the High School graduation rate in the United 
        States from 2007 until 2012. The graph was produced using the 
        javascript library D3, in addition to adding a few styling elements using CSS. 
        The y axis represents the percentage of students graduating in a single 
        year, while the x axis represents time.
    </p>
    
    <p>
        The above graph is interesting because it represents the time
        immediately before and during the most the recent recession. 
        It is clear that the trend for the high school graduation rate is 
        upward. However, it is interesting to consider whether this is because
        of a change in education policy or because more people wanted to stay
        in school and graduate due to the poor economy.
    </p>

    
        <a href ="https://twitter.com/WhiteHouse/status/558318033639198720">Source: US department of Education </a>
      </div>
    </body>
    

</html>
