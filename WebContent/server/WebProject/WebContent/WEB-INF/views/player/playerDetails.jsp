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
    	div .table {
            width: 70%;
        }

        .title {
            margin-top: 30px;
            margin-bottom: 10px;
            font-weight: bold;
            font-size: 1.3em;
        }
        input {
            margin-right: 10px;
        }
        .pageContentTitle{
            border-bottom: 1px solid black;
            margin-bottom: 30px;
        }
        .title{
            margin-left: 50px;
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
                    <span>></span>
                    <span>선수정보 상세보기</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a href="playerStatus.do">선수현황</a>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->



	<!-- 내용 시작 -->
	
	 <div class="center" style="height: 1000px;">
        <div class="pageContentTitle"><img src="../images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">선수정보 상세보기</span></div>
        <div style="width: 90%; margin-top: 50px;">
            <img src="/soccer/images/${dto.image}" alt="" width="250px" style="float: left; display: block; margin-right: 50px; border: 3px solid black; margin-left: 50px; ">
            <table class="table table-striped table-bordered">
                <tr>
                    <th>선수이름</th>
                    <td>${dto.name}</td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>${dto.birth}</td>
                </tr>
                <tr>
                    <th>소속팀</th>
                    <td>${dto.team }FC</td>
                </tr>
                <tr>
                    <th>등번호</th>
                    <td>${dto.backnumber }</td>
                </tr>
                <tr>
                    <th>포지션</th>
                    <td>${dto.position }</td>
                </tr>
                <tr>
                    <th>신장</th>
                    <td>${dto.height }</td>
                </tr>
                <tr>
                    <th>체중</th>
                    <td>${dto.weight }</td>
                </tr>
            </table>
        </div>
        <div>
            <input id="message" type="button" class="btn btn-success" value="선수에게 메시지" style="margin-left: 50px;">
            <!-- <br> -->
            <input id="friend" type="submit" class="btn btn-info" value="친구신청" onclick="location.href='/soccer/mypage/friendsfollowok.do?follower_seq=${dto.mseq}';">
        </div>

        <div class="title glyphicon glyphicon-list" > 친선경기정보</div>
        <div style="margin-left: 50px;">
            <table class="table table-bordered table-striped">
                <tr>
                    <th>경기수</th>
                    <th>득점</th>
                </tr>
                <c:if test="${friendlyStat == '[]'}">
                <tr>
                    <td>0</td>
                    <td>0</td>
                </tr>
                </c:if>
                
                <c:if test="${friendlyStat != null}">
	                <c:forEach items="${friendlyStat}" var="dto1" varStatus="status">
	                <tr>
	                    <td>${dto1.count}</td>
	                    <td>${dto1.lgoal}</td>
	                </tr>
	                </c:forEach>
                </c:if>
            </table>
        </div>
        <div class="title glyphicon glyphicon-list"> 리그성적</div>
        <div style="margin-left: 50px;">
            <table class="table table-bordered table-striped">
                <tr>
                    <th>경기수</th>
                    <th>득점</th>
                    <th>도움</th>
                    <th>태클성공</th>
                    <th>세이브</th>
                    <th>파울</th>
                    <th>경고</th>
                </tr>
                
                <c:forEach items="${leagueStat}" var="dto2" varStatus="status">
                <tr>
                	<c:if test="${dto2.count == 0}">
                	<td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                	</c:if>
                	<c:if test="${dto2.count != 0}">
                    <td>${dto2.count}</td>
                    <td>${dto2.lgoal}</td>
                    <td>${dto2.assist}</td>
                    <td>${dto2.tackle}</td>
                    <td>${dto2.saves}</td>
                    <td>${dto2.foul}</td>
                    <td>${dto2.yellowCard}</td>
                    </c:if>
                </tr>
                </c:forEach>
            </table>
        </div>
        
    </div>
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>
    
    $("#message").click(function () {
        window.open("message.do","message","width=550, height = 400, left = 700, top = 200")
        
    });
    /* $("#comment").click(function (){
        location.href="playerComments.jsp"
    }); */
    $("#friend").click(function (){
        // window.open("addFriend.html","message","width=300, height = 200, left = 800, top = 200")
        alert("친구신청완료!")
    });
        

        
    </script>
    
    
</body>

</html>