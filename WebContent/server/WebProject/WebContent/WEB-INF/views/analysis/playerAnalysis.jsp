<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="/WEB-INF/views/inc/asset.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
    
    <style>
    	#loding {
		    width: 100%;
    		position: absolute;
		    top: 0;
		    left: 0;
		    background-color: rgba(0, 0, 0, .6);
		    text-align: center;
		    line-height: 777px;
		    z-index: 1;
    	}
    	
    	#loding lodingimage{
    		vertical-align: middle;
    	} 
    
        select{
            margin-top: 50px;
            height: 30px;
            width: 80px;
        }

        select:nth-child(4){
            border:1px solid rgb(134, 0, 0);
            color: rgb(134, 0, 0);
        }
        select:nth-child(5){
            border:1px solid rgb(134, 0, 0);
            color: rgb(134, 0, 0);
        }
        select:nth-child(6){
            border:1px solid rgb(134, 0, 0);
            color: rgb(134, 0, 0);
        }
        select:nth-child(1n+7){
            border:1px solid #005093;
            color: #005093;
        }
        .playerTitle{
            
            border : 3px solid rgb(134, 0, 0);
            width: 600px;
            margin-top: 30px;
            height: 100px;
            float: left;
            
        }
        .playerTitle:nth-child(3){
            
            border : 3px solid #005093;
            
        }
        .playerTitle img{
            width: 80px; 
            /* float: left;  */
           /*  margin-top: 0px ;  */
             margin-left: 70px;
        }
        .playerTitle a{
            font-size: 1.3em;
            color: black;
        }
        .playerTitle span{
            font-size: 1.3em;
        }
        .playerCharts{
            border-left: 1px solid rgb(134, 0, 0);
            border-right: 1px solid #005093;
            width: 1230px;
            margin-left: 30px;
            float: left;
        }
        .playerPhoto{
            /* border: 1px solid black; */
            width: 300px;
            padding-left: 35px;
        }
        .playerPhoto img{
            border: 5px solid rgb(134, 0, 0);
            border-radius: 50% 50%;
            width: 250px;
            margin-top: 55px;
            

        }
        .playerCharts div{
            float: left;
        }
        #playerInfo tbody th{
            text-align: center;

        }
        .pageContentTitle {
            /* background-color: rgb(238, 238, 238); */
        }
        
        #blueTeamImage{
        }
        
/* ---------------------------------------------------------------- */
        #container {
        height: 400px;
        }

        .highcharts-figure, .highcharts-data-table table {
        min-width: 310px; 
        max-width: 800px;
        margin: 1em auto;
        }

        .highcharts-data-table table {
            font-family: Verdana, sans-serif;
            border-collapse: collapse;
            border: 1px solid #EBEBEB;
            margin: 10px auto;
            text-align: center;
            width: 100%;
            max-width: 500px;
        }
        .highcharts-data-table caption {
        padding: 1em 0;
        font-size: 1.2em;
        color: #555;
        }
        .highcharts-data-table th {
            font-weight: 600;
        padding: 0.5em;
        }
        .highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
        padding: 0.5em;
        }
        .highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
        background: #f8f8f8;
        }
        .highcharts-data-table tr:hover {
        background: #f1f7ff;
        }
        rect {
            /* fill: rgb(238, 238, 238); */
        }
    </style>
</head>

   	<%@include file="/WEB-INF/views/inc/header.jsp" %>

    <div id="topBoard">
    </div>

    <div id="scoreBoard">
        <div id="subOuter">
            <div class="menuTitleBox">
                <div class="menuTitle">커뮤니티</div>
                <div class="breadcrumb">
                    <span>HOME</span>
                    <span>></span>
                    <span>전력분석</span>
                    <span>></span>
                    <span>선수분석</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem"><a href="teamAnalysis.do">팀분석</a></li>
                            <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a href="playerAnalysis.do">선수분석</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->


    <div class="center" style="height: 1100px;">
        <!-- 선수 선택 -->
        <div class="pageContentTitle" style="border-bottom: 1px solid black; "><img src="/soccer/images/rogowithoutletter.png" class="contentTitleImg"><span
            class="contentTitle">전력분석(선수)</span>
        </div>
        <!--  -->
        <div style="width: 1300px;  height: 850px; float: left;">
            <div style="font-size: 1.3em">
            	<br>
            	<b>※ 전력분석을 하고싶은 선수를 선택하세요 ※</b>
            	<br>
                <select name="home1" id="home1" style="margin-left: 160px;">
                    <option value="">지역선택</option>
	            	<option value="">전체</option>
	            	<c:forEach items="${list}" var="dto">
	            	
	                <option value="${dto.home}">${dto.home}</option>
	                
	                </c:forEach>
                </select>
                <select name="team1" id="team1">
                </select>
                <select name="player1" id="player1">
                </select>
                <select name="home2" id="home2" style="margin-left: 450px;">
                    <option value="">지역선택</option>
	            	<option value="">전체</option>
	            	<c:forEach items="${list}" var="dto">
	            	
	                <option value="${dto.home}">${dto.home}</option>
	                
	                </c:forEach>
                </select>
                <select name="team2" id="team2">
                </select>
                <select name="player2" id="player2">
                </select>
            </div>
			<!-- <div id="loding" style="height: 740px">
			<img src="/soccer/images/loding.png" id="lodingimage">
			</div>  -->
	            <div class="playerTitle" style="margin-left: 30px; border-top: 7px solid rgb(134, 0, 0);">
	                <div style="text-align: left; width: 250px; float: left;">
	                    
	                    <span class="birth" id="redTeamBirth"></span><br>
	                    <span class="spec" id="redTeamSpec"></span><br>
	                    <span class="position" id="redTeamPosition"></span>
	                    
	
	                </div>
	                
	                <span style=" float: left;width: 140px; margin-top: 30px;" id="redTeamPlayer"></span>
	
	                <img src="../images/rogo.png" alt="" class="rogo" style="margin-left: 50px;">
	            </div>
	
	            <div class="playerTitle" style="margin-left: 30px; border-top: 7px solid #005093;">
	                <img src="../images/rogo.png" alt=""class="rogo" style=" float: left;">
	
	                <span style="margin-left: 100px; display:block; float: left;  margin-top: 30px;" id="blueTeamPlayer"></span>
	
	                <div style="text-align: right;  width: 290px; margin-left: 300px;">
	                    <span class="birth" id="blueTeamBirth"></span><br>
	                    <span class="spec" id="blueTeamSpec"></span><br>
	                    <span class="position" id="blueTeamPosition"></span>
	                </div>
	            </div>
	
	            <!-- 플레이어 차트 -->
	            <div class="playerCharts" >
	                <div class="playerPhoto" id="redPlayerImage"></div>
	                <figure class="highcharts-figure">
	                    <div id="container"></div>
	                    
	                  </figure>
	                <div class="playerPhoto" id="bluePlayerImage"></div>
	            </div>
	            <div style="float: left; border: gray 1px solid; width: 1230px; margin-left: 30px; text-align: center; padding-top: 20px;" >
	                <table class="table table-bordered" style="text-align: center;" id="playerInfo">
	                    <tr>
	                        <td id="redTeamCount"></td>
	                        <th>경기수</th>
	                        <td id="blueTeamCount"></td>
	                    </tr>
	                    <tr>
	                        <td id="redTeamGoal"></td>
	                        <th>득점</th>
	                        <td id="blueTeamGoal"></td>
	                    </tr>
	                    <tr>
	                        <td id="redTeamAssist"></td>
	                        <th>도움</th>
	                        <td id="blueTeamAssist"></td>
	                    </tr>
	                    <tr>
	                        <td id="redTeamTackle"></td>
	                        <th>태글성공</th>
	                        <td id="blueTeamTackle"></td>
	                    </tr>
	                </table>
	            </div>
	       </div>
	   
    </div>
    
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>
    
    $("#home1").change(function(){
 	   
		$("#team1").text("");
	   
		$.ajax({
		   type:"GET",
		   url: "/soccer/analysis/playerAnalysisok.do",
		   data : "home1=" + $("#home1 option:selected").val(),
		   dataType: "json",
		   success:function(result){
			   $(result).each(function(index,item){
				   $("#team1").append("<option value="+item.team+">" + item.team+"FC"+ "</option>");   
			   })
			   
			   
		   },
		   error:function(a,b,c){
			   console.log(a,b,c);
		   }
	   })
   }) 
   
   $("#home2").change(function(){
	   
		$("#team2").text("");
	   
		$.ajax({
		   type:"GET",
		   url: "/soccer/analysis/teamAnalysisok.do",
		   data : "home1=" + $("#home2 option:selected").val(),
		   dataType: "json",
		   success:function(result){
			   $(result).each(function(index,item){
				   $("#team2").append("<option value="+item.team+">" + item.team+"FC"+ "</option>");   
			   })
			   
			   
		   },
		   error:function(a,b,c){
			   console.log(a,b,c);
		   }
	   });
	   
	   
   }) 
   
  
 $("#team1").change(function(){
	   
		
	 $("#player1").text("");
	   
		$.ajax({
		   type:"GET",
		   url: "/soccer/analysis/playerAnalysisok2.do",
		   data : "team1=" + $("#team1 option:selected").val(),
		   dataType: "json",
		   success:function(result){
			   $(result).each(function(index,item){
				   $("#player1").append("<option value="+item.player+">" + item.player+ "</option>");   
			   })
			   
			   
		   },
		   error:function(a,b,c){
			   console.log(a,b,c);
		   }
	   });
   })  
   
   
   $("#team2").change(function(){
	   
		
	   $("#player2").text("");
	   
		$.ajax({
		   type:"GET",
		   url: "/soccer/analysis/playerAnalysisok2.do",
		   data : "team1=" + $("#team2 option:selected").val(),
		   dataType: "json",
		   success:function(result){
			   $(result).each(function(index,item){
				   $("#player2").append("<option value="+item.player+">" + item.player+ "</option>");   
			   })
			   
			   
		   },
		   error:function(a,b,c){
			   console.log(a,b,c);
		   }
	   }); 
   })  
   
      var lineRed1;
      var lineRed2;
      var lineRed3;
      var lineRed4;
      var lineRed5;
      var lineBlue1;
      var lineBlue2;
      var lineBlue3;
      var lineBlue4;
      var lineBlue5;
   
   	$("#player1").change(function(){
    		
    	   	
   		$("#redTeamPlayer").text("");
   		$("#redTeamBirth").text("");
   		$("#redTeamSpec").text("");
   		$("#redTeamPosition").text("");
   		$("#redTeamCount").text("");
   		$("#redTeamGoal").text("");
   		$("#redTeamAssist").text("");
   		$("#redTeamTackle").text("");
   		$("#redImage").remove();
   		 $.ajax({
   		   type:"GET",
   		   url: "/soccer/analysis/playerAnalysisok3.do",
   		   data : "player1=" + $("#player1 option:selected").val(),
   		   dataType: "text",
   		   success:function(result){
   			   
   			   var data = result.split(",");
   			   $("#redTeamPlayer").append(data[0]);
   			   $("#redTeamBirth").append(data[1]);
   			   $("#redTeamSpec").append(data[2]+"/"+data[3]);
   			   $("#redTeamPosition").append(data[4]);
   			   $("#redTeamCount").append(data[5]);
   			   $("#redTeamGoal").append(data[6]);
   			   $("#redTeamAssist").append(data[7]);
   			   $("#redTeamTackle").append(data[9]);
   			   $("#redPlayerImage").append("<img src='/soccer/images/"+data[11]+"' id='redImage'>");
   			   
   			   
   			   lineRed1 = parseInt(data[6],10);
			   lineRed2 = parseInt(data[7],10);
			   lineRed3 = parseInt(data[8],10);
			   lineRed4 = parseInt(data[9],10);
			   lineRed5 = parseInt(data[10],10);
   			   
			   Highcharts.chart('container', {
		   			  chart: {
		   			    type: 'spline'
		   			  },
		   			  title: {
		   			    text: '선수 전력 분석'
		   			  },
		   			  subtitle: {
		   			    // text: 'Source: WorldClimate.com'
		   			  },
		   			  xAxis: {
		   			    categories: ['득점', '도움', '파울', '태클', '선방']
		   			  },
		   			  yAxis: {
		   			    title: {
		   			      text: 'Temperature'
		   			    },
		   			    labels: {
		   			      formatter: function () {
		   			        return this.value ;
		   			      }
		   			    }
		   			  },
		   			  tooltip: {
		   			    crosshairs: true,
		   			    shared: true
		   			  },
		   			  plotOptions: {
		   			    spline: {
		   			      marker: {
		   			        radius: 4,
		   			        lineColor: '#666666',
		   			        lineWidth: 1
		   			      }
		   			    }
		   			  },
		   			  series: [{
		   			    name: 'Blue',
		   			    marker: {
		   			      symbol: 'square'
		   			    },
		   			    data: [lineBlue1,lineBlue2,lineBlue3,lineBlue4,lineBlue5],

		   			  }, {
		   			    name: 'Red',
		   			    marker: {
		   			      symbol: 'diamond'
		   			    },
		   			    data: [lineRed1,lineRed2,lineRed3,lineRed4,lineRed5],
		   			  }]
		   			});
			   
			   
   		   },
   		   error:function(a,b,c){
   			   console.log(a,b,c);
   		   }
   	   }) 
      })  
      
      $("#player2").change(function(){
   	   
    	$("#loding").html("");
    	$("#loding").css("background-color","rgba(0, 0, 0, .0)"); 
   	   
  	 	$("#blueTeamPlayer").text("");
   		$("#blueTeamBirth").text("");
   		$("#blueTeamSpec").text("");
   		$("#blueTeamPosition").text("");
   		$("#blueTeamCount").text("");
   		$("#blueTeamGoal").text("");
   		$("#blueTeamAssist").text("");
   		$("#blueTeamTackle").text("");
   		$("#blueImage").remove();
   		 $.ajax({
   		   type:"GET",
   		   url: "/soccer/analysis/playerAnalysisok3.do",
   		   data : "player1=" + $("#player2 option:selected").val(),
   		   dataType: "text",
   		   success:function(result){
   			   
   			   var data = result.split(",");
   			   $("#blueTeamPlayer").append(data[0]);
   			   $("#blueTeamBirth").append(data[1]);
   			   $("#blueTeamSpec").append(data[2]+"/"+data[3]);
   			   $("#blueTeamPosition").append(data[4]);
   			   $("#blueTeamCount").append(data[5]);
   			   $("#blueTeamGoal").append(data[6]);
   			   $("#blueTeamAssist").append(data[7]);
   			   $("#blueTeamTackle").append(data[9]);
   			   $("#bluePlayerImage").append("<img src='/soccer/images/"+data[11]+"'style='border: 5px solid #005093; margin-top: 41px;' id='blueImage'>");
   			
   			   lineBlue1 = parseInt(data[6],10);
   			   lineBlue2 = parseInt(data[7],10);
   			   lineBlue3 = parseInt(data[8],10);
   			   lineBlue4 = parseInt(data[9],10);
   			   lineBlue5 = parseInt(data[10],10);
   			   
   			   
   			Highcharts.chart('container', {
   			  chart: {
   			    type: 'spline'
   			  },
   			  title: {
   			    text: '선수 전력 분석'
   			  },
   			  subtitle: {
   			    // text: 'Source: WorldClimate.com'
   			  },
   			  xAxis: {
   			    categories: ['득점', '도움', '파울', '태클', '선방']
   			  },
   			  yAxis: {
   			    title: {
   			      text: 'Temperature'
   			    },
   			    labels: {
   			      formatter: function () {
   			        return this.value ;
   			      }
   			    }
   			  },
   			  tooltip: {
   			    crosshairs: true,
   			    shared: true
   			  },
   			  plotOptions: {
   			    spline: {
   			      marker: {
   			        radius: 4,
   			        lineColor: '#666666',
   			        lineWidth: 1
   			      }
   			    }
   			  },
   			  series: [{
   			    name: 'Blue',
   			    marker: {
   			      symbol: 'square'
   			    },
   			    data: [lineBlue1,lineBlue2,lineBlue3,lineBlue4,lineBlue5],

   			  }, {
   			    name: 'Red',
   			    marker: {
   			      symbol: 'diamond'
   			    },
   			    data: [lineRed1,lineRed2,lineRed3,lineRed4,lineRed5],
   			  }]
   			});
   			   
   		   },
   		   error:function(a,b,c){
   			   console.log(a,b,c);
   		   }
   	   })  
      })  
   
    
    


        
    $("text").css("font-size","1.3em").css("font-weight", "bold")
    $(".highcharts-credits").css("font-size","0em")
    
    
    
    
    
    
    </script>
    
    
</body>

</html>