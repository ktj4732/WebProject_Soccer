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
     #playerSearch tr{
            /* border: 1px solid black; */
            font-size: 1.2em;
        }

        #playerSearch {
            width: 400px;
        }

        .pageContentTitle{
            margin-bottom: 50px;
        }

        #playerList tbody tr th{
            text-align: center;

        }
        #playerList tbody tr td:nth-child(1n+2){
            text-align: center;
            /* border: gray 1px solid; */
        }

        .playerInfo{
            text-align: center;
        }
    </style>
</head>

   	<%@include file="/WEB-INF/views/inc/header.jsp" %>

    <div id="topBoard">
    </div>

    <div id="scoreBoard">
        <div id="subOuter">
            <div class="menuTitleBox">
                <div class="menuTitle">선수현황</div>
                <div class="breadcrumb">
                    <span>HOME</span>
                    <span>></span>
                    <span>선수현황</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a href="playerStatus.do">선수현황</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->



	<!-- 내용 시작 -->
	
	<div class="center" style="height: auto;">
        <div class="pageContentTitle"><img src="../images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">전체선수목록</span></div>
      
    <form method="GET" action="/soccer/player/playerStatus.do" id="searchForm">
	                <div class="input-group search" style="width: 200px">
	                    <input type="text" class="form-control" placeholder="선수검색" aria-describedby="basic-addon2" name="search" id="search" required value="${search}">
	                    <span class="input-group-addon" id="basic-addon2" style="cursor:pointer;" onclick="$('#searchForm').submit();"><span class="glyphicon glyphicon-search"></span></span>
	                </div>
	               <!--  <div class="input-group search" style="margin-top: 10px">
	                    <select name="position1" id="position1">
                            <option value="all">포지션</option>
                            <option value="FW">FW</option>
                            <option value="MF">MF</option>
                            <option value="DF">DF</option>
                            <option value="GK">GK</option>
                        </select>
	                </div> -->
      </form>
      <!-- 
        <div id="playerSearch">
            <table class="table table-bordered" style="border: 1px solid black;">
                <tr>
                    <th>선수검색</th>
                    <td>
                        <input type="text" id="playerSearchText" name="playerSearchText">
                        <input type="button" value="검색" id="playerSearchButton">
                        <input onkeyup="filter()" type="text" id="value" placeholder="Type to Search">
                    </td>
                </tr>
                <tr>
                    <th>포지션</th>
                    <td>
                        <select name="position1" id="position1">
                            <option value="all">전체</option>
                            <option value="FW">FW</option>
                            <option value="MF">MF</option>
                            <option value="DF">DF</option>
                            <option value="GK">GK</option>
                        </select>
                    </td>
                </tr>
            </table>
        </div> -->

        <hr style="border: 1px solid black;">

        <div id="playerList">
            <table class="table table-bordered">
                <tr>
                    <th>선수명</th>
                    <th>소속팀</th>
                    <th>생년월일</th>
                    <th>포지션</th>
                    <th>상세보기</th>
                </tr>
                <c:forEach items="${list}" var="dto">
                
                <tr>
                    <td>
                        <div class="playerInfo">
                            <div><img src="../images/${dto.image}" alt="" style="width: 100px;"><span class="playername">${dto.name}</span></div>
                        </div>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="teamName">${dto.team}FC</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="birth">${dto.birth}</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="positions">${dto.position}</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <a href="/soccer/player/playerDetails.do?seq=${dto.mseq}">
                        	상세보기
                        </a> 
                    </td>
                </tr>
                </c:forEach>
                
            </table>
			
            
        </div>
		${pagebar}
        
    </div>
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

  /*   $(".btn-primary").click(function () {

        location.href="playerDetails.do"
        
    }); */


    
    </script>
    
    
</body>

</html>