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
       <link rel="stylesheet" href="/soccer/css/mypageinfoupdate.css">
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
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem" style="background-color:rgb(15, 13, 13);"><a
                                    href="mypage.html">마이페이지</a></li>
                            <li class="subMenuItem"><a href="clubSummary.html">구단정보관리</a></li>
                            <li class="subMenuItem"><a href="friends.html">친구관리</a></li>
                            <li class="subMenuItem"><a href="dm.html">DM</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->

	<!-- 내용 시작 -->
	  <div class="center">

        <div class="pageContentTitle"><img src="/soccer/images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">회원정보수정</span></div>

        <div id="infoUpateBox">
			<form method="POST" enctype="multipart/form-data" action="/soccer/mypage/mypageinfoupdateok.do">
            <table id="infoUpateTable" class="table table-bordered">
             
                <tr>
                    <th style="width: 150px;">이름</th>
                    <td style="width: 450px;">
                        <input type="text" class="form-control" placeholder="${dto.name}" disabled name="name"></td>
                </tr>
                <tr>
                    <th style="width: 150px;">키(cm)</th>
                    <td style="width: 450px;">
                        <input type="text" class="form-control" placeholder="${dto.height}" name="height"></td>
                </tr>
                <tr>
                    <th style="width: 150px;">몸무게(kg)</th>
                    <td style="width: 450px;">
                        <input type="text" class="form-control" placeholder="${dto.weight}" name="weight"></td>
                </tr>
                <tr>
                    <th style="width: 150px;">사진</th>
                    <td style="width: 450px;">
                        <input type="file" class="form-control" name="image"> </td>
                </tr>
                
            </table>
            <div><button type="submit" class="btn btn-default" id="infoUpdateBtn">수정하기</button></div>
            </form>
        </div>


    </div>
	
	 <!-- 수정확인 Modal-->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #25282A;">
                    <h5 class="modal-title" id="exampleModalLabel" style="color: #92DAEC; display: inline;">수정 완료</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" style="color: white; font-size: 0.9em;">X</span>
                    </button>
                </div>
                <div class="modal-body">수정이 완료되었습니다.</div>
                <div class="modal-footer">
                    <!-- ok버튼 누르면 마이페이지 처음 메뉴로 되돌아가기 -->
                    <a class="btn" id="modalY" href="/soccer/mypage/mypage.do">확인</a>
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

// 	모달팝업
//     $("#infoUpdateBtn").click(function (e) {
//         e.preventDefault();
//         $("#updateModal").modal("show");
//         $("#updateModal").clientX = ("100px");
//         // clientY: 100px;
//     });

        
    </script>
    
    
</body>

</html>