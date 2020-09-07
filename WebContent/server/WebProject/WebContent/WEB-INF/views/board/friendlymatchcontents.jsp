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
<link rel="stylesheet" href="/soccer/css/friendlymatchcontents.css">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<style>

 .center {            
            padding-top: 50px;
            /* background-color: #eee;      */
        }

        /* 박스전체 */
        #centerBoxMain{
            /* border: 1px solid black;             */
            width: 1250px;
            /* height: 1000px; */
            margin: 0px auto;          
            font-size: 1.1em;     
        }

        /* 질문내용 박스 */
        #centerBox2 {
            margin-top: 25px;
            border-bottom: 1px solid #0C1B23; 
            /* border-top: 1px solid #0C1B23; */ 
            border-bottom-style: dashed;
            width: 1150px;            
            display: inline-block;
        }

        /* 답글내용 박스 */
        #centerBox3 {            
            /* border: 1px solid red; */
            border-bottom: 1px solid #0C1B23; 
            border-bottom-style: dashed;
            width: 1150px;               
        }

        /* 답글쓰기 박스 */
        #centerBox4 {
            /* border: 1px solid #0C1B23;  */
            border-bottom: 1px solid #0C1B23; 
            border-bottom-style: dashed;
            width: 1150px;            
        }

        /* 목록버튼 , TOP버튼 박스 */
        #centerBox5 {
            /* border: 1px solid #0C1B23;  */
            width: 1150px;            
            display: inline-block;
            margin-top: 10px;
            margin-bottom: 25px;
        }

        /* 박스전체의 박스*/
        .centerBox {          
            margin-left: 25px;
        }

        /* 질문박스 span들 */
        #centerBox2 div:nth-child(1) span:nth-child(1) {
            /* border: 1px solid blue;                         */
            padding-top: 5px;            
            margin-left: 5px;         
            margin-right: 5px;   
            font-weight: bold;                 ;                 
        }
        
        
        #centerBox2 div:nth-child(1) span:nth-child(2) {
            /* border: 1px solid blue;                         */
            padding-top: 5px;            
            margin-left: 5px;   
            float: right;                 
            margin-right: 15px;   
            font-weight: bold;                 ;                 
        }
        
        #centerBox2 span:nth-child(3) {
            /* border: 1px solid blue;                         */
            padding-top: 5px;            
            margin-left: 5px;   
            float: right;                 
            margin-right: 15px;   
            font-weight: bold;                 ;                 
        }

        /* 질문박스 제목 */
        #centerBox2 > div:nth-child(1) {
            /* float: left;  */           
            padding-left: 5px;
            width: 1150px;         
            border-bottom: 1px solid #0C1B23;
            border-top: 1px solid #0C1B23;
            background-color: #eee; 
            padding-top: 5px;
            padding-bottom: 5px;
        }
        
        #centerBox2 > div:nth-child(2) {
            margin-top: 20px;          
        }
        
        /* 질문박스 내용 */
        #centerBox2 .content {
            /* border: 1px solid blue; */
            height: auto * 100px;            
            margin-left: 5px;            
            padding: 5px;
            margin-top: 10px;      
            padding-bottom: 25px;      
        }

        /* 답글박스 div들 */
        #centerBox3 div {
            /* border: 1px solid green;                         */
            margin-left: 5px;                     
            font-weight: bold; 
            padding-left: 5px;   
        }

        /* 답글쓰기 글쓴이 */
        #centerBox3 div:nth-child(1) {
            padding-top: 8px;            
        }

        /* 답글 내용 */
        #centerBox3 .content {
            height: 100px;
            font-weight: normal;
            padding-top: 5px;                        
        }

        /* 답글내용 3번째 dvi */
        #centerBox3 div:nth-child(4) {
            /* border: 1px solid green;                 */
            margin-bottom: 5px;
        }

        /* 댓글 박스 div들 */
        #centerBox4 div {
            /* border: 1px solid indigo;                         */
            padding: 5px;
            font-weight: bold;            
            padding-left: 10px;
            
        }
        
        /* 이미티콘버튼, 등록버튼 */
        #centerBox4 div span input {
            /* border: 1px solid indigo;                         */        
        }

        /* 댓글쓰기 내용 */
        #centerBox4 textarea {
            resize:none;
            padding-left: 5px;
        }

        /* 목록버튼, TOP버튼 */
        #centerBox5 > span {
            /* border: 1px solid red; */
            width: 50px;
            float: right;     
            margin-right: 15px;
            margin-left: 5px;                                                       
        }

        /* 모든 버튼들 */
        #centerBox5 > span input, #deleteBtn, #centerBox4 span input, #centerBox3 input {  
            /* color: white;   */
            height: 25px;
            line-height: 0.8em;
        }

        #centerBox6 {
            /* border: 1px solid red; width: 150px; */
            margin-left: 33px;
            margin-top: 7px;
            margin-bottom: 15px;
        }

        #centerBox6 span {
            font-size: 1.1em;
            padding: 3px;
            font-weight: bold;
        }

        #centerBox6 a {
            color: black;
        }
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

        <div class="pageContentTitle"><img src="/soccer/images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">친선경기모집</span></div>
        <div id="contentsBox">
<%-- <c:choose> --%>
<%--                 <c:when test="${category_seq == 1}"> --%>
<!--                 	<span class="contentTitle">질문게시판</span> -->
<%--                 </c:when>      --%>
<%--                   <c:when test="${category_seq == 2}"> --%>
<!--                 	<span class="contentTitle">갤러리</span> -->
<%--                 </c:when>            --%>
<%--                 <c:when test="${category_seq == 3}"> --%>
<!--                 	<span class="contentTitle">자유게시판</span> -->
<%--                 </c:when> --%>
<%--                  <c:when test="${category_seq == 4}"> --%>
<!--                 	<span class="contentTitle">강의게시판</span> -->
<%--                 </c:when> --%>
<%--                  <c:when test="${category_seq == 5}"> --%>
<!--                 	<span class="contentTitle">친선경기모집</span> -->
<%--                 </c:when> --%>
<%--                  <c:when test="${category_seq == 6}"> --%>
<!--                 	<span class="contentTitle">용병모집</span> -->
<%--                 </c:when> --%>
<%--             </c:choose> --%>

            <div id="centerBoxMain">

                <!-- 글내용 -->
                <div id="centerBox2" class="centerBox">
                    <div>
                        <span>제목: ${dto.title}</span>
                        <span>작성시간: ${dto.regdate}</span>
                        <span>작성자 | ${dto.name}</span>
                        <div style="clear: both;"></div>
                    </div>
<%--                     <div><c:if test="${dto.orgfilename != 'null'}"> --%>
<%-- 	                <div><img src="/soccer/files/${dto.orgfilename}"></div> --%>
<%-- 	                </c:if> --%>
<!-- 	                </div>  -->
                    <div class="content" style="font-size:1.3em;">
					${dto.content}
                    </div>
                </div>
                <!-- 답변목록 -->
                <div id="centerBox3" class="centerBox">
                    <div id="centerBox6">
                        <span>댓글</span>
                        <a href="">최신순</a>
                        <a href="">등록순</a>
                    </div>
                    <div>
                        <span>이수지</span>
                    </div>
                    <div class="content">오전인가요 오후인가요?</div>
                    <div>
                        <span>2020.07.18 21:40</span>
                        <span><input type="button" value="답글쓰기" class="btn"></span>
                    </div>
                </div>
                <!-- 답변하기 -->
                <div id="centerBox4" class="centerBox">
                    
                    <div>${name}</div>	
                    <div><textarea name="" id="" cols="103" rows="1"> 댓글을 남겨보세요</textarea></div>
                    <div>
                        <span><input type="button" value="이모티콘" class="btn"></span>
                        <span><input type="button" value="등록" class="btn"></span>
                    </div>
                </div>
                <!-- 목록, Top -->
                <div id="centerBox5" class="centerBox">
                    <span><input type="button" value="▲TOP" class="btn"></span>
                       <c:choose>
                <c:when test="${category_seq == 1}">
                	<span><input type="button" value="목록" class="btn btn-primary" onclick="location.href='/soccer/board/communityQuestionBulletinBoard.do?search=${search}&page=${page}&selectKeyword=${selectKeyword}&selectrow=${selectrow}';"></span>
                </c:when>     
                  <c:when test="${category_seq == 2}">
                	<span><input type="button" value="목록" class="btn btn-primary" onclick="location.href='/soccer/board/communityGalleryBulletinBoard.jsp.do?search=${search}&page=${page}&selectKeyword=${selectKeyword}&selectrow=${selectrow}';"></span>
                </c:when>           
                <c:when test="${category_seq == 3}">
                	<span><input type="button" value="목록" class="btn btn-primary" onclick="location.href='/soccer/board/communityFreeBulletinBoard.do?search=${search}&page=${page}&selectKeyword=${selectKeyword}&selectrow=${selectrow}';"></span>
                </c:when>
                 <c:when test="${category_seq == 4}">
                	<span><input type="button" value="목록" class="btn btn-primary" onclick="location.href='/soccer/board/communityLectureBulletinBoard.do?search=${search}&page=${page}&selectKeyword=${selectKeyword}&selectrow=${selectrow}';"></span>
                </c:when>
                 <c:when test="${category_seq == 5}">
                	<span><input type="button" value="목록" class="btn btn-primary" onclick="location.href='/soccer/board/friendlymatchrecruit.do?search=${search}&page=${page}&selectKeyword=${selectKeyword}&selectrow=${selectrow}';"></span>
                </c:when>
                 <c:when test="${category_seq == 6}">
                	<span><input type="button" value="목록" class="btn btn-primary" onclick="location.href='/soccer/board/mercenaryrecruit.jsp.do?search=${search}&page=${page}&selectKeyword=${selectKeyword}&selectrow=${selectrow}';"></span>
                </c:when>
               	</c:choose>
               	
               	<!-- 수정 -->
                <c:if test="${id == dto.id}">
                <span><input type="button" value="수정" class="btn btn-primary" onclick="location.href='/soccer/board/edit.do?seq=${dto.seq}&search=${search}&page=${page}&selectKeyword=${selectKeyword}&selectrow=${selectrow}&category_seq=${category_seq}';"></span>
                </c:if>
                                
                <!-- 삭제 -->    
                <c:if test="${id == dto.id}">
                <span><a id="deleteBtn" onclick="return confirm('정말로 삭제하시겠습니까?')" href="/soccer/board/deleteok.do?seq=${dto.seq}&category_seq=${category_seq}" class="btn btn-primary">삭제</a></span>
                </c:if>
               	
                </div>
                <form method="POST" action="/soccer/board/friendlymatchapplyok.do">
                <div>
                <input type="hidden" value="${dto.seq}" id="seq" name="seq">
                <input type="hidden" value="${login_seq}" id="login_seq" name="login_seq">

                <input type="submit" value="신청하기" class="btn btn-info" id="applyBtn">
                </div>
                </form>
            </div>
        </div>
    </div>
   

    <!-- 친선경기신청 Modal-->
    <div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #25282A;">
                    <h5 class="modal-title" id="exampleModalLabel" style="color: #92DAEC; display: inline;">친선경기신청</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" style="color:white">X</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div>친선경기 신청이 완료되었습니다.</div>
                </div>
                <div class="modal-footer">
                    <!-- 비밀번호를 입력하고 ok버튼 누르면 회원 비밀번호와 비교하여 일치했을시 다시 물어보기  -->
                    <a class="btn" id="modalY" href="/soccer/board/friendlymatchrecruit.do">확인</a>
                    <button class="btn" type="button" data-dismiss="modal">cancle</button>
                </div>
            </div>
        </div>
    </div>



<!-- 내용 끝 -->





<!-- 하단부  -->
<%@include file="/WEB-INF/views/inc/footer.jsp"%>


<!-- 스크립트------------------------------------------------------------- -->
<script>
// 신청하기 모달

$("#applyBtn").click(function (e) {
    setTimeout(function(){
    e.preventDefault();
    $("#applyModal").modal("show");
	}, 200);
});



</script>


</body>

</html>