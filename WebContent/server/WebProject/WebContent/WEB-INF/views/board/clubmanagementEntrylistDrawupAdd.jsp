<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/soccer/css/jquery-ui.css">
    <link rel="stylesheet" href="/soccer/css/bootstrap.css">    
    <link rel="stylesheet" href="/soccer/css/clubmanagementEntrylistDrawupAdd.css">
    <script src="/soccer/js/jquery-1.12.4.js"></script>
    <script src="/soccer/js/bootstrap.js"></script>
    <script src="/soccer/js/jquery-ui.js"></script>
    <style>

    </style>
</head>

<body>

   
    <div id="mainBox">
        <div id="box1">
            <table class="table-striped">
                <thead style="border-bottom: 0px;">
                    <tr style="border-bottom: 0px;">
                        <th>포지션</th>
                        <th>번호</th>
                        <th>이름</th>
                        <th>나이</th>
                    </tr>                    
                </thead>
                <tr>
                    <td>
                        <select style=" height: 30px;">
                            <option value="">FW</option>
                            <option value="">MF</option>
                            <option value="">DF</option>
                            <option value="">GK</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" name="" id="" style="width: 30px; text-align: center;">
                    </td>
                    <td>
                        <select style=" height: 30px;">
                            <option value="">오희준</option>
                            <option value="">김택진</option>
                            <option value="">이수지</option>
                            <option value="">최재성</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" name="" id="" style="width: 30px; text-align: center;">
                    </td>
                </tr>                     
            </table>
        </div>
        <div id="box2">
            <span><input type="button" value="완료" class="btn btn-primary"></span>
            <span><input type="button" value="취소" class="btn btn-primary"></span>
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