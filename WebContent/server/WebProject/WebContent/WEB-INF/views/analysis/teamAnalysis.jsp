<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
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
	    top: 25px;
	    left: 150px;
	    background-color: rgba(0, 0, 0, .6);
	    text-align: center;
	    line-height: 750px;
	    z-index: 1;
   	}
    	
   	#loding lodingimage{
   		vertical-align: middle;
   	} 
    	
    	
    #title{
            /* border: 3px solid gray; */
            width: 1000px;
            margin-left: 150px;
            margin-top: 30px;
            background-color: #0C1B23;
        }

        select{
            margin-top: 50px;
            height: 30px;
            width: 80px;
        }

        #vs{
            background-color: black;
            color: blanchedalmond;
            width: 80px;
            margin-left: 100px;
            margin-right: 100px;
            height: 50px;
            border-radius: 50% 50%;
            text-align: center;
            font-size: 2.3em;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .team{
            width: 200px;
            border: 1px black solid;
            height: 60px;
            margin-top: 10px;
            margin-bottom: 10px;
            border-radius: 10% 10%;
            color: honeydew;
            text-align: center;
            font-weight: bold;
            font-size: 1.3em;
        }
        #redTeam{
            margin-left: 150px;
            background-color: rgb(134, 0, 0);
        }
        #blueTeam{
            background-color:#005093;
        }

        select:nth-child(1){
            border:1px solid rgb(134, 0, 0);
            color: rgb(134, 0, 0);
        }
        select:nth-child(2){
            border:1px solid rgb(134, 0, 0);
            color: rgb(134, 0, 0);
        }
        select:nth-child(1n+3){
            border:1px solid #005093;
            color: #005093;
        }
        .acePhoto{
            width: 400px;
            /* float: left; */
            /* color: silver; */
        }
        .ace{
            float: left;
            /* color: silver; */
            /* border: silver 1px solid; */
            text-align: center;
            margin-top: 10px;
            margin-bottom: 10px;
            border-radius: 10% 10%;
            padding: 0px 10px;
        }
        .playerTitle{
            margin-top: 10px; 
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 1.2em;
        }
        .center{
            /* background-color: rgb(238, 238, 238); */
        }
        #data tr{
            text-align: center;
        }
        #data th{
            text-align: center;
        }
        .ace img {
            padding-bottom: 10px;
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
                    <span>팀분석</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a href="teamAnalysis.do">팀분석</a></li>
                            <li class="subMenuItem"><a href="playerAnalysis.do">선수분석</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->



	<!-- 내용 시작 -->
	<div class="center" style="height: 1100px;">
        <div class="pageContentTitle" style="border-bottom: 1px solid black;"><img src="../images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">전력분석(팀)</span>
        </div>

        <div>
            <select name="home1" id="home1" style="margin-left: 260px;" > <!-- onchange="this.form.submit()" -->
            	
            	<option value="">지역선택</option>
            	<option value="">전체</option>
            	<c:forEach items="${list}" var="dto">
            	
                <option value="${dto.home}">${dto.home}</option>
                
                </c:forEach>
            </select>
            
            <select name="team1" id="team1">
                <%-- <c:forEach items="${listteam}" var="dto">
            	
                <option value="${dto.team}">${dto.team}</option>
                
                </c:forEach> --%>
            </select>
            
            
            
            <select name="home2" id="home2" style="margin-left: 450px;" >
                
                <option value="">지역선택</option>
                <option value="">전체</option>
                
                <c:forEach items="${list}" var="dto">
            	
                <option value="${dto.home}">${dto.home}</option>
                
                </c:forEach>
            </select>
            <select name="team2" id="team2">
                <!-- <option value="">청춘FC</option> -->
            </select>
            
        </div>
        
        <div style="width: 1000px; height: 790px; position: relative; ">
	        
	        <!-- 로딩 -->
	        <div id="loding" >
			<img src="/soccer/images/loding.png" id="lodingimage">
			</div>

        <!-- 팀 vs 팀  -->
        <div id="title" style="float: left">
            <div id="redTeam" class="team" style="float: left;">
                <div id="blueTeamName"></div>  <div id="blueTeamHome"></div>            
            </div>
            <div id="vs" style="float: left">
                vs
            </div>
            <div id="blueTeam" class="team" style="float: left">
                <div id="redTeamName"></div>  <div id="redTeamHome"></div>   
            </div>
        </div>
        
        <!-- 주목할 선수 -->
        <div style="float: left; width: 1000px; margin-left: 150px; border: 3px solid rgb(37, 65, 80);">
        <div class="ace" style="width: 300px; margin-left: 93px; border: 2px rgb(134, 0, 0) solid ;">
            <div class="playerTitle">주목할 선수</div>
            <span id="redTeamImage"><img src="/soccer/images/nopic.png"></span>
            <table class="table table-bordered">
                <tr>
                    <th>선수명</th>
                    <td><span id="redTeamPlayer"></span></td>
                </tr>
                <tr>
                    <th>득점</th>
                    <td><span id="redTeamGoal"></span></td>
                </tr>
                <tr>
                    <th>도움</th>
                    <td><span id="redTeamAssist"></span></td>
                </tr>
                <tr>
                    <th>공격포인트</th>
                    <td><span id="redTeamTotal"></span></td>
                </tr>
            </table>
        </div>
        <div class="ace" style="margin-left: 200px; width: 300px; border: 2px solid #005093;">
            <div class="playerTitle">주목할 선수</div>
            <span id="blueTeamImage"><img src="/soccer/images/nopic.png"></span>
            <table class="table table-bordered">
                <tr>
                    <th>선수명</th>
                    <td><span id="blueTeamPlayer"></span></td>
                </tr>
                <tr>
                    <th>득점</th>
                    <td><span id="blueTeamGoal"></span></td>
                </tr>
                <tr>
                    <th>도움</th>
                    <td><span id="blueTeamAssist"></span></td>
                </tr>
                <tr>
                    <th>공격포인트</th>
                    <td><span id="blueTeamTotal"></span></td>
                </tr>
            </table>
        </div>
    </div>
    
    <div style="border: solid 3px rgb(37, 65, 80); width: 1000px; float: left; margin-left: 150px;">
        <div style="width: 99%; float: left; margin-left: 3px;" id="data">
            <h4 style="font-weight: bold;">팀 평균 데이터</h4>
            <table class="table table-bordered">
                <tr>
                    <td id="redGoalAvg"></td>
                    <th>평균득점</th>
                    <td id="blueGoalAvg"></td>
                </tr>
                <tr>
                    <td id="redAssistAvg"></td>
                    <th>평균도움</th>
                    <td id="blueAssistAvg"></td>
                </tr>
                <tr>
                    <td id="redTotalAvg"></td>
                    <th>평균공격포인트</th>
                    <td id="blueTotalAvg"></td>
                </tr>
            </table>
        </div>
        
        
    </div>
	</div> 

        


    </div>
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

    /* function sm() {
    	document.frm.submit();
    	}
 */
       $("#home1").change(function(){
    	   
    		$("#team1").text("");
    	   
    		$.ajax({
    		   type:"GET",
    		   url: "/soccer/analysis/teamAnalysisok.do",
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
    	   
    	 	$("#loding").html("");
    		
    		$("#blueTeamName").text($("#team1 option:selected").val()+"FC");
    		$("#blueTeamHome").text("[ "+$("#home1 option:selected").val()+" ]");
    	   	
    		$("#redTeamPlayer").text("");
    		$("#redTeamGoal").text("");
    		$("#redTeamAssist").text("");
    		$("#redTeamTotal").text("");
    		$("#redTeamImage").text("");
    		$("#redGoalAvg").text("");
    		$("#redAssistAvg").text("");
    		$("#redTotalAvg").text("");
    		 $.ajax({
    		   type:"GET",
    		   url: "/soccer/analysis/teamAnalysisok2.do",
    		   data : "team1=" + $("#team1 option:selected").val(),
    		   dataType: "text",
    		   success:function(result){
    			   
    			   console.log(result);
    			   var data = result.split(",");
    			   $("#redTeamPlayer").append(data[0]);
    			   $("#redTeamGoal").append(data[1]);
    			   $("#redTeamAssist").append(data[2]);
    			   $("#redTeamTotal").append(data[3]);
    			   $("#redTeamImage").append("<img src=/soccer/images/nopic.png>");
    			   $("#redGoalAvg").append(data[4]);
    			   $("#redAssistAvg").append(data[5]);
    			   $("#redTotalAvg").append(data[6]);
    			   
    			   
    		   },
    		   error:function(a,b,c){
    			   console.log(a,b,c);
    		   }
    	   }) 
       })  
       
       
       $("#team2").change(function(){
    	   
    		
    		$("#redTeamName").text($("#team2 option:selected").val()+"FC");
    		$("#redTeamHome").text("[ "+$("#home2 option:selected").val()+" ]");
    	   
    		$("#blueTeamPlayer").text("");
    		$("#blueTeamGoal").text("");
    		$("#blueTeamAssist").text("");
    		$("#blueTeamTotal").text("");
    		$("#blueTeamImage").text("");
    		$("#blueGoalAvg").text("");
    		$("#blueAssistAvg").text("");
    		$("#blueTotalAvg").text("");
    		 $.ajax({
    		   type:"GET",
    		   url: "/soccer/analysis/teamAnalysisok3.do",
    		   data : "team2=" + $("#team2 option:selected").val(),
    		   dataType: "text",
    		   success:function(result){
    			   
    			   console.log(result); 
    			   var data = result.split(",");
    			   $("#blueTeamPlayer").append(data[0]);
    			   $("#blueTeamGoal").append(data[1]);
    			   $("#blueTeamAssist").append(data[2]);
    			   $("#blueTeamTotal").append(data[3]);
    			   $("#blueTeamImage").append("<img src=/soccer/images/nopic.png>"); 
    			   $("#blueGoalAvg").append(data[4]);
    			   $("#blueAssistAvg").append(data[5]);
    			   $("#blueTotalAvg").append(data[6]);
    		   },
    		   error:function(a,b,c){
    			   console.log(a,b,c);
    		   }
    	   }) 
       })  
       
    </script>
    
    
</body>

</html>