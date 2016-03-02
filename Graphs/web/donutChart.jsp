<%-- 
    Document   : donutChart
    Created on : Mar 1, 2016, 7:31:17 PM
    Author     : Randy
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
        <%--
        <form>
             <label><input type="radio" name="dataset" value="mario" checked> Mario</label>
             <label><input type="radio" name="dataset" value="sports"> Sports</label>
        </form>--%>
        <script>
            var marginTop = 30, marginBottom = 30,
                    marginLeft = 35, marginRight = 30,
                    width = 975 - marginLeft - marginRight,
                    height = 550 - marginTop - marginBottom ;
            
            var radius = Math.min(width,height) / 2;
            
            var color = d3.scale.ordinal()
                .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);

            
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
                
                
                g.append("text")
                        .attr("transform", function(d){ 
                             return "translate(" + arc.centroid(d) + ")";})
                         .attr("dy", "1em")
                         .text(function(d) { return d.data.Game});

                    
                
            });
            
            
            function type(d){
                d.Sales = parseFloat(d.Sales);
                return d;
            }
        </script>
        
        
        <a href ="http://vgsales.wikia.com/wiki/Best_selling_game_franchises">Source: Wikia</a>
    </body>
</html>
