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
    <link rel="stylesheet" href="css/NoticeBoard.css">
    
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
                    <span>관리자 메뉴</span>
                    <span>></span>
                    <span>공지사항</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <!-- <li class="subMenuItem"><a href="#">경기 결과(리그)</a></li>
                            <li class="subMenuItem"><a href="#">경기 결과(친선)</a></li>
                            <li class="subMenuItem"><a href="#">공지사항</a></li>
                            <li class="subMenuItem"><a href="#">블랙리스트</a></li>
                            <li class="subMenuItem"><a href="#">경기장 관리</a></li>
                            <li class="subMenuItem"><a href="#">정규리그 일정</a></li>
                            <li class="subMenuItem"><a href="#">구단관리</a></li>
                            <li class="subMenuItem"><a href="#">선수검색</a></li> -->
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
                class="contentTitle">공지사항</span></div>

                <div id="centerMainBox">
                    <div id="centerbox1">
                        <!-- <span id="submenutitle" style="font-size: 25px; margin-top: -15px;">질문게시판</span> -->
                        
                        <select name="" id="selectrow">
                            <option value="">10개씩 보기</option>
                            <option value="">25개씩 보기</option>
                            <option value="">50개씩 보기</option>   
                        </select>
                        <span id="sortform">
                            <a href="#" class="glyphicon glyphicon-list"></a>
                            <a href="#" class ="glyphicon glyphicon-list-alt"></a>
                            <a href="#" class="glyphicon glyphicon-th-large"></a>
                        </span>            
                    </div>
                    <div id="centerbox2">
                        <table class="table table-striped" id="verticalTable">
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
                                    <td><a href="#">※ [코로나19] 6월 15일 ~ 무기한 시설중지(확진자 한 자리수 발생때 까지)</a></td>
                                    <td>관리자</td>
                                    <td>2020.07.14 17:48</td>
                                    <td>48</td>                   
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td><a href="#">※ [코로나 19] 다중이용 시설 폐쇄에 따른 리그일정 중지</a></td>
                                    <td>관리자</td>
                                    <td>2020.07.14 17:48</td>
                                    <td>157</td>      
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td><a href="#">※[우천취소] 7월 25일 전경기 우천취소!!</a></td>
                                    <td>관리자</td>
                                    <td>2020.07.14 17:48</td>
                                    <td>22</td> 
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
                    <div style="clear: both;"></div>
                    
                    <div id="centerbox4">
                        <div style="float: right;">                
                            <select>
                                <option value="">제목</option>
                                <option value="">내용</option>
                                <option value="">제목+내용</option>
                                <option value="">글쓴이</option>
                            </select>
                            <input id="searchkeyword" type="text" size="35" style="height: 25px;">
                            <a href=""><input id="searchbtn" type="button" value="검색" class="btn btn-primary"></a>
                           <input id="writebtn" type="button" value="글쓰기" onclick="location.href='ex01.html'"; class="btn btn-primary">
                        </div>
                    </div>
                    <div style="clear: both;"></div>
                    
                </div>

    </div>
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

	    $("#pagination > li >a").click(function() {
	
	        // alert($(this).text());            
	        $("#pagination > li>a").removeClass("nowPage");    
	        $(this).addClass("nowPage");            
	        
	    })  
	    
	         
	
	    $("#searchbtn").mouseover(function() {
	
	        // alert($(this).text());
	        $(this).css("background-color", "#92DAEC").css("color", "black");
	
	    })
	
	    $("#searchbtn").mouseout(function() {
	
	    // alert($(this).text());
	    $(this).css("background-color", "").css("color", "");
	
	    })
	
	    $("#writebtn").mouseover(function() {
	
	    // alert($(this).text());
	    $(this).css("background-color", "#92DAEC").css("color", "black");
	
	    })
	
	    $("#writebtn").mouseout(function() {
	
	    // alert($(this).text());
	    $(this).css("background-color", "").css("color", "");
	
	    })

    </script>
    
    
</body>

</html>