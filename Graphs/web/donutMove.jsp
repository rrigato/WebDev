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
        
<form>
  <label><input type="radio" name="dataset" value="Sales" checked> Sales</label>
  <label><input type="radio" name="dataset" value="test"> Test</label>
</form>
        <script>
            var marginTop = 30, marginBottom = 30,
                    marginLeft = 35, marginRight = 30,
                    width = 975 - marginLeft - marginRight,
                    height = 550 - marginTop - marginBottom ;
            
            var radius = Math.min(width,height) / 2;
           var color = d3.scale.category20();

var pie = d3.layout.pie()
    .value(function(d) { return d.Sales; })
    .sort(null);

var arc = d3.svg.arc()
    .innerRadius(radius - 100)
    .outerRadius(radius - 20);

var svg = d3.select("body").append("svg")
    .attr("width", width)
    .attr("height", height)
  .append("g")
    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
                
            //Calls the type function to parse the string to a float for the 
            //sales of mario games
            d3.csv("Data/marioGames.csv", type, function(error,data){
                if(error) throw error;

                var path = svg.datum(data).selectAll("path")
                        .data(pie)
                      .enter().append("path")
                        .attr("fill", function(d, i) { return color(d.data.Game); })
                        .attr("d", arc);
                function Game()
                {
                    path.append("text")
                        .attr("transform", function(d){ 
                             return "translate(" + arc.centroid(d) + ")";})
                         .attr("dy", "1em")
                         .text(function(d) { return d.data.Game});
                }
//                g.append("text")
//                        .attr("transform", function(d){ 
//                             return "translate(" + arc.centroid(d) + ")";})
//                         .attr("dy", "1em")
//                         .text(function(d) { return d.data.Game});

                     d3.selectAll("input")
      .on("change", change);

  var timeout = setTimeout(function() {
    d3.select("input[value=\"test\"]").property("checked", true).each(change);
  }, 2000);

  function change() {
    var value = this.value;
    clearTimeout(timeout);
    pie.value(function(d) { return d[value]; }); // change the value function
    path = path.data(pie); // compute the new angles
    path.attr("d", arc); // redraw the arcs
    Game();
  }
                
            });
            
            
            function type(d){
                d.Sales = parseFloat(d.Sales);
                d.test = parseFloat(d.test);
                return d;
            }
        </script>
        
        
        <a href ="http://vgsales.wikia.com/wiki/Best_selling_game_franchises">Source: Wikia</a>
    </body>
</html>
