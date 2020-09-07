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
    
    <script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
    
    <style>
    	
    	.center {
    	
    		width: 300px;
    	
    	}
    	
    </style>
</head>

   	<%-- <%@include file="/WEB-INF/views/inc/header.jsp" %> --%>

    <!-- <div id="topBoard">
    </div>

    <div id="scoreBoard">
        <div id="subOuter">
            <div class="menuTitleBox">
                <div class="menuTitle">커뮤니티</div>
                <div class="breadcrumb">
                    <span>HOME</span>
                    <span>></span>
                    <span>전력분석</span>
                    <span>></span>
                    <span>선수분석</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem"><a href="teamAnalysis.html">팀분석</a></li>
                            <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a href="playerAnalysis.html">선수분석</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div> -->
    <!-- 상단부 끝 -->

	<!-- 내용 시작 -->
	
	<div class="center">
       <!--  <div class="pageContentTitle"><img src="/soccer/images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">자유게시판</span></div> -->

        <div id="centerBoxMain">
            
            <div>
				<!-- <h1>자유 게시판 <small>Board</small></h1> -->
                
                <table class="table delete">
                    <tr>
                        <td>정말 삭제하시겠습니까?</td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" class="btn btn-default" onclick="location.href='/codestudy/board/view.do?seq=${seq}';">
                                <span class="glyphicon glyphicon-chevron-left"></span>
								뒤로
                            </button>
                            <button type="button" class="btn btn-default" onclick="location.href='/soccer/board/deleteok.do?seq=${seq}';">
                                <span class="glyphicon glyphicon-remove"></span>
								삭제
                            </button>
                        </td>
                    </tr>
                </table>
                
                <div style="clear:both;"></div>
                
			</div>
            
        </div>   

    </div>
	
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
   <%--  <%@include file="/WEB-INF/views/inc/footer.jsp" %> --%>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

        

        
    </script>
    
    
</body>

</html>