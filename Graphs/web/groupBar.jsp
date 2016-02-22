<%-- 
    Document   : groupBar
    Created on : Feb 20, 2016, 8:32:05 PM
    Author     : Ryan Rigato

Graph of labor strikes in china
The source of this data is the China Labor bulletin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script src="//d3js.org/d3.v3.min.js"></script>
        
    </head>
    <body>
        <h2>China Labor Union Strikes for 2011-2015 </h2>
        <script>
        
        var marginTop = 30, marginBottom = 30,
        marginLeft = 35, marginRight = 35,
        width = 960 - marginLeft - marginRight,
        height = 500 - marginTop - marginBottom ;

        var x0 = d3.scale.ordinal()
            .rangeRoundBands([0, width], .1);

        var x1 = d3.scale.ordinal();

        var y = d3.scale.linear()
            .range([height, 0]);

        var color = d3.scale.ordinal()
            .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);

        var xAxis = d3.svg.axis()
            .scale(x0)
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

 d3.csv("Data/chinaLaborStrike.csv", function(error, data) {
            if (error) throw error;

            //Makes a key of the years for which I have strike data
            var yearsUsed = d3.keys(data[0])
                    .filter(function(key){return key !== "Location";});
  
            data.forEach(
                    function(d){
                                d.years = yearsUsed.map(function(name){return {name: name, value: +d[name]}; });
                               }
                );
        
            //Filling in the domain with hte data
            x0.domain(data.map(function(d){return d.Location;}));
            x1.domain(yearsUsed).rangeRoundBands([0,x0.rangeBand()]);
            y.domain([0,d3.max(data,function(d){return d3.max(d.years, 
                    function(d){return d.value;} );})]);
            
            //Appending the svg element for the xAxis
            svg.append("g")
                    .attr("class", "x axis")
                    .attr("transform", "translate(0," + height + ")")
                    .call(xAxis);
            
            //Appending the svg element for the yAxis            
            svg.append("g")
                    .attr("class", "y axis")
                    .call(yAxis)
                    .append("text")
                        .attr("transform", "rotate(-90)")
                        .attr("y", 6)
                        .attr("dy", ".71em")
                        .style("text-anchor", "end")
                        .text("Number of Labor Strikes");
                
                //Appending the data to the svg element
                var location = svg.selectAll(".location")
                        .data(data)
                        .enter().append("g")
                            .attr("class", "location")
                            .attr("transform", function(d) {return "translate(" + x0(d.Location) + ",0)";});

                //Adding the bars for the group barchart
                location.selectAll("rect")
                        .data(function(d){return d.years;})
                        .enter().append("rect")
                            .attr("width", x1.rangeBand())
                            .attr("x", function(d) {return x1(d.name);})
                            .attr("y", function(d){return y(d.value);})
                            .attr("height", function(d){return height - y(d.value);})
                            .style("fill", function(d){return color(d.name);});
                  

               //Appending an svg element to be used for a legend
               //that will say which years correspond to which color of the bar
               var legend = svg.selectAll(".legend")
                       .data(yearsUsed)
                       .enter().append("g")
                       .attr("class", "legend")
                       .attr("transform", function(d,i) {return "translate(0," + i*15 + ")";});
               
               

               legend.append("rect")
                       .attr("x", width -20)
                       .attr("width", 20)
                       .attr("height", 20)
                       .style("fill", color);
                         console.log(legend);     
               legend.append("text")
                       .attr("x", width - 20)
                       .attr("y", 15)
                       .attr("dy", ".35em")
                       .style("text-anchor", "end")
                       .text(function(d){return d;});

});   
    
    
    
    
    
        </script>
    </body>
    <br>
    <a href ="http://maps.clb.org.hk/strikes/en">Source: China Labor Bulletin</a>
</html>
