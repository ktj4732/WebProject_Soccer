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
    
    	 #centerMainBox {
            /* border: 1px solid black; */
            width: 1200px;
            /* height: 700px; */
            margin: 0px auto;    
            font-size: 1.1em;        
            font-weight: bold;
        }

        #centerBox1 {
            /* border: 1px solid red; */
            width: 1000px;
            float: left;                      
            margin-left: 15px;                          
            margin-bottom: 30px;                
        }

        #centerBox2 {
            /* border: 1px solid red; */
            display: inline-block;
            margin-left: 15px;  
            margin-bottom: 30px;
        }

        #centerBox3 {
            /* border: 1px solid blue;             */
            margin-left: 15px;  
        }

        #centerBox4 {
            /* border: 1px solid red;             */
            margin-left: 15px;              
        }

        #centerBox5 {
            /* border: 1px solid red; */
            float: right;   
            margin-right: 80px;       
            margin-bottom: 25px;
            margin-right: 76px;
            
        }
      
        #centerBox3 textarea {
            resize:none;
        }
        
        #centerBox4 span:nth-child(2) {
            display: inline-block;
            margin-top: 6px;
        }

        #centerBox4 input {
            padding-top: 4px;
        }
        
        #centerBox1 select {
            height: 30px;
            padding: 0px;
        }

        #centerBox5 input, #centerBox5 button{
            /* color: white;  */
            /* background-color: #1E3440 ; */
            line-height: 0.8em;
            height: 25px;
        }

        #centerBox4 input {
            /* color: white;  */
            /* background-color: #1E3440 ; */
        }
        
        #centerBox2 input {
        	padding: 5px;
        }
        
        #centerBox3 textarea {
        	padding: 5px;
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
                    <span>커뮤니티</span>
                    <span>></span>
                    <span>자유게시판</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem"><a href="/soccer/board/communityQuestionBulletinBoard.do">질문게시판</a></li>
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
  
	     <div class="center">
            <div class="pageContentTitle"><img src="/soccer/images/rogowithoutletter.png" class="contentTitleImg"><span
                    class="contentTitle">자유게시판</span></div>
    
                <!-- 메인박스  -->
                <form method="POST" action="/soccer/board/editok.do">
                    <div id="centerMainBox">                                 
                      <!-- 게시판 선택 -->
                      <!--  
                       <div id="centerBox1">
                            <span>게시판 :</span>
                            <select name="category_seq" id="category_seq">
                                <optgroup label="게시판 선택">
	                                <option value="1">질문게시판</option>
	                                <option value="2">갤러리</option>   
	                                <option value="3">자유게시판</option>   
	                                <option value="4">강의게시판</option>   
	                                <option value="5">친선경기모집</option>  
	                                <option value="6">용병모집</option>
                                </optgroup> 
                            </select>
                            <select name="neglect" id="neglect">
                                <option value="">말머리 선택</option>                
                            </select>
                        </div>   
                        -->      
                
                        <!-- 제목  -->
                        <div id="centerBox2">
                            <span>제목 : </span>
                            <input type="text" name="title" id="title" size="70px" placeholder="제목을 입력해주세요" required value="${dto.title}">
                        </div>
                        
                        <!-- 본문  -->
                        <div id="centerBox3">          
                            <textarea name="content" id="content" cols="120" rows="17" placeholder="내용을 입력해주세요" required>${dto.content}</textarea>
                        </div>
                        
                        <!-- 파일첨부 -->
                      	<!--
                         <div>
                            <div id="centerBox4">
                                <div>
                                    <span>파일첨부 :</span>
                                    <span><input type="file" id="attach" name="attach" class="form-control" style="height: 25px; font-size: 0.5em; padding: 1.8px;" value="sss" ></span>
                                </div>
                            </div>                          
                        </div> 
                        -->
                        
                        <!-- 확인/미리보기 버튼 -->
                        <div id="centerBox5">            
                                <!-- <input class="btn btn-primary" id="writebtn1" type="button" value="확인" onclick="location.href='ex01.html'";> -->
                                <button class="btn btn-primary" id="writebtn1" type="submit" value="확인"><span>확인</span></button>
                                <input class="btn btn-primary" id="writebtn2" type="button" value="뒤로" onclick="location.href='/soccer/board/communityFreeBulletinBoard.do';">         
                        </div>
                        <div style="clear: both;"></div>
                        
                        <input type="hidden" name="seq" value="${dto.seq}">
                        <input type="hidden" name="search" value="${dto2.search}">
                        <input type="hidden" name="selectKeyword" value="${dto2.selectKeyword}">
                        <input type="hidden" name="selectrow" value="${dto2.selectrow}">
                        <input type="hidden" name="category_seq" value="${dto2.category_seq}">
                        
                    </div>
    			</form>
        </div>
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

    $("#centerBox5 input").mouseover(function() {

        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");

        })

        $("#centerBox5 input").mouseout(function() {

        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");

        })

        $("#${category_seq}").attr("selected","selected");
    
    </script>
    
    
</body>

</html>