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
        <h2> Plot of A versus B </h2>
        <script>
            
                var width = 500,
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
                   .attr("class", "bubble");
           
                var movement = d3.random.normal();
        
                
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
            


            //automatically creates the g svg element
            //.enter() because it is more data elements than dom elements
            var bubbles = svg.append("g")
                .attr("transform", "translate(0,0)")
                .selectAll(".bubble")
                .data(nodes)
                .enter();

                console.log(bubbles);
            //create the bubbles
            //need to take the squareroot from the size scale,
            //cause the area is pi*r^2
            //color is also a function of a scale.
            bubbles.append("circle")
                .attr("r", function(d){ return size(d.value); })
                .attr("cx", function(d){ return d.x - 30; })
                .attr("cy", function(d){ return d.y - 30; })
                .style("fill", function(d) { return color(d.value); })
                .transition()
                    .duration(1000)
                    .attr("cx", function(d){ return d.x + movement(5,5); })
                    .attr("cy", function(d){ return d.y + movement(5,5); });



                

            //format the text for each bubble
            //Adds the name of each text
            bubbles.append("text")
                .attr("x", function(d){ return d.x ; })
                .attr("y", function(d){ return d.y  ; })
                .attr("text-anchor", "middle")
                .text(function(d){return (d.Name + ": " + format(d.value));})
                .style({
                    "fill":"white", 
                    "font-family":"Helvetica Neue, Helvetica, Arial, san-serif",
                    "font-size": "12px"
                })
                .transition()
                    .duration(1000)
                    .attr("x", function(d){ return d.x + movement(5,5); })
                    .attr("y", function(d){ return d.y + movement(5,5); });
  
  

        });
            
            
        </script>
        
        <p>
            The above graph is a bubble plot made using D3.js. One of the most challenging
            parts of creating this bubble plot was accurately reflecting the radius as a 
            function of the data. The problem with simply using the radius to create 
            the circle is that the formula for the Area = pi*r^2.
        </p>
        
        <p>    
            A simple example involves having separate radius of 2 and 3 demonstrates this problem.
            The ratio begins at 2:3, or around .66. However the area of the 
            radius is 2^2 *pi to 3^2 * pi or 4*pi to 9*pi. This ratio is 4:9 or 
            .44. Thus, the underlying relationship between the data has changed.
        </p>
        <p>
           The way this was corrected using D3 was to take the square root of the
           radius before appending a circle to the svg element. This solution 
           was made using taking the square root using a scale.
            
            
        </p>
        
        <p>
            One last interesting point about the development of this
            visualization is that the color is of each bubble is actually a 
            linear scale from red to blue. This means that the color will 
            become more blue as the frequency increases.
        </p>
        <a href="exampleBubble.jsp">Check the example</anchor>
        
        <a href="histogram.jsp">Check histogram plot</anchor>
    </body>
</html>
