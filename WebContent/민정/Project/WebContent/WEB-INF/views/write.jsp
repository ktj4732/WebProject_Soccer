<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <div class="center">
            <div class="pageContentTitle">
                <img src="${pageContext.request.contextPath}/images/rogowithoutletter.png" class="contentTitleImg">
                <span class="contentTitle">공지사항 등록</span>
            </div>
            
            <div id="centerMainBox">
               <form name = "writeform" action="${pageContext.request.contextPath}/writeok.do" method="POST" > 
                    <!-- 제목 입력 -->
                    <div id="centerBox1">
                    	
                        <span style=" position: relative;  margin-right: 36px;">제목 : </span>
                        <input type="text" name="title" id="title" size="70px" placeholder="제목" onclick="titleWrite();"required  >
                    </div>

                    <!-- 내용 입력 -->
                    <div id="centerBox2"> 
                    	<span style="position: relative; bottom: 450px; margin-right: 40px;">내용: </span>         
                        <textarea  name="content" id="content" placeholder="content" cols="90" rows="17" required></textarea>
                    </div>
					<br>
                    <!-- 파일첨부 -->
                    <div>
                        <div id="centerBox3">
                            <div>
                                <span>파일첨부 :</span>
                                <span><input type="file" placeholder="file" id="file" class="form-control" ></span>
                            </div>
                        </div>                          
                    </div>

                    <!-- 확인/미리보기 버튼 -->
                    <div id="centerBox4">            
                        <input type="button" value="등록" onclick="writeCheck();">
                        <button type="button" class="writebtn" id="writebtn2"  onclick="location.href='/soccer/notice.do';"> 
                        	목록
                        </button>        
                    </div> 
                    </form>
            </div>  
           
        </div>
        <script>

        function titleWrite(){var form = document.writeform;
        	form.title.focus();
        	return;
        }
        
        function writeCheck() { var form = document.writeform; 	
        	if( !form.title.value ) {
        		alert( "제목을 적어주세요" ); 
        		form.title.focus(); 
        		return; } 
        	
        	if( !form.content.value ) { 
        		alert( "내용을 적어주세요" ); 
        		form.content.focus(); 
        		return; } 
        	form.submit(); }

        	

        </script>


        <!-- 스크립트------------------------------------------------------------- -->
      



     
        <script src="js/eventAdmin.js"></script>
        <script src="js/submain.js"></script>
</body>
</html>







   