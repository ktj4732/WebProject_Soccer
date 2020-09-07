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
	<link rel="stylesheet" href="/soccer/css/clubmanagementFriendlyMatchResultDrawup.css">
    
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
                    <span>구단관리</span>
                    <span>></span>
                    <span>구단신청관리</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                         	<li class="subMenuItem"><a href="/soccer/board/clubmanagementClubApplicationManagement.do">구단신청관리</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/clubmanagementPlayerManagement.do">선수관리</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/clubmanagementEntrylistDrawup.do">포메이션 작성</a></li>
                            <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a href="/soccer/board/clubmanagementFriendlyMatchResultDrawup.do">경기결과반영</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/clubmanagementFriendlyMatchRecruitManagement.do">친선경기모집관리</a></li>
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
                class="contentTitle">친선결과반영</span></div>

                <div id="centerMainBox">
                    <div id="centerbox1">
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
                                    <th><input type="checkbox" name="" id="checkAll"></th>
                                    <th>순번</th>
                                    <th>경기</th>    
                                    <th>날짜</th> 
                                    <th>시간</th>
                                    <th>장소</th>
                                </tr>
                            </thead>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th>1</th>
                                    <td><a href="#">검단FC vs 화랑</a></td>            
                                    <th>2020-07-18</th> 
                                    <th>07:00</th>
                                    <th>한국폴리텍</th>                                    
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th>2</th>
                                    <td><a href="#">화랑 vs 해병대</a></td>
                                    <th>2020-06-13</th>   
                                    <th>09:00</th>
                                    <th>하원초등학교</th>   
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th>3</th>
                                    <td><a href="#">시흥FC vs 고려</a></td>
                                    <th>2020-03-28</th>   
                                    <th>10:00</th>
                                    <th>가천대학교</th>       
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <td><a href="#"></a></td>
                                    <th></th>   
                                    <th></th>
                                    <th></th>      
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <td><a href="#"></a></td>
                                    <th></th>   
                                    <th></th>
                                    <th></th>     
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <td><a href="#"></a></td>
                                    <th></th>   
                                    <th></th>
                                    <th></th>       
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <td><a href="#"></a></td>
                                    <th></th>   
                                    <th></th>
                                    <th></th>        
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <td><a href="#"></a></td>
                                    <th></th>   
                                    <th></th>
                                    <th></th>       
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <td><a href="#"></a></td>
                                    <th></th>   
                                    <th></th>
                                    <th></th>       
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <td><a href="#"></a></td>
                                    <th></th>   
                                    <th></th>
                                    <th></th>      
                                </tr>           
                        </table>                     
                    </div>
                    
                    
                    <div id="centerbox3">                
                        <ul id="pagination" class="pagination">
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
                           <input id="centerbox4Btn1" type="button" value="작성" onclick=""; class="btn btn-primary">
                           <input id="centerbox4Btn2" type="button" value="수정" onclick=""; class="btn btn-primary">
                           <input id="centerbox4Btn3" type="button" value="삭제" onclick=""; class="btn btn-primary">
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

    $("#centerbox4 input").mouseover(function() {
        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");

        })

        $("#centerbox4 input").mouseout(function() {
        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");

        })

        $("#centerbox4Btn1").click(function() {                    
            // alert($(this));
            child = window.open(
            "clubmanagementFriendlyMatchResultDrawupAdd.html",
            "check",
            "width=430, height=390, top=150, left=550"
        );
        }); 

        // 전체선택
        $("#checkAll").click(function () {
            
            //만약 전체 선택 체크박스가 체크된상태일경우 
            if($("#checkAll").prop("checked")) { 
                //해당화면에 전체 checkbox들을 체크해준다 
            $("input[type=checkbox]").prop("checked",true); 
            
            } 
                // 전체선택 체크박스가 해제된 경우 
            else { 
                //해당화면에 모든 checkbox들의 체크를해제시킨다. 
            $("input[type=checkbox]").prop("checked",false); }
            
        });

        
    </script>
    
    
</body>

</html>