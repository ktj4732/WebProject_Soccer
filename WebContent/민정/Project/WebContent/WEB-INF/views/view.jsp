<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>  
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_111.css" />

	<style>
		 <style>
        .center {            
            padding-top: 50px;
            background-color: #eee;     
        }
        .pageContentTitle{
            width: 1200px;
            /* border: 1px solid green; */
            position: relative;
            top: 80px;
            height: 150px; margin: 0px auto;
            
        }

        #centerBoxMain{
            /* border: 1px solid black; */            
            width: 1250px;
            height: 600px;
            margin: 0px auto;   
            /* border: 1px solid orangered; */


        }

        #centerBox2 {
            margin-top: 10px;
            border-bottom: 1px solid #0C1B23; 
            border-top: 1px solid #0C1B23; 
            border-bottom-style: dashed;
            width: 1150px;
            /* border: 1px solid lightseagreen; */
            height: 500px;            
        }

        #centerBox5 {
          
            width: 1150px;
            height: 50px;
            margin-top: 10px;
            /* border: 1px solid lawngreen; */
            position: relative;
            margin-left:auto;
            top: 50px;
            display: inline-block;

        }

        .centerBox {
            margin-left: 25px;
            /* border: 1px solid indigo; */
        }

        #centerBox2 span:nth-child(1) {
            float: left;            
            padding-left: 5px;
        }

        #centerBox2 .content {
            /* border: 1px solid blue; */
            height: 400px;
            font-size: 15px;
            margin-left: 20px;
            font-size: 20px;
            padding: 5px;
            margin-top: 10px;
        }
        #centerBox2 span {
            /* border: 1px solid blue;             */
            text-align: center;    
            font-size: 15px;
            padding-top: 5px;
            padding-bottom: 5px;
            margin-left: 5px;   
            float: right;     
            font-size: 20px;    
            margin-right: 5px;   
            font-weight: bold;                      
        }

        #centerBox5 > span {
            
           
            width: 90px;
            
            text-align: center;
            margin-top: 5px;
            padding-top: 1px; 
            float: right;
            font-size: 30px;
            font-weight: bold;        
            margin-top: -1px;                            
        }
    	 button{
        	width: 70px;
        	font-size: 1.2em;
        	height: 40px;
        }

        #centerBox5 > span input, #centerBox4 span input, #centerBox3 input {            
            padding: 2px;
            /* background-color: #1E3440; */
            /* color: white; */
        }
        #top{
            position: relative;
            left: 970px;
        }
        .content{
            background-color: silver;
            width: 1100px;
            height: auto;
        }
        
        span #edit{
        	position: relative;
        	left: 950px;
    
        }
    </style>
	
</head>
<body>
	<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
    
    <div class="adminPage">
        <ul id="ul1">
            <li style=" text-align: center;"><img id="admin_img" src="${pageContext.request.contextPath}/images/rogo5.png"></li>
            <li class="menu1"><a href="#">경기결과(리그)</a></li>
            <li class="menu2"><a href="#">경기결과(친선)</a></li>
            <li class="menu3"><a href="#">공지사항</a></li>
            <li class="menu4"><a href="#">블랙리스트</a></li>
            <li class="menu5"><a href="#">경기장 관리</a></li>
            <li class="menu6"><a href="#">경기장 일정</a></li>
            <li class="menu7"><a href="#">구단관리</a></li>
            <li class="menu8"><a href="#">선수관리</a></li>


        </ul>
    </div>
    <header>

    </header>
    <div class="center">
        <div class="pageContentTitle"><img src="${pageContext.request.contextPath}/images/rogowithoutletter.png" class="contentTitleImg"><span
            class="contentTitle">공지사항</span></div>

        <div id="centerBoxMain">
            <!-- 등록한 글 -->
            <div id="centerBox2" class="centerBox">
                <div>
                    <span class="title">${dto.title}</span>
                    <span class="regdate">작성날짜: ${dto.regdate}</span>
                    <span class="name">작성자 | ${dto.admin_name}</span>
                    <div style="clear: both;"></div>
                </div>
                <div class="content">
                    ${dto.content}
                </div>

                    <!-- 목록, 수정 -->
                <div id="centerBox5" class="centerBox">
                	<span><button type="button" id="edit" class ="btn btn-default" onclick="location.href='/soccer/edit.do?seq=${dto.seq}';">수정</button></span>
                    <span><button type="button" class ="btn btn-default" onclick="location.href='/soccer/notice.do';">목록</button></span>
                </div>
            </div>
        </div>
    </div>
    
    



    <!-- 스크립트------------------------------------------------------------- -->
    <script>

        var flag = false;
        $(document).scroll(function () {

            if ($(document).scrollTop() > $
                ("#main").position().top) {

                if (!flag) {
                    $("#main").css({
                        position: "fixed",
                        top: -$("#main").outerHeight(),
                        bottom: ""
                    });

                    $("#main").animate({
                        top: "0px"
                    }, 1000, function () {
                        //alert();
                        flag = true;
                    });
                }

            }

        });
    </script>
    <script src="js/eventAdmin.js"></script>
    <script src="js/submain.js"></script>
    
    
</body>
</html>





