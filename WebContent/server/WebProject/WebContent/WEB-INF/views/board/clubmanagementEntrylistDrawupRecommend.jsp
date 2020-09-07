<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/soccer/css/jquery-ui.css">
    <link rel="stylesheet" href="/soccer/css/bootstrap.css">
    <link rel="stylesheet" href="/soccer/css/clubmanagementEntrylistDrawupRecommend.css">
    <script src="/soccer/js/jquery-1.12.4.js"></script>
    <script src="/soccer/js/bootstrap.js"></script>
    <script src="/soccer/js/jquery-ui.js"></script>
    <style>
	
		 #box2 {    
	        /* border: 1px solid #0C1B23; */
		    width: 210px;
		    /* height: 50px; */
		    margin: 0px auto;
		    float: right;
		    margin-right: 60px;
		    
	    
    	}  
    	
    	
    	#box1 {
		    /* border-top: 1px solid #0C1B23;             */
		  	width: 450px;
		    margin: 0 auto; 
		    height: auto;
		}
	
    </style>
</head>

<body>

   
   <div id="mainBox">
   		
        <div id="box1">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th></th>
                        <th>포지션</th>
                        <th>번호</th>
                        <th>이름</th>
                        <th>나이</th>
                    </tr>                    
                </thead>
             	<c:forEach items="${entry}" var="dto">             	
                     	<tr>
                         <td><input type="checkbox" name="${dto.entry_seq}" id="${dto.entry_seq}" value="${dto.entry_seq}"></td>
                         <td>${dto.position}</td>
                         <td>${dto.backnumber}</td>
                         <td>${dto.name}</td>
                         <td>${dto.old}</td>
                     	</tr>
                </c:forEach>         
            </table>
        </div>
        <div style="clear: both;"></div>
        <div id="box2">
            <span><input type="submit" value="완료" class="btn btn-primary" id="completeBtn" style=""></span>
            <span><input type="button" value="취소" class="btn btn-primary" id="cancleBtn"></span>
        </div>        

    </div>

    <style>

       

    </style>

    <script>
	
    	//버튼에 호버 이벤트
    	$("#box2 input").mouseover(function() {

        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");

        })

        $("#box2 input").mouseout(function() {

        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");

        })
        
        //체크박스 선택후 확인버튼
        $("#completeBtn").click(function() {     
        	
	        //alert($('input[type=checkbox]:checked').val());
	    
	        location.href ="/soccer/board/clubmanagementEntrylistDrawupRecommendOk.do?entry_seq=" + $('input[type=checkbox]:checked').val() + "&formation_seq=" + ${formation_seq};
	        
	        opener.location.reload();
	        
	        window.close();                     
	        
	   });       
        
    	
    	$("#cancleBtn").click(function() {
    		
    		window.close();
    		
    	});
    	



    </script>

</body>

</html>