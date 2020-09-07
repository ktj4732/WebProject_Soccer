<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>

 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>  
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_111.css" />
    
	<style>
        
        .pageContentTitle{
                width: 1200px;
                /* border: 1px solid green; */
                position: relative;
                top: 80px;
                height: 150px;
                /* height: 150px;  */
                margin: 0px auto;
                
            }
        
            .center{
                padding-top: 50px ;
                background-color: #eee;
            }

            #centerMainBox{
                /* border: 1px solid black; */
                width: 1200px;
                height: 800px;
                margin: 0px auto;    
                font-size: 20px;        
                font-weight: bold;
            }

            #centerBox1 {
            
                /* border: 1px solid red; */
                width: 1000px;
                height: 50px;             
                display: inline-block;
                margin-left: 15px;  
                padding-top: 6px;
            }

            #centerBox2{
                /* border: 1px solid blue; */
                width: 1150px;
                height: 480px; 
                margin-left: 15px;  
            }

            #centerBox3 {
                /* border: 1px solid indianred; */
                width: 800px;
                height: 50px; 
                margin-left: 15px;  
                margin-top: -10;
            }

            #centerBox4 {
                /* border: 1px solid lawngreen; */
                width: 150px;
                height: 50px; 
                float: right;   
                margin-right: 58px;       
                padding-top: 3px;  
                margin-top: -5px;
            }

            #centerBox2 textarea {
                resize:none;
            }

            #centerBox3 span:nth-child(2) {
                display: inline-block;
                font-size: 15px;
                margin-top: 6px;
            }

            #centerBox4 input, #centerBox3 input {
                /* color: white;  */
                /* background-color: #1E3440 ; */
                padding-bottom: 5px;
            }

            #centerBox3 input {
                padding-top: 4px;
            }

            #centerBox4 input {
                padding: 3px;
            }

        </style>
        <style>

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
            <div class="pageContentTitle">
                <img src="${pageContext.request.contextPath}/images/rogowithoutletter.png" class="contentTitleImg">
                <span class="contentTitle">공지사항 등록</span>
            </div>
            
            <div id="centerMainBox">
              <form action="/notice.do" method="GET" >  
                    <!-- 제목 입력 -->
                    <div id="centerBox1">
                        <span>제목 : </span>
                        <input type="text" name="" id="" size="70px">
                    </div>

                    <!-- 내용 입력 -->
                    <div id="centerBox2">          
                        <textarea name="" id="" cols="100" rows="17">내용 :</textarea>
                    </div>

                    <!-- 파일첨부 -->
                    <div>
                        <div id="centerBox3">
                            <div>
                                <span>파일첨부 :</span>
                                <span><input type="file" class="form-control" ></span>
                            </div>
                        </div>                          
                    </div>

                    <!-- 확인/미리보기 버튼 -->
                    <div id="centerBox4">            
                        <button type = "button" class="writebtn" id="writebtn1"  value="등록" onclick="location.href='${pageContext.request.contextPath}/notice.do';">
                         등록
                        </button>
                        <button type = "button" class="writebtn" id="writebtn2" value="미리보기" onclick="location.href='ex01.html'">         
                        미리보기
                        </button>
                    </div>
             </form>
            </div>  
           
        </div>
        <script>

            $("#centerBox5 input").mouseover(function() {

            // alert($(this).text());
            $(this).css("background-color", "#92DAEC").css("color", "black");

            })

            $("#centerBox5 input").mouseout(function() {

            // alert($(this).text());
            $(this).css("background-color", "").css("color", "");

            })

        </script>


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
		<script src="${pageContext.request.contextPath}/js/eventAdmin.js"></script>
		<script src="${pageContext.request.contextPath}/js/submain.js"></script>
    </body>
    </html>