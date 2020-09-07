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
	<link rel="stylesheet" href="/soccer/css/aa.css">
    
    <style>
    
    	.selectPlayer {
    		background-color: tomato; 
    	}
    
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
                    <span>전력분석</span>
                    <span>></span>
                    <span>선수분석</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">                           
                        <ul>
  							<li class="subMenuItem"><a href="/soccer/board/clubmanagementClubApplicationManagement.do">구단신청관리</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/clubmanagementPlayerManagement.do">선수관리</a></li>
                            <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a href="/soccer/board/clubmanagementEntrylistDrawup.do">포메이션 작성</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/clubmanagementFriendlyMatchResultDrawup.do">경기결과반영</a></li>
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
            class="contentTitle">포메이션 작성</span></div>
			
            <div id="centerMainBox">
                <!-- 왼쪽 명단 추가하는 박스 -->
                <div id="centerbox2" >
                    <div id="centerbox2Left">
                        <div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" name="" id="checkAll"></th>
                                        <th>포지션</th>
                                        <th>번호</th>
                                        <th>이름</th>
                                        <th>나이</th>
                                    </tr>                                
                                </thead>
                                	 <c:forEach items="${entry}" var="dto">
                                	<tr>
                                    <td><input type="checkbox" name="" id="${dto.entry_seq}"></td>
                                    <td>${dto.position}</td>
                                    <td>${dto.backnumber}</td>
                                    <td>${dto.name}</td>
                                    <td>${dto.old}</td>
                                	</tr>
                                    </c:forEach>
                                    
                             
                               
                            </table>
                        </div>
                        <div id="centerbox2LeftButton">
                            <!-- <span><input type="button" value="추가" id="centerbox2LeftButtonAdd" class="btn btn-primary"></span> -->
                            <!-- <span><input type="button" value="수정"></span> -->
                            <!-- <span><input type="button" value="삭제" id="centerbox2LeftButtonDel" class="btn btn-primary"></span> -->
                        </div>
                    </div>
                    <!-- 오른쪽 포메이션 박스 -->
                    <div id="centerbox2Right">
                        <div id="formation" style="background-image: url(/soccer/images/soccer5.jpg);">
                            <div id="front">      
                                <c:forEach items="${fwList}" var="dto">
                                <img src="/soccer/images/${dto.image}" id="${dto.seq}" name="1" class="player" alt="" title="${dto.name}">
                                </c:forEach>
                            </div>
                            <div id="middle">
                                <c:forEach items="${mfList}" var="dto">
                                <img src="/soccer/images/${dto.image}" id="${dto.seq}" name="2" class="player" alt="" title="${dto.name}">
                                </c:forEach>
                            </div>
                            <div id="back">
                              	<c:forEach items="${dfList}" var="dto">
                                	<%-- <img src="/soccer/images/${dto.image}" id="${dto.seq}" name="3" class="player" alt=""> --%>
                                	<img src="/soccer/images/${dto.image}" id="${dto.seq}" name="3" class="player" alt="" title="${dto.name}">
                                </c:forEach>
                            </div>
                            <div id="gk">
                                <c:forEach items="${gkList}" var="dto">
                                	<img src="/soccer/images/${dto.image}" id="${dto.seq}" name="4" class="player" alt="" title="${dto.name}">
                                </c:forEach>
                            </div>                            
                        </div>
                        <div id="formationSelect">
                            <span style="font-weight: bold;">포메이션 : </span>
                            <select style=" height: 25px;" id="formationNum" name="formationNum">
                                <option value="442" id="422">442</option>
                                <option value="433" id="433">433</option>
                                <option value="352" id="352">352</option>
                                <option value="343" id="343">343</option>
                                <option value="541" id="541">541</option>
                                <option value="532" id="532">532</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	
	
	<!-- 내용 끝 -->
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>


	    $("#centerbox2LeftButtonAdd").click(function() {                    
	        // alert($(this));
	        child = window.open(
	        "clubmanagementEntrylistDrawupAdd.html",
	        "check",
	        "width=350, height=180, top=180, left=730"    
	    );
	   }); 
	   

	   function move(){
		   
	   	   //FW는 FW-Field 지역만 위치조정이 가능하다.
		   $("#formation #front img").draggable({                    
		        //FW 박스 안에서만 움질일수 있도록
		        containment: "#formation div:nth-child(1)" ,
		        // 자석처럼 달라붙게
		        // snap: "#formation div:nth-child(1)"
		   });
		
		   //MF는 MF-Field 위치조정이 가능하다.
		   $("#formation #middle img").draggable({                    
		        //MF 박스 안에서만 움질일수 있도록
		        containment: "#formation div:nth-child(2)" ,
		        // 자석처럼 달라붙게
		        // snap: "#formation div:nth-child(1)"
		   });
		
		   //DF는 DF-Field 위치조정이 가능하다.
		   $("#formation #back img").draggable({                    
		        //DF 박스 안에서만 움질일수 있도록
		        containment: "#formation div:nth-child(3)" ,
		        // 자석처럼 달라붙게
		        // snap: "#formation div:nth-child(1)"
		   });
		
		    //GK는 GK-Field 위치조정이 가능하다.
		    $("#formation #gk img").draggable({                    
		        //GF 박스 안에서만 움질일수 있도록
		        containment: "#formation div:nth-child(4)" ,
		        // 자석처럼 달라붙게
		        // snap: "#formation div:nth-child(1)"
		   });
	   };//move;
	
	   move();
	   
	   $("#formation img").dblclick(function() {                    
	        // alert($(this));
	        child = window.open(
	        "clubmanagementEntrylistDrawupRecommend.do?team_seq=" + ${team_seq} + "&formation_seq=" + this.id + "&position=" + this.name,
	        "check",
	        "width=500, height=300, top=180, left=730"                                        
	    );
	   });         
	
	   $("#centerbox2LeftButton input").mouseover(function() {
	
	    // alert($(this).text());
	    $(this).css("background-color", "#92DAEC").css("color", "black");
	
	    })
	
	    $("#centerbox2LeftButton input").mouseout(function() {
	
	    // alert($(this).text());
	    $(this).css("background-color", "").css("color", "");
	
	    })
	
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

	   	//포지션값들 배치하기
		<c:forEach items="${list}" var="dto">
		$("#${dto.seq}").css({
			"left" : "${dto.position_x}px",
			"top" : "${dto.position_y}px"			
		});   	
	   	</c:forEach>
	   	
	   	//Ajax
	   	//위치값 수정하기
	   	$(".player").draggable({
	   		
	   		stop: function(event, ui) {
	   			
	   			//alert(ui.position.top);
				//alert(ui.position.left);
				//alert(this.id);
				
				$.ajax({
					
					type: "GET",
					url: "/soccer/board/clubmanagementEntrylistDrawupOk.do",
					
					data: "seq=" + this.id + "&position_x=" +  ui.position.left + "&position_y=" + ui.position.top,
					
					success: function(result) {
						if (result == 0) {
							alert("저장하는 작업을 실패했습니다.");
						}
					},
					error: function(a,b,c) {
						console.log(a,b,c);
					}
					
				})
	   			
	   		}
	   		
	   	});
	   	
	   	//포메이션 변경하면 
	   	document.getElementById("formationNum").onchange = function(){    
        	
        	location.href = "/soccer/board/clubmanagementEntrylistDrawup.do?formationNum=" + $("#formationNum").val() 
        			
    	};  
    	
    	 $("#${formationNum}").prop("selected",true); 
 	   	

	   	
	   	
    	 
    	 
    	
    	 
    	
	   
        
    </script>
    
    
</body>

</html>