<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>amCharts examples</title>
        <link rel="stylesheet" href="style.css" type="text/css">
        <script src="../js/amcharts.js" type="text/javascript"></script>
        <script src="../js/serial.js" type="text/javascript"></script>
        <script src="../js/pie.js" type="text/javascript"></script>

        <script>
           	var chart;
 			var chart1;
            var chartData =${data};


            var chart = AmCharts.makeChart("chartdiv", {
                type: "serial",
                dataProvider: chartData,
                categoryField: "department",
                depth3D: 20,
                angle: 30,

                categoryAxis: {
                    labelRotation: 90,
                    gridPosition: "start"
                },

                valueAxes: [{
                    title: "number"
                }],

                graphs: [{

                    valueField: "number",
                    colorField: "color",
                    type: "column",
                    lineAlpha: 0,
                    fillAlphas: 1
                }],

                chartCursor: {
                    cursorAlpha: 0,
                    zoomable: false,
                    categoryBalloonEnabled: false
                },
                "export": {
                    "enabled": true
                }

            });
            
            AmCharts.ready(function () {
                // PIE CHART
                chart1 = new AmCharts.AmPieChart();
                chart1.dataProvider = chartData;
                chart1.titleField = "department";
                chart1.valueField = "number";
                chart1.outlineColor = "#FFFFFF";
                chart1.outlineAlpha = 0.8;
                chart1.outlineThickness = 2;
                chart1.balloonText = "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>";
                // this makes the chart 3D
                chart1.depth3D = 15;
                chart1.angle = 30;

                // WRITE
                chart1.write("chartdiv1");
            });
        </script>
  </head>
  
  <body>
  	
     <div id="chartdiv" style="width: 50%; height: 400px;"></div>
     <div id="chartdiv1" style="width: 50%; height: 400px;"></div>
  </body>
</html>
