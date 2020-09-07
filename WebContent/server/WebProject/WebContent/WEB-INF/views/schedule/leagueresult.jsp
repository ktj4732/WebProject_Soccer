<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="/WEB-INF/views/inc/asset.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
      <link rel="stylesheet" href="/soccer/css/leagueresult.css" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
    
    <style>
    
    </style>
</head>

   	<%@include file="/WEB-INF/views/inc/header.jsp" %>

    <div id="topBoard">
    </div>

    <div id="scoreBoard">
        <div id="subOuter">
            <div class="menuTitleBox">
			<div class="menuTitle">정규리그일정</div>
			<div class="breadcrumb">
				<span>HOME</span> <span>></span> <span>정규리그일정</span> <span>></span>
				<span>리그결과</span>
			</div>
			<div class="subMenuBox">
				<nav class="subMenu">
					<ul>
						<li class="subMenuItem" ><a
							href="/soccer/schedule/leagueschedule.do">정규리그일정</a></li>
						<li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a
							href="/soccer/schedule/leagueresult.do">리그결과</a></li>
					</ul>
				</nav>
			</div>

		</div>
        </div>

    </div>
    <!-- 상단부 끝 -->

	<!-- 내용 시작 -->
	 <div class="center">
            <div class="pageContentTitle">
                <img src="/soccer/images/rogowithoutletter.png" class="contentTitleImg" /><span class="contentTitle"
                    >경기결과조회</span
                >
            </div>
            <div class="outerBox">
                <div class="tab">
                        <select id="selLeague" class="selBox" name="selLeague">
                            <option value="2020">2020</option>
                            <option value="2019">2019</option>
                            <option value="2018">2018</option>
                        </select>    
                        <select id="selSort" class="selBox" name="selSort">
                            <optgroup label="정렬기준">
                            <option value="득점">득점</option>
                            <option value="경기">경기</option>
                            <option value="도움">도움</option>
                            </optgroup>
                        </select>
                    <div class="" id="tab1">
                        <div class="smallTitle"><span class="league">2020</span> 정규리그 팀 순위</div>
                        
                        </div>
                        <div id="tab2">
                        <div class="smallTitle"><span class="league">2020</span> 정규리그 기록</div>
                        
                        </div>
                    </div>
                <div class="boxContainer" id="boxContainer">
                <div class="leftSideBox sideBox" >
                    
                    <div class="tableBox">
                        <table class=" table table-bordered table-striped lefttbl">
                            <thead>
                                <tr>
                                    <th>순위</th>
                                    <th>팀명</th>
                                    <th>경기</th>
                                    <th>승</th>
                                    <th>무</th>
                                    <th>패</th>
                                    <th>득점</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                                <tr>
                                    <td>1</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>9</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>10</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>11</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>12</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>13</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>14</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>15</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>16</td>
                                    <td>쌍용FC</td>
                                    <td>32</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="rightSideBox sideBox">
                    <div class="tableBox" >
                        <table class="table table-bordered table-striped righttbl">
                                <thead>
                                    <tr id="c8">
                                        <th>순위</th>
                                        <th>선수</th>
                                        <th>팀명</th>
                                        <th>출전</th>
                                        <th>경기</th>
                                        <th>득점</th>
                                        <th>도움</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><img src="" alt="teamRogo" class="teamRogo"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                </div>
            </div>
            </div>
      
		
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>
    var flag = false;
    $(document).scroll(function () {
        if ($(document).scrollTop() > $("#main").position().top) {
            if (!flag) {
                $("#main").css({
                    position: "fixed",
                    top: -$("#main").outerHeight(),
                    bottom: "",
                });

                $("#main").animate(
                    {
                        top: "0px",
                    },
                    1000,
                    function () {
                        //alert();
                        flag = true;
                    }
                );
            }
        }
    });
    window.onload=function(){
        $("#tab1").css({"border-bottom":"2px solid white"})
        $("#tab2").css({"background-color":"","border-bottom":"2px solid white","opacity":"0.5"})
    }
    $("#tab1").click(function(){
        $("#tab2").css({"border-bottom":"", "background-color": "#F9F9F9","border-bottom":"","opacity":"0.5"})
        $(this).css({"border-bottom":"2px solid white","background-color":"","opacity":"1"})
        $("#boxContainer").css({"transform": "translate(0px, 0px)"})

    })
    $("#tab2").click(function(){
        $("#tab1").css({"border-bottom":"", "background-color": "#F9F9F9","border-bottom":"","opacity":"0.5"})
        $(this).css({"border-bottom":"2px solid white","background-color":"","opacity":"1"})
        $("#boxContainer").css({"transform": "translate(-1300px, 0px)"})

    })
        

        
    </script>
    
    
</body>

</html>