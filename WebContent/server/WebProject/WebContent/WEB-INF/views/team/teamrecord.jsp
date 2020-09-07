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

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<style>
.center {
	/* background-color: #eee; */
	/* height: auto; */
	
}

#centerbox2 {
	padding: 0 50px;
}

#centerbox1 {
	/* border: 1px solid red; */
	display: inline-block;
	margin-bottom: 5px;
}

#outerBox::after {
	content: "";
	display: block;
	clear: both;
}

#selectrow::after {
	content: "";
	display: block;
	clear: both;
}

#outerBox {
	position: relative;
	left: 50px;
	border-bottom: 1px solid black;
	height: 50px;
	width: 1200px;
	padding-top: 20px;
}

#selectgametype {
	position: absolute;
}

.dateBox {
	position: absolute;
	left: 10%;
}

.searchBox {
	position: absolute;
	right: 12%;
}

#selectrow {
	position: absolute;
	right: 0;
}

#verticalTable {
	/* color: white; */
	/* width: 1200px; */
	font-size: 1.1em;
}

#verticalTable thead tr:first-child {
	/* background-color: #92daec; */
	
}

#verticalTable tbody tr:nth-child(odd) {
	/* background-color: #0c1a22; */
	
}

#verticalTable tbody tr:nth-child(even) {
	/* background-color: #254150; */
	
}

#verticalTable tbody tr td {
	/* border: 1px solid black; */
	
}

#centerbox3 {
	/* border: 1px solid red; */
	float: right;
	margin-right: 50px;
}

#centerMainBox::after {
	content: "";
	clear: both;
	display: block;
}

.textBtn {
	height: 25px;
	font-size: 0.9em;
	line-height: 10px;
}

#pagination li a {
	height: 25px;
	line-height: 0.8em;
}

.table>thead>tr>th {
	border-bottom: 1px;
	color: black;
}

#selectgametype, #endDate, #startDate, #selectrow, #searchbtn, #writebtn
	{
	height: 25px;
	/* color: white;                */
	/* background-color: #1E3440 ;                   */
	line-height: 1em;
}

#pagination .nowPage {
	background-color: #92DAEC;
}
</style>
</head>

<%@include file="/WEB-INF/views/inc/header.jsp"%>

<div id="topBoard"></div>

<div id="scoreBoard">
	<div id="subOuter">
		<div class="menuTitleBox">
			<div class="menuTitle">커뮤니티</div>
			<div class="breadcrumb">
				<span>HOME</span> <span>></span> <span>전력분석</span> <span>></span> <span>선수분석</span>
			</div>
			<div class="subMenuBox">
				<nav class="subMenu">
					<ul>
						<li class="subMenuItem"><a href="teamAnalysis.html">팀분석</a></li>
						<li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a
							href="playerAnalysis.html">선수분석</a></li>
					</ul>
				</nav>
			</div>

		</div>
	</div>

</div>
<!-- 상단부 끝 -->

<div class="center">
	<div class="pageContentTitle">
		<img src="images/rogowithoutletter.png" class="contentTitleImg" /><span
			class="contentTitle">구단경기전적</span>
	</div>

	<div id="centerMainBox">
		<div id="centerbox1">
			<div id="outerBox">
				<select name="" id="selectgametype">
					<option value="0">전체</option>
					<option value="1">정규리그</option>
					<option value="2">친선경기</option>
				</select>
				<div class="dateBox">
					<span>시작일 : </span> <input type="date" class="inputDate"
						id="startDate" /> <span>종료일 : </span> <input type="date"
						class="inputDate" id="endDate" />
				</div>
				<div class="searchBox">
					<span id="searchcontent">대전 상대 검색</span> <input id="searchkeyword"
						type="text" /> <input id="searchbtn" type="button" value="검색"
						class="btns" /> <input id="writebtn" type="button" value="글쓰기"
						class="btns" />
				</div>
				<select name="" id="selectrow">
					<option value="10">10개씩 보기</option>
					<option value="25">25개씩 보기</option>
					<option value="50">50개씩 보기</option>
				</select>
			</div>
		</div>
		<div id="centerbox2">
			<table class="table table-striped" id="verticalTable"
				style="margin-top: 0px;">
				<thead>
					<tr>
						<th>번호</th>
						<th>상대</th>
						<th>득점</th>
						<th>리그</th>
						<th>경기일</th>
						<th>경기장</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.seq}</td>
							<td>${dto.homeName}VS${dto.awayName}</td>
							<td><span class="score teamA">${dto.homeGoal}</span><span
								class="score teamB">${dto.awayGoal}</span> <span
								id="resultDomain"></span></td>
							<td>${dto.league}</td>
							<td>${dto.gameDate }<span class="beginTime"></span></td>
							<td>${dto.ground}<span
								class='glyphicon glyphicon-map-marker showmapbtn'
								id="showmapbtn" onclick="e(${dto.lat}, ${dto.lng});"></span></td>
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

		<div id="centerbox3">
			<!--                     <ul id="pagination" class="pagination"> -->
			<!--                         <li> -->
			<!--                             <a href="#" aria-label="Previous"> -->
			<!--                                 <span aria-hidden="true">&laquo;</span> -->
			<!--                             </a> -->
			<!--                         </li> -->
			<!--                         <li><a class="nowPage" href="#" name="page">1</a></li> -->
			<!--                         <li><a href="#" name="page">2</a></li> -->
			<!--                         <li><a href="#" name="page">3</a></li> -->
			<!--                         <li><a href="#" name="page">4</a></li> -->
			<!--                         <li><a href="#" name="page">5</a></li> -->
			<!--                         <li><a href="#" name="page">6</a></li> -->
			<!--                         <li><a href="#" name="page">7</a></li> -->
			<!--                         <li><a href="#" name="page">8</a></li> -->
			<!--                         <li><a href="#" name="page">9</a></li> -->
			<!--                         <li><a href="#" name="page">10</a></li> -->
			<!--                         <li> -->
			<!--                             <a href="#" aria-label="Next"> -->
			<!--                                 <span aria-hidden="true">&raquo;</span> -->
			<!--                             </a> -->
			<!--                         </li> -->
			<!--                     </ul> -->
		</div>
		<!-- <div style="clear: both;"></div> -->
	</div>
</div>

<!-- 하단부  -->
<%@include file="/WEB-INF/views/inc/footer.jsp"%>

<!-- 하단부  끝 -->

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
            // main page

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
            // <span class="glyphicon glyphicon-map-marker"></span>
            console.log($("#verticalTable tbody td:nth-child(3)").contents());

            
            
       	 function movePage() {
//				alert(event.srcElement.value);
				location.href = "/soccer/broadcast/textbroadcastingschedule.do?page=" + event.srcElement.value;
			}
		
			$("#pagebar").val(${page});
            
            
            
            // 지도마크 넣고 연결시키기
//             $("#verticalTable tbody td:nth-child(6)").append("<span class='glyphicon glyphicon-map-marker'></span>");
//             $("#verticalTable tbody td:nth-child(6)")
//                 .children()
//                 .mouseover(function () {
//                     $(this).css({ cursor: "pointer" });
//                 })
//                 .click(function () {
//                     console.log($(this).parent().text());
//                 });

                var list=$("#verticalTable td:nth-child(2)");
                
                
//                 for(var i=0;i<list.length;i++){
//                     if(list[i].innerHTML!=""){
//                         $(`#verticalTable tbody tr:nth-child(${i+1}) td:nth-child(2)`).prepend(`<img src='/soccer/images/chelsea.png' style="width:30px">`)
// //                         $(`#verticalTable tbody tr:nth-child(${i+1}) td:nth-child(2)`).prepend("<span id='vs'>vs</span>")
//                     }   
//                 }
               
                    $(".teamA").append("<span>:<span>")
                // 점수 입력하면 승무패 작성
//                 for(var i=0;i<list.length;i++){
//                     var teamA=$(".teamA").text();
//                     var teamB=$(".teamB").text();
//                     var score=teamA[i]=teamB[i];
//                     if(score>0){//A팀 승리
//                     $("#resultDomain").append("승")
//                         $("#resultDomain").css("color","cornflowerblue")
//                     }else if(score==0){//무승부
//                     $("#resultDomain").append("무")
//                         $("#resultDomain").css("color","green")
//                     }else if(score<0){//B팀 승리
//                     $("#resultDomain").append("패")
//                         $("#resultDomain").css("color","tomato")
//                     }
//                 }
           
        </script>
<script src="js/submain.js"></script>
<script src="js/event.js"></script>
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
<!-- <script src="js/구단현황.js"></script> -->
</body>
</html>
