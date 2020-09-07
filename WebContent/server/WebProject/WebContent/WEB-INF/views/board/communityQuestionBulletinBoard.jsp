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
    <link rel="stylesheet" href="/soccer/css/communityFreeBulletinBoard.css">
    
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
                            <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a href="/soccer/board/communityQuestionBulletinBoard.do">질문게시판</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/communityGalleryBulletinBoard.do">갤러리</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/communityFreeBulletinBoard.do">자유게시판</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/communityLectureBulletinBoard.do">강의게시판</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/friendlymatchrecruit.do">친선경기모집</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/mercenaryrecruit.do">용병모집</a></li>
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
                class="contentTitle">질문게시판</span></div>

                <div id="centerMainBox">
                    <div id="centerbox1">
                    	<!-- 한페이지 당 출력 갯수 -->
                        <select name="selectrow" id="selectrow">
                            <option value="10" id="10">10개씩 보기</option>
                            <option value="25" id="25">25개씩 보기</option>
                            <option value="50" id="50">50개씩 보기</option>   
                        </select>
                        <span id="sortform">
                            <a href="#" class="glyphicon glyphicon-list"></a>
                            <a href="#" class ="glyphicon glyphicon-list-alt"></a>
                            <a href="#" class="glyphicon glyphicon-th-large"></a>
                        </span>            
                    </div>
                    
                    <!-- 테이블 -->
                    <div id="centerbox2">
                        <table class="table table-striped" id="verticalTable" style="">
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
                            	
                            	<!-- 게시물 내용 -->
                            	<c:forEach items="${list}" var="dto">
                                <tr>
                                    <td>${dto.seq}</td>
                                    <td>
                                    	<a href="/soccer/board/BulletinBoardContent.do?seq=${dto.seq}&search=${search}&page=${page}&selectKeyword=${selectKeyword}&selectrow=${selectrow}&category_seq=${dto.category_seq}">
                                    		${dto.title}
                                    	</a>
                                    </td>
                                    <td>${dto.name}</td>
                                    <td>${dto.regdate}</td>
                                    <td>${dto.readcount}</td>                   
                                </tr>    
                                </c:forEach>                                                          
                        </table>                     
                    </div>
        
                    <div id="centerbox3">                
                    	
        				<!-- 페이지 버튼 -->
                        ${pagebar}
                        
                    </div> 
                    
                    <div id="centerbox4">
                        <div style="float: right;">
                        <!-- 검색창 -->                
                            <form method="GET" action="/soccer/board/communityQuestionBulletinBoard.do" id="searchForm" style="display: inline;">
	                            <select id="selectKeyword" name="selectKeyword">
	                                <option value="title" id="title">제목</option>
	                                <option value="content" id="content">내용</option>
	                                <option value="title_content" id="title_content">제목+내용</option>
	                                <option value="name" id="name" >글쓴이</option>
	                            </select>                            
	                            <input id="search" name="search" type="text" size="35" style="height: 25px;" required value="${search}">
	                            <input id="searchbtn" type="button" value="검색" class="btn btn-primary" onclick="$('#searchForm').submit();">
	                            
	                            <input type="hidden" name="selectrow" value="${selectrow}">
                            </form>              
                       
                            <!-- 로그인 시 글쓰기 가능 -->
                            <c:if test="${not empty id}">
                            <input id="writebtn" type="button" value="글쓰기" onclick="location.href='/soccer/board/writingDrawup.do?category_seq=${dto.category_seq}';" class="btn btn-primary">
							</c:if>
							                                                      
                        </div>
                    </div>
                    
                </div>

    </div>
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

		   $("#searchbtn").mouseover(function() {
		       $(this).css("background-color", "#92DAEC").css("color", "black");
		   })
		
		   $("#searchbtn").mouseout(function() {
		   	$(this).css("background-color", "").css("color", "");
		   })
		
		   $("#writebtn").mouseover(function() {
		  		$(this).css("background-color", "#92DAEC").css("color", "black");
		   })
		
		   $("#writebtn").mouseout(function() {
		   	$(this).css("background-color", "").css("color", "");
		   })
		        
		    //한페이지 당 출력 갯수
			document.getElementById("selectrow").onchange = function(){    
		           	
		   	location.href = "/soccer/board/communityQuestionBulletinBoard.do?selectrow=" + $("#selectrow").val() 
		   			+ "&selectKeyword=" + $("#selectKeyword").val()
		   			+ "&search=" + $("#search").val()    
		   			+ "&page=" + ${page};
		};
		
			//검색 키워드
			$("#${selectKeyword}").attr("selected","selected");
			
			//한페이지당 출력 갯수
			$("#${selectrow}").attr("selected","selected");
    


    </script>
    
    
</body>

</html>