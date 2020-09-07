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
    <link rel="stylesheet" href="/soccer/css/textbroadcastingadmin.css">
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
                <div class="menuTitle">마이페이지</div>
                <div class="breadcrumb">
                    <span>HOME</span>
                    <span>></span>
                    <span>마이페이지</span>
                    <span>></span>
                    <span>회원정보조회</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li><a href="#">회원정보조회</a></li>
                            <li><a href="#">구단정보관리</a></li>
                            <li><a href="#">친구관리</a></li>
                            <li><a href="#">DM</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->

	<!-- 내용 시작 -->
	<div class="center">

        <div class="pageContentTitle"><img src="images/rogowithoutletter.png" class="contentTitleImg"><span class="contentTitle">문자중계 등록</span></div>

        	<div id="contentsBox">
        	<form action="" method="POST">
	            <div id="bsContainer"  style="width: 1300px; border: 1px solid black; height:400px;">
	            	
	            	<input class="bs" id="bs1" type="hidden" value="">
	            </div>
            </form>
            <div class="team" id="team1">
                <table class="table table-bordered table-striped">
                    <tr>
                        <th>포지션</th>
                        <th>등번호</th>
                        <th class="name">이름</th>
                        <th>나이</th>
                    </tr>
                </table>
            </div>
            <div id="input">
                <div id="action">
                    <pre>
		            <h4>경기내용 단축키 입력</h4>
		            <c:forEach items="" var="brInfo">
		            	<div>골     :  <kbd> g </kbd></div>
		            </c:forEach>
	                </pre>
                </div>
                <input type="text" class="form-control" placeholder="경기내용을 입력하세요" id="txt1">
                <input type="button" value="enter" class="btn btn-primary" id="enter">
            </div>
            <div class="team" id="team2">
                <table class="table table-bordered table-striped ">
                    <tr>
                        <th>포지션</th>
                        <th>등번호</th>
                        <th class="name">이름</th>
                        <th>나이</th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
	<!-- Modal-->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #25282A;">
                    <h5 class="modal-title" id="exampleModalLabel" style="color: #92DAEC;">수정 완료</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">X</span>
                    </button>
                </div>
                <div class="modal-body">수정이 완료되었습니다.</div>
                <div class="modal-footer">
                    <!-- ok버튼 누르면 마이페이지 처음 메뉴로 되돌아가기 -->
                    <a class="btn" id="modalY" href="#">ok</a>
                    <!-- <button class="btn" type="button" data-dismiss="modal">아니요</button> -->
                </div>
            </div>
        </div>
    </div>
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

    </script>
    
    
</body>

</html>