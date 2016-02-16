<%-- 
    Document   : bubble
    Created on : Feb 15, 2016, 4:37:52 PM
    Author     : Ryan Rigato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bubble plot</title>
        <script src="//d3js.org/d3.v3.min.js"></script>
    </head>
    <body>
        <script>
            
var     width = 750,
        height  = 500,
        format = d3.format(",d"),
        color = d3.scale.category20b(); 

            var bubble = d3.layout.pack()
                .sort(null)
                .size([width, height])
                .padding(1.5);

            var svg = d3.select("body")
                .append("svg")
                .attr("width", width)
                .attr("height", height)
                .attr("class", "bubble")

                .text("Bubble graph of A Versus B");
        
                var color = d3.scale.linear()
                    .domain([0,100])
                    .range(["red", "blue"]);
                    
                var size = d3.scale.sqrt()
                        .domain([0,100])
                        .range([0,100]);

        d3.csv("Data/letters1.csv", function(error, data){
            if (error) throw error;
            //convert numerical values from strings to numbers
            data = data.map(function(d){ d.value = parseInt(d.Amount); return d; });


            //bubbles needs very specific format, convert data to this.
            var nodes = bubble.nodes({children:data}).filter(function(d) { return !d.children; });
            
            console.log(nodes);
            


            //setup the chart
            var bubbles = svg.append("g")
                .attr("transform", "translate(0,0)")
                .selectAll(".bubble")
                .data(nodes)
                .enter();

                console.log(bubbles);
            //create the bubbles
            bubbles.append("circle")
                .attr("r", function(d){ return size(d.value); })
                .attr("cx", function(d){ return d.x; })
                .attr("cy", function(d){ return d.y; })
                .style("fill", function(d) { return color(d.value); });





            //format the text for each bubble
            bubbles.append("text")
                .attr("x", function(d){ return d.x; })
                .attr("y", function(d){ return d.y + 5; })
                .attr("text-anchor", "middle")
                .text(function(d){return (d.Name + ": " + format(d.value));})
                .style({
                    "fill":"white", 
                    "font-family":"Helvetica Neue, Helvetica, Arial, san-serif",
                    "font-size": "12px"
                });
  






        });
            
            
        </script>
        
        <a href="exampleBubble.jsp">Check the example</anchor>
    </body>
</html>