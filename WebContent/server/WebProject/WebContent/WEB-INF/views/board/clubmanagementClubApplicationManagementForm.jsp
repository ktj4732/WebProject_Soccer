<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <link rel="stylesheet" href="/soccer/css/jquery-ui.css">
    <link rel="stylesheet" href="/soccer/css/bootstrap.css">    
     <link rel="stylesheet" href="css/clubmanagementClubApplicationManagementForm.css">
    <script src="/soccer/js/jquery-1.12.4.js"></script>
    <script src="/soccer/js/bootstrap.js"></script>        
    <script src="/soccer/js/jquery-ui.js"></script>    
    
    <style>

    </style>
</head>

<body>
    
    <div id="mainBox">
        <div id="box1">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th colspan="2">신청서</th>
                        <!-- <th></th>                         -->
                    </tr>                    
                </thead>
                <tr>
                    <td>이름</td>
                    <td>오희준</td>                    
                </tr>
                <tr>
                    <td>포지션</td>
                    <td>MF</td>                 
                </tr>           
                <tr>
                    <td>신장</td>
                    <td>170cm</td>             
                </tr>          
                <tr>
                    <td>몸무게</td>
                    <td>65kg</td>             
                </tr>         
                <tr>
                    <td>생년월일</td>
                    <td>1995.04.20</td> 
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td>010-2222-2222</td> 
                </tr>
                <tr>
                    <td>각오</td>
                    <td>아자 아자 화이팅!</td>            
                </tr>
            </table>
        </div>
        <div id="box2">
            <span><input type="button" value="승인" class="btn btn-primary"></span>
            <span><input type="button" value="거절" class="btn btn-primary"></span>
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
    <script src="/soccer/js/event.js"></script>
    <script src="/soccer/js/submain.js"></script>

</body>

</html>