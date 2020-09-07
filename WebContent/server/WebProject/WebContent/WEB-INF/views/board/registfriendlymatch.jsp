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
<link rel="stylesheet" href="/soccer/css/registfriendlymatch.css">
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
							href="communityQuestionBulletinBoard.html">질문게시판</a></li>
						<li class="subMenuItem"><a
							href="communityGalleryBulletinBoard.html">갤러리</a></li>
						<li class="subMenuItem"><a
							href="communityFreeBulletinBoard.html">자유게시판</a></li>
						<li class="subMenuItem"><a
							href="communityLectureBulletinBoard.html">강의게시판</a></li>
						<li class="subMenuItem;"
							style="background-color: rgb(15, 13, 13);"><a
							href="friendlymatchrecruit.html">친선경기모집</a></li>
						<li class="subMenuItem"><a href="mercenaryrecruit.html">용병모집</a></li>
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
		<img src="images/rogowithoutletter.png" class="contentTitleImg"><span
			class="contentTitle">친선경기모집</span>
	</div>

	<!-- 메인박스  -->
	<div id="centerMainBox">

		<!-- 게시판 선택 -->
		<div id="centerBox1">
			<span>게시판 :</span> <select name="" id="selectrow">
				<option value="">게시판 선택</option>
				<option value="">질문게시판</option>
				<option value="">갤러리</option>
				<option value="">자유게시판</option>
				<option value="">강의게시판</option>
				<option value="">친선경기모집</option>
				<option value="">용병모집</option>
			</select> <select name="" id="selectrow">
				<option value="">말머리 선택</option>
			</select>
		</div>

		<!-- 제목 입력 -->
		<div id="centerBox2">
			<span>제목 : </span> <input type="text" name="" id="" size="70px">
		</div>

		<!-- 내용 입력 -->
		<div id="centerBox3">
			<textarea name="" id="" cols="120" rows="17">내용 :</textarea>
		</div>

		<!-- 파일첨부 -->
		<div>
			<div id="centerBox4">
				<div>
					<span>파일첨부 :</span> <span><input type="file"
						class="form-control"
						style="height: 25px; font-size: 0.5em; padding: 1.8px;"></span>
				</div>
			</div>
		</div>

		<!-- 확인/미리보기 버튼 -->
		<div id="centerBox5">
			<input class="btn" id="writebtn1" type="button" value="확인"
				onclick="location.href='ex01.html'";> <input class="btn"
				id="writebtn2" type="button" value="미리보기"
				onclick="location.href='ex01.html'";>
		</div>
		<div style="clear: both;"></div>

	</div>

</div>


<!-- 내용 끝 -->





<!-- 하단부  -->
<%@include file="/WEB-INF/views/inc/footer.jsp"%>


<!-- 스크립트------------------------------------------------------------- -->
<script>
	$("#centerBox5 input").mouseover(function() {

		// alert($(this).text());
		$(this).css("background-color", "#92DAEC").css("color", "black");

	})

	$("#centerBox5 input").mouseout(function() {

		// alert($(this).text());
		$(this).css("background-color", "").css("color", "");

	})
</script>


</body>

</html>