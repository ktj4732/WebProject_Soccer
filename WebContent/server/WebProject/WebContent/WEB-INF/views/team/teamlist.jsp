<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet" href="/soccer/css/teamlist.css">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<style>
#centerMainBox {
	/* border: 1px solid black; */
	width: 1200px;
	/* height: 950px; */
	margin: 0px auto;
}

#centerbox1 {
	border-bottom: 1px solid black;
	width: 1200px;
	margin-bottom: 10px;
	display: inline-block;
}

#centerbox2 {
	/* border: 1px solid black; */
	width: 1200px;
	font-size: 1.1em;
}

#centerbox3 {
	/* border: 1px solid red; */
	width: 1200px;
}

#centerbox4 {
	/* border: 1px solid blue; */
	width: 1200px;
	display: inline-block;
	margin-bottom: 25px;
}

#centerbox1 span, #centerbox1 select {
	/* border: 1px solid red; */
	display: inline-block;
}

#verticalTable {
	/* border: 1px solid blue; */
	
}

#pagination {
	/* border: 1px solid gold; */
	
}

#sortform, #selectRow {
	float: right;
	/* border: 1px solid gold; */
}

#sortform {
	margin-right: 10px;
	margin-top: 17px;
}

#selectRow {
	margin-top: 10px;
	color: black;
	padding-bottom: 5px;
}

#verticalTable {
	width: 1200px;
	/* height: 650px; */
}

#verticalTable th:nth-child(1) {
	width: 65px;
}

#verticalTable th:nth-child(2) {
	width: 480px;
}

#verticalTable th:nth-child(3) {
	width: 120px;
}

#verticalTable th:nth-child(4) {
	width: 100px;
}

#verticalTable th:nth-child(5) {
	width: 65px;
}

#verticalTable th, #verticalTable td {
	color: black;
}

#verticalTable thead tr th {
	width: 800px;
	color: black;
}

#verticalTable tr {
	width: 800px;
}

#verticalTable tr:nth-child(even) {
	width: 800px;
}

/* 게시판 목록 형식 */
#sortform a {
	color: #1e3440;
	margin-bottom: 15px;
}

#pagination .nowPage {
	background-color: #92daec;
}

/* 페이지 버튼 */
#pagination li a {
	color: black;
	height: 25px;
	line-height: 0.8em;
}

/* input 태그들 */
#centerbox4 select, #selectrow, #searchbtn, #writebtn {
	height: 25px;
	color: black;
	line-height: 0.8em;
}
.modal-body {
	text-align: center;
	font-size: 1.2em;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
</style>
</head>

<%@include file="/WEB-INF/views/inc/header.jsp"%>

<div id="topBoard"></div>

<div id="scoreBoard">
	<div id="subOuter">
		<div class="menuTitleBox">
			<div class="menuTitle">구단현황</div>
			<div class="breadcrumb">
				<span>HOME</span> <span>></span> <span>구단현황</span>

			</div>
			<div class="subMenuBox">
				<nav class="subMenu">
					<ul>
						<li class="subMenuItem">구단정보</li>
						<li class="subMenuItem">구단선수정보</li>
						<li class="subMenuItem">구단경기정보</li>
					</ul>
				</nav>
			</div>

		</div>
	</div>

</div>
<!-- 상단부 끝 -->


<div class="center">
	<div class="pageContentTitle">
		<img src="../images/rogowithoutletter.png" class="contentTitleImg" /><span class="contentTitle">전체 팀 목록</span>
	</div>

	<div id="centerMainBox">
		<div id="centerbox1">
			<select name="selectRow" id="selectRow" >
				<option value="10">10개씩 보기</option>
				<option value="25">25개씩 보기</option>
				<option value="50">50개씩 보기</option>
			</select> <span id="sortform">
				<a href="#" class="glyphicon glyphicon-list"></a> 
				<a href="#" class="glyphicon glyphicon-list-alt"></a> 
				<a href="#" class="glyphicon glyphicon-th-large"></a>
			</span>
		</div>
		<div id="centerbox2">
			<table class="table table-striped table-bordered" id="verticalTable"">
				<thead>
					<tr>
						<th>번호</th>
						<th>로고</th>
						<th>팀명</th>
						<th>감독</th>
						<th>창단일</th>
						<th>팀원수</th>
						<th>홈구장</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.rnum}</td>
							<td><img src="/soccer/images/${dto.logo==null?nopic.png:dto.logo}" alt="" /></td>
							<td><span style="cursor: pointer;" onclick="location.href='/soccer/team/teaminformation.do?teamname=${dto.name}'">${dto.name}FC</span></td>
							<td>${dto.coachname }</td>
							<td>${dto.birth}</td>
							<td>${dto.count}명</td>
							<td>${dto.ground}<span class='glyphicon glyphicon-map-marker showmapbtn' id="showmapbtn" onclick="e(${dto.lat}, ${dto.lng});" ></span></td>
							<%-- 연고지 따위는 넣지 않습니다. --%>
						</tr>

						<!-- 모달 -->
						<div class="modal fade" id="showmap" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header" style="background-color: #25282A;">
										<h5 class="modal-title" id="exampleModalLabel" style="color: #92DAEC; display: inline;">홈구장 위치</h5>
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

		<!-- 페이지 바 들어가는 곳 -->
		<div id="pagebar" style="float:right">${pagebar}</div>
		
		<div id="centerbox4">
			<div style="float: right;">
				<form id="sendForm" method="GET" action="/soccer/team/teamlist.do">
					<select name="searchKeyword" id="searchKeyword">
						<option value="name">팀명</option>
						<option value="coachname">감독</option>
						<option value="ground">홈구장</option>
					</select>
					<input id="search" name="search" type="text" size="35" style="" value="${search}" />
					<input class="btn btn-primary" id="searchbtn" type="submit" value="검색" />
				</form>
			</div>
		</div>
	</div>
</div>


<!-- 하단부  -->
<!-- 하단부  -->
<%@include file="/WEB-INF/views/inc/footer.jsp"%>

<!-- 스크립트------------------------------------------------------------- -->
<script>

function e(lat, lng){
	 $("#showmap").modal("show");
		setTimeout(function(){
			map(lat,lng);
// 			map.relayout(); 
				}, 200);
}



$("#pagination > li >a").click(function () {
    // alert($(this).text());
    $("#pagination > li>a").removeClass("nowPage");
    $(this).addClass("nowPage");
});

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



$("#centerbox2 td:last-child")
    .children()
    .mouseover(function () {
        $(this).css({ cursor: "pointer" });
    });
    
            
        //지도창 열고 보내준다.
        function map(lat, lng){
        	
        }
</script>

<!-- 카카오맵 받아오기 -->
<script type="text/javascript"	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a12f06129cc70984e1f6a7fa73684a75"></script>
<script>
$("#selectRow").change(function(){
	location.href="/soccer/team/teamlist.do?selectRow="+$("#selectRow").val();
})
$("#selectRow").val(${selectRow});

$('#searchKeyword').val('${searchKeyword}').prop("selected",true);
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
