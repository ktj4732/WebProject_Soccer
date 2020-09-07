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
<!-- <link rel="stylesheet" href="/soccer/css/friendlymatchrecruit.css"> -->

<link rel="stylesheet" href="/soccer/css/communityFreeBulletinBoard.css">
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
			<div class="menuTitle">커뮤니티</div>
			<div class="breadcrumb">
				<span>HOME</span> <span>></span> <span>커뮤니티</span> <span>></span> <span>친선경기모집</span>
			</div>
			<div class="subMenuBox">
				<nav class="subMenu">
					<ul>
						<li class="subMenuItem"><a
							href="/soccer/board/communityQuestionBulletinBoard.do">질문게시판</a></li>
						<li class="subMenuItem"><a
							href="/soccer/board/communityGalleryBulletinBoard.do">갤러리</a></li>
						<li class="subMenuItem"><a
							href="/soccer/board/communityFreeBulletinBoard.do">자유게시판</a></li>
						<li class="subMenuItem"><a
							href="/soccer/board/communityLectureBulletinBoard.do">강의게시판</a></li>
						<li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a
							href="/soccer/board/friendlymatchrecruit.do">친선경기모집</a></li>
						<li class="subMenuItem"><a
							href="/soccer/board/mercenaryrecruit.do">용병모집</a></li>
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
			class="contentTitle">친선경기모집</span>
	</div>

	<div id="centerMainBox">
		<div id="centerbox1">
			<select name="" id="selectrow">
				<option value="">10개씩 보기</option>
				<option value="">25개씩 보기</option>
				<option value="">50개씩 보기</option>
			</select> <span id="sortform"> <a href="#"
				class="glyphicon glyphicon-list"></a> <a href="#"
				class="glyphicon glyphicon-list-alt"></a> <a href="#"
				class="glyphicon glyphicon-th-large"></a>
			</span>
		</div>
		<div id="centerbox2">

			<table class="table table-bordered table-striped" id="verticalTable">
				<thead>
					<tr>
						<th>순번</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성시간</th>
						<th>조회</th>
					</tr>
				</thead>
				<!-- 검색했는데 게시물이 없을 경우 -->
				<c:if test="${not empty search and list.size() == 0}">
					<tr>
						<td colspan="5">검색 결과가 없습니다.</td>
					</tr>
				</c:if>

				<!-- 게시물이 없을때 -->
				<c:if test="${empty search and list.size() == 0}">
					<tr>
						<td colspan=5>게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.seq}</td>
						<td><a
							href="/soccer/board/friendlymatchcontents.do?seq=${dto.seq}&search=${search}&page=${page}&selectKeyword=${selectKeyword}&selectrow=${selectrow}&category_seq=${dto.category_seq}">${dto.title}</a>
						</td>
						<td>${dto.name}</td>
						<td>${dto.regdate}</td>
						<td>${dto.readcount}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		${pagebar}

		<div id="centerbox4">
			<div style="float: right;">
				<select>
					<option value="">제목</option>
					<option value="">내용</option>
					<option value="">제목+내용</option>
					<option value="">글쓴이</option>
				</select> <input id="searchkeyword" type="text" size="35"> <a href=""><input
					id="searchbtn" type="button" value="검색" class="btn"></a> <input
					id="writebtn" type="button" value="글쓰기" onclick="location.href=''"
					; class="btn">
			</div>
		</div>

	</div>

</div>



<!-- 내용 끝 -->





<!-- 하단부  -->
<%@include file="/WEB-INF/views/inc/footer.jsp"%>


<!-- 스크립트------------------------------------------------------------- -->
<script>

    $("#pagination > li >a").click(function () {

        // alert($(this).text());            
        $("#pagination > li>a").removeClass("nowPage");
        $(this).addClass("nowPage");

    })


    $("#searchbtn").mouseover(function () {

        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");

    })

    $("#searchbtn").mouseout(function () {

        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");

    })

    $("#writebtn").mouseover(function () {

        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");

    })

    $("#writebtn").mouseout(function () {

        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");

    })


		//onchange이벤트는 원래 자기 값에서 변해야지만 이벤트가 발생함=> 문제 해결 필요
// 	 function movePage() {
// 				//alert(event.srcElement.value);
// 				location.href = "/soccer/board/friendlymatchrecruit.do?page=" + event.srcElement.value;
// 			}
		
		
	  //한페이지 당 출력 갯수
 	document.getElementById("selectrow").onchange = function(){    
             	
     	location.href = "/soccer/board/friendlymatchrecruit.do?selectrow=" + $("#selectrow").val() 
     			+ "&selectKeyword=" + $("#selectKeyword").val()
     			+ "&search=" + $("#search").val()    
     			+ "&page=" + ${page};
 	};
			$("#pagebar").val(${page});
        
			//검색 키워드
	 		$("#${selectKeyword}").attr("selected","selected");
	 		
	    	//한페이지당 출력 갯수
	 		$("#${selectrow}").attr("selected","selected");
	        
	  		
	 		
	 		
			
			
			
    </script>


</body>
</html>