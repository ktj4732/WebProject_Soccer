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
<link rel="stylesheet" href="/soccer/css/textbroadcastingschedule.css">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<style>
</style>
</head>

<%@include file="/WEB-INF/views/inc/header.jsp"%>

<div id="topBoard"></div>
<div id="scoreBoard">
	<div id="subOuter">
		<div class="menuTitleBox">
			<div class="menuTitle">문자중계</div>
			<div class="breadcrumb">
				<span>HOME</span> <span>></span> <span>문자중계</span>
			</div>
			<div class="subMenuBox">
				<nav class="subMenu">
					<ul>
						<li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a
							href="textbroadcastingschedule.html">문자중계</a></li>
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
		<img src="/soccer/images/rogowithoutletter.png"
			class="contentTitleImg" /><span class="contentTitle">문자중계일정</span>
	</div>

	<div id="centerMainBox">
		<div id="centerbox1">
			<div id="outerBox">
				<!-- 				<select name="" id="selectgametype"> -->
				<!-- 					<option value="1">정규리그</option> -->
				<!-- 					<option value="2">친선경기</option> -->
				<!-- 				</select> -->
				<form method="GET" action="/soccer/broadcast/textbroadcastingschedule.do">
				<div class="dateBox">
					<span>시작일 : </span> <input type="date" class="inputDate"
						id="startDate" name="startDate"/> 
						<span>종료일 : </span> <input type="date"
						class="inputDate" id="endDate" name="endDate" />
				</div>
				<div class="searchBox">
					<span id="searchcontent">팀이름 검색</span> <input id="searchkeyword"
						type="text" name="searchkeyword"/> <a href=""><input id="searchbtn" type="submit"
						value="검색" class="btn btn-primary"  /></a>
				</div>
				</form>
				<select name="" id="selectrow">
					<option value="10">10개씩 보기</option>
					<option value="25">25개씩 보기</option>
					<option value="50">50개씩 보기</option>
				</select>
			</div>
			
		</div>
		<div id="centerbox2">
			<table class="table table-bordered table-striped" id="verticalTable"
				style="margin-top: 0px;">
				<thead>
					<tr>
						<th>번호</th>
						<th>리그</th>
						<th>시간</th>
						<th>장소</th>
						<th>경기</th>
						<th>경기결과</th>
						<th>문자중계</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${broadcastScheduleList}" var="dto">
						<tr>
							<td>${dto.seq}</td>
							<td>${dto.league}</td>
							<td>${dto.gamedate}<span id="beginTime"></span></td>
							<td>${dto.ground}<span
								class='glyphicon glyphicon-map-marker showmapbtn'
								id="showmapbtn" onclick="e(${dto.lat}, ${dto.lng});"></span></td>
							<td><span class="team" id="teamA">${dto.homeTeam}</span> <span>vs</span>
								<span class="team" id="teamB">${dto.awayTeam}</span></td>
							
							<td><c:choose>
								<c:when test="${not empty dto.homeGoal}">
									${dto.homeGoal}<span class="team">:</span>${dto.awayGoal}
								</c:when>
								<c:otherwise>
									<div>경기전</div>
								</c:otherwise>
							</c:choose>
							</td>
						<td><input type="button" value="문자중계"
								class="textBtn btn btn-default"
								onclick="location.href='/soccer/broadcast/textbroadcasting.do?seq=${dto.seq}&league=${dto.league_seq}&hometeam=${dto.homeTeam}&awayteam=${dto.awayTeam}'"></td>
						</tr>

						<!-- 지도 모달 -->
						<div class="modal fade" id="showmap" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header" style="background-color: #25282A;">
										<h5 class="modal-title" id="exampleModalLabel"
											style="color: #92DAEC; display: inline;">홈구장 위치</h5>
									</div>
									<!-- 여기서 지도가 나옴 -->
									<div class="modal-body">
										<div id="map" style="width: 100%; height: 350px;"></div>
									</div>
									<!--  종료버튼  -->
									<div class="modal-footer">
										<button class="btn" type="button" data-dismiss="modal">나가기</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</tbody>
			</table>
		</div>
		${pagebar}
		<!--             <div id="centerbox3"> -->
		<!--                 <ul id="pagination" class="pagination"> -->
		<!--                     <li> -->
		<!--                         <a href="#" aria-label="Previous"> -->
		<!--                             <span aria-hidden="true">&laquo;</span> -->
		<!--                         </a> -->
		<!--                     </li> -->
		<!--                     <li><a class="nowPage" href="#" name="page">1</a></li> -->
		<!--                     <li><a href="#" name="page">2</a></li> -->
		<!--                     <li><a href="#" name="page">3</a></li> -->
		<!--                     <li><a href="#" name="page">4</a></li> -->
		<!--                     <li><a href="#" name="page">5</a></li> -->
		<!--                     <li><a href="#" name="page">6</a></li> -->
		<!--                     <li><a href="#" name="page">7</a></li> -->
		<!--                     <li><a href="#" name="page">8</a></li> -->
		<!--                     <li><a href="#" name="page">9</a></li> -->
		<!--                     <li><a href="#" name="page">10</a></li> -->
		<!--                     <li> -->
		<!--                         <a href="#" aria-label="Next"> -->
		<!--                             <span aria-hidden="true">&raquo;</span> -->
		<!--                         </a> -->
		<!--                     </li> -->
		<!--                 </ul> -->
		<!--             </div> -->
		<!-- <div style="clear: both;"></div> -->
	</div>

</div>



<!-- 내용 끝 -->



<!-- 하단부  -->
<%@include file="/WEB-INF/views/inc/footer.jsp"%>


<!-- 스크립트------------------------------------------------------------- -->
<script>
    // main page

    $("#searchbtn").mouseover(function () {
        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");
    });

    $("#searchbtn").mouseout(function () {
        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");
    });

    $("#writebtn").mouseover(function () {
        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");
    });

    $("#writebtn").mouseout(function () {
        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");
    });
    // <span class="glyphicon glyphicon-map-marker"></span>
    console.log($("#verticalTable tbody td:nth-child(3)").contents());

    // 지도마크 넣고 연결시키기
//     $("#verticalTable tbody td:nth-child(4)").append("<span class='glyphicon glyphicon-map-marker'></span>");
//     $("#verticalTable tbody td:nth-child(4)")
//         .children()
//         .mouseover(function () {
//             $(this).css({ cursor: "pointer" });
//         })
//         .click(function () {
//             console.log($(this).parent().text());
//         });


    
		//onchange이벤트는 원래 자기 값에서 변해야지만 이벤트가 발생함=> 문제 해결 필요
	 function movePage() {
// 				alert(event.srcElement.value);
				location.href = "/soccer/broadcast/textbroadcastingschedule.do?page=" + event.srcElement.value;
			}
		
			$("#pagebar").val(${page});

    </script>
<!-- 카카오맵 받아오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a12f06129cc70984e1f6a7fa73684a75"></script>
<script>
function e(lat, lng){
	 $("#showmap").modal("show");
		setTimeout(function(){
			map(lat,lng);
//			map.relayout(); 
				}, 200);
}

			function map(lat,lng){
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(lat, lng); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
				// marker.setMap(null);
			}
</script>

</body>

</html>