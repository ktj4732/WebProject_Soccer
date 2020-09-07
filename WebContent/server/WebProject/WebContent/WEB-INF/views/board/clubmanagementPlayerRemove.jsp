<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/soccer/css/jquery-ui.css">
    <link rel="stylesheet" href="/soccer/css/bootstrap.css">    
    <link rel="stylesheet" href="css/clubmanagementPlayerRemove.css">
    <script src="/soccer/js/jquery-1.12.4.js"></script>
    <script src="/soccer/js/bootstrap.js"></script>
    <script src="/soccer/js/jquery-ui.js"></script>
    <style>

    </style>
</head>

<body>

   
     <div id="mainBox">
          <div id="box1"><span style="padding-left: 115px;">'오희준'</span><br><br><span style="padding-left: 25px;">선수를 정말 방출하시겠습니까?</span></div>
          <div id="box2">
            <span><input type="button" value="확인" class="btn"></span>
            <span><input type="button" value="취소" class="btn"></span>
          </div>
    </div>

    <style>

       

    </style>

    <script>

    	$("#box2 input").mouseover(function() {

        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");

        })

        $("#box2 input").mouseout(function() {

        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");

        })

    </script>

</body>

</html>