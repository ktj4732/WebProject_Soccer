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
    <link rel="stylesheet" href="/soccer/css/mercenaryrecruit.css">
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
                    <span>용병모집</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem"><a href="/soccer/board/communityQuestionBulletinBoard.do">질문게시판</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/communityGalleryBulletinBoard.do">갤러리</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/communityFreeBulletinBoard.do">자유게시판</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/communityLectureBulletinBoard.do">강의게시판</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/friendlymatchrecruit.do">친선경기모집</a></li>
                            <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a href="/soccer/board/mercenaryrecruit.do">용병모집</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->

	<!-- 내용 시작 -->
	  <div class="center">
        <div class="pageContentTitle"><img src="images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">용병모집</span></div>

        <div id="centerMainBox">
            <div id="centerbox1">
                <select name="" id="selectrow">
                    <option value="">10개씩 보기</option>
                    <option value="">25개씩 보기</option>
                    <option value="">50개씩 보기</option>
                </select>
                <span id="sortform">
                    <a href="#" class="glyphicon glyphicon-list"></a>
                    <a href="#" class="glyphicon glyphicon-list-alt"></a>
                    <a href="#" class="glyphicon glyphicon-th-large"></a>
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
                    <tr>
                        <td>1</td>
                        <td><a href="mercenarycontents.html">7월 18일 용병모집 합니다.</a></td>
                        <td>오희준</td>
                        <td>2020.07.14 17:48</td>
                        <td>15</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><a href="mercenarycontents.html">7월 25일 용병모집 합니다.</a></td>
                        <td>오희준</td>
                        <td>2020.07.14 17:48</td>
                        <td>15</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><a href="mercenarycontents.html">7월 26일 용병모집 합니다.</a></td>
                        <td>오희준</td>
                        <td>2020.07.14 17:48</td>
                        <td>15</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="#"></a></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="#"></a></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="#"></a></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="#"></a></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="#"></a></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="#"></a></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="#"></a></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>

            <div id="centerbox3">
                <ul id="pagination" class="pagination" style="float: right;">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a class="nowPage" href="#" name="page">1</a></li>
                    <li><a href="#" name="page">2</a></li>
                    <li><a href="#" name="page">3</a></li>
                    <li><a href="#" name="page">4</a></li>
                    <li><a href="#" name="page">5</a></li>
                    <li><a href="#" name="page">6</a></li>
                    <li><a href="#" name="page">7</a></li>
                    <li><a href="#" name="page">8</a></li>
                    <li><a href="#" name="page">9</a></li>
                    <li><a href="#" name="page">10</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </div>

            <div id="centerbox4">
                <div style="float: right;">
                    <select>
                        <option value="">제목</option>
                        <option value="">내용</option>
                        <option value="">제목+내용</option>
                        <option value="">글쓴이</option>
                    </select>
                    <input id="searchkeyword" type="text" size="35">
                    <a href=""><input id="searchbtn" type="button" value="검색" class="btn"></a>
                    <input id="writebtn" type="button" value="글쓰기" onclick="location.href=''" ; class="btn">
                </div>
            </div>

        </div>

    </div>
	
	
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


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

        

        
    </script>
    
    
</body>

</html>