<%-- 
    Document   : donutChart
    Created on : Mar 1, 2016, 7:31:17 PM
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

.arc text {
  font: 10px sans-serif;
  text-anchor: middle;
}

.arc path {
  stroke: #fff;
}

</style>
    <body>
        <h2>Chart Mario Video Game Sales by Genre </h2>
        <script>
            var marginTop = 30, marginBottom = 30,
                    marginLeft = 35, marginRight = 30,
                    width = 975 - marginLeft - marginRight,
                    height = 550 - marginTop - marginBottom ;
            
            var radius = Math.min(width,height) / 2;
            
            var color = d3.scale.ordinal()
                .range(["rgb(255, 135, 0)", "rgb(0, 135, 0)", "rgb(0, 255, 239)",
                "rgb(245, 178, 239)", "#a05d56", "rgb(245, 178, 70)", "rgb(57, 217, 42)"]);

            
            //Determining the inner and outer radius for the arc
            //The difference is what will be filled in
            var arc = d3.svg.arc()
                    .outerRadius(radius - 100)
                    .innerRadius(radius - 25);
            
            //Appending a pie element to the layout
            var pie = d3.layout.pie()
                    .sort(null)
                    .value(function(d){  return d.Sales ; });
            
            var svg = d3.select("body").append("svg")
                    .attr("width", width + marginLeft + marginRight)
                    .attr("height", height + marginTop + marginBottom)
                    .append("g")
                        .attr("transform", "translate(" + width/2 + "," + height/2 + ")");
                
                
            //Calls the type function to parse the string to a float for the 
            //sales of mario games
            d3.csv("Data/marioGames.csv", type, function(error,data){
                if(error) throw error;
                
                var g = svg.selectAll(".arc")
                        .data(pie(data))
                        .enter().append("g")
                            .attr("class", "arc");
                
                g.append("path")
                        .attr("d", arc )
                        .style("fill", function(d){return color(d.data.Game);});
                
                
                //Return the text of what type of Mario Game it is
                g.append("text")
                        .attr("transform", function(d){ 
                             return "translate(" + arc.centroid(d) + ")";})
                         .attr("dy", "1em")
                         .text(function(d) { return d.data.Game;})
                         .style({"font-size": "12px" });

                    
                
            });
            
            
            //have to convert the Sales Data from a string to a float
            function type(d){
                d.Sales = parseFloat(d.Sales);
                return d;
            }
        </script>
        
        <p>
            Mario was created by Shigeru Miyamoto and made his first appearance 
            in the 1981 arcade game Donkey Kong. Since then, the Mario franchise 
            has evolved to have installments on both console and handheld platforms.
            The iconic plumber has made a major impact on American Popular Culture 
            and how platforming video games are played.
        </p>
        
        <p>
            The above graph is a donut chart developed using D3.js. One of my
            favorite parts about making this particular visualization was choosing
            the colors to represent each individual genre of the video game. It 
            was an interesting balancing act between my preference for vivid colors 
            and actually being able to convey the data in way that is easy for the
            reader to understand.
        </p>
        
        <p>
            If I could only choose one video game from the Mario franchise, I 
            would choose Super Mario Galaxy. Although it is rare for me to 
            play a Mario game that I dislike, my least favorite Mario games would be 
            the Mario Party series.
        </p>
        
        
        <a href ="http://vgsales.wikia.com/wiki/Best_selling_game_franchises">Source: Wikia</a>
    </body>
</html>
