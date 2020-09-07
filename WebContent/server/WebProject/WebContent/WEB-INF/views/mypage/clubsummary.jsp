<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/soccer/css/clubsummary.css">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<style>

#matchResultBox::-webkit-scrollbar {
	border: 0px;
	width: 0px;
}

</style>
</head>

<%@include file="/WEB-INF/views/inc/header.jsp"%>

<div id="topBoard"></div>

<div id="scoreBoard">
	<div id="subOuter">
		<div class="menuTitleBox">
			<div class="menuTitle">마이페이지</div>
			<div class="breadcrumb">
				<span>HOME</span> <span>></span> <span>마이페이지</span> <span>></span> <span>구단정보관리</span>
			</div>
			<div class="subMenuBox">
				<nav class="subMenu">
					<ul>
						<li class="subMenuItem"><a href="/soccer/mypage/mypage.do">
								마이페이지</a></li>
						<li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a
							href="/soccer/mypage/clubsummary.do" >구단정보관리</a></li>
						<li class="subMenuItem" ><a
							href="/soccer/mypage/friends.do">친구관리</a></li>
						<li class="subMenuItem"><a href="/soccer/mypage/dm.do">DM</a></li>
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
		<img src="/soccer/images/rogowithoutletter.png" class="contentTitleImg"><span
			class="contentTitle">구단 정보</span>
	</div>

	<div id="contentsBox">
		<div id="matchScore">
			<div>
				<i class="glyphicon glyphicon-object-align-bottom"></i>경기전적
			</div>
			<div id="matchResultBox" style="overflow:scroll; height:550px;">
			<table class="table table-bordered table-striped">
				<tr>
					<th>경기</th>
					<th>경기장</th>
					<th>일시</th>
					<th>결과</th>
				</tr>
				<c:forEach items="${matchResult}" var="dto">
					<tr>
						<td>vs ${dto.awayName}</td>
						<td>${dto.gameDate}</td>
						<td>${dto.ground}</td>
						<td>${dto.homeGoal}:${dto.awayGoal}</td>
					</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		<div id="contentsBox2">
			<div id="transfer">
				<div>
					<i class="glyphicon glyphicon-refresh"></i>이적내역
				</div>
				<table class="table table-bordered table-striped">
					<tr>
						<th>구단명</th>
						<th>신청날짜</th>
						<th>완료날짜</th>
						<th>상태</th>
					</tr>
					<c:forEach items="${transfer}" var="dto">
					<tr>
						<td>${dto.team}</td>
						<td>${dto.regdate}</td>
						<td>${dto.completeDate}</td>
						<td>${dto.state}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div class=" rankingchart" id="rank">
				<div>
					<i class="glyphicon glyphicon-stats"></i>구단 내 순위
				</div>
				<figure class="highcharts-figure">
					<div id="container"></div>
					<p class="highcharts-description"></p>
				</figure>
			</div>
		</div>
	</div>
</div>




<!-- 내용 끝 -->





<!-- 하단부  -->
<%@include file="/WEB-INF/views/inc/footer.jsp"%>


<!-- 스크립트------------------------------------------------------------- -->
<!-- 구단 내 순위 차트  -->
<script>
	Highcharts.chart('container', {
		chart : {

		// backgroundColor: "#254150"
		},
		title : {
			text : '구단 내 순위',

		},

		subtitle : {
		// text: 'Source: thesolarfoundation.com'
		},

		yAxis : {
			title : {
				text : '순위'
			},
			allowDecimals : false,
			reversed : true,
			// min: 0.5,
			startOnTick : false,
			endOnTick : false,
		// max: 3.5
		},

		xAxis : {
			accessibility : {
				rangeDescription : 'Range: 1 to 12'
			}
		},

		legend : {
			layout : 'vertical',
			align : 'right',
			verticalAlign : 'middle'
		},

		plotOptions : {
			series : {
				label : {
					connectorAllowed : false
				},
				pointStart : 1
			}
		},

		series : [ {
			name : '순위',
			data : [ 1, 2, 3, 1, 5, 1, 4, 2, 5, 1, 4, 2, ]
		} ],

		responsive : {
			rules : [ {
				condition : {
					maxWidth : 500
				},
				chartOptions : {
					legend : {
						layout : 'horizontal',
						align : 'center',
						verticalAlign : 'bottom'
					}
				}
			} ]
		}

	});
	$("text").css("fill", "black");

	//하이차트 로고 없애기
	$(".highcharts-credits").remove();
</script>


</body>

</html>