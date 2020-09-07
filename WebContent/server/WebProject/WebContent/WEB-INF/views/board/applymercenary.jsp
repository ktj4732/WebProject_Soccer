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
    <link rel="stylesheet" href="/soccer/css/applymercenary.css">
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
                <div class="menuTitle">커뮤니티</div>
                <div class="breadcrumb">
                    <span>HOME</span>
                    <span>></span>
                    <span>커뮤니티</span>
                    <span>></span>
                    <span>자유게시판</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem"><a href="communityQuestionBulletinBoard.html">질문게시판</a></li>
                            <li class="subMenuItem"><a href="communityGalleryBulletinBoard.html">갤러리</a></li>
                            <li class="subMenuItem"><a href="communityFreeBulletinBoard.html">자유게시판</a></li>
                            <li class="subMenuItem"><a href="communityLectureBulletinBoard.html">강의게시판</a></li>
                            <li class="subMenuItem;"><a href="friendlymatchrecruit.html">친선경기모집</a></li>
                            <li class="subMenuItem" style="background-color:rgb(15, 13, 13);"><a href="
                                mercenaryrecruit.html">용병모집</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>
    </div>
    <!-- 상단부 끝 -->



	<!-- 내용 시작 -->
	 <div class=" center">

        <div class="pageContentTitle"><img src="images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">용병모집 신청</span></div>
        <div id="contentsBox">
            <div class="applyOutBox">
                <div class="applyTitle">용병모집 신청</div>
                <div class="applyCount">
                    <div>신청인원 :</div>
                    <select>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                        <option>11</option>
                    </select>
                </div>
                <div class="applyTableBox">
                    <table class="applyTable table table-bordered">
                        <tr>
                            <th>이름</th>
                            <th>전화번호</th>
                            <th>포지션</th>
                        </tr>
                        <tr>
                            <td><input type="text"></td>
                            <td><input type="text"></td>
                            <td><input type="text"></td>
                        </tr>

                    </table>
                </div>
            </div>
            <div><input type="button" value="신청하기" class="btn btn-info" id="applyBtn"></div>
        </div>
    </div>

		
	
	<!-- 내용 끝 -->
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>
	//모달
    $("#applyBtn").click(function (e) {
        e.preventDefault();
        $("#applyModal").modal("show");
    });

    </script>
    
    
</body>

</html>