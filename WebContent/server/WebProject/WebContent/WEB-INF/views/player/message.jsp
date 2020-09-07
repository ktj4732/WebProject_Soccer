<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/jquery-ui.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script src="../js/jquery-1.12.4.js"></script>
    <script src="../js/bootstrap.js"></script>
    <style>
        /* html, body { overflow: hidden; }; */
    </style>
</head>

<body>

    <script src="../js/jquery-ui.js"></script>
    

    <div class="center" style="width: 500px; padding-left: 70px;
    ">
        <div class="pageContentTitle"><img src="../images/rogowithoutletter.png" class="contentTitleImg" style="width: 100px;"><span
                class="contentTitle" style="font-size: 1.7em;   position: relative; top: 20px; font-weight: bold;">Message</span></div>
        <textarea cols="30" rows="10" class="form-control" style="resize: none;"></textarea>
        <br>
        <input type="button" value="전송" class="btn btn-success" >
    </div>

    <!-- 하단부  끝 -->


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

        $(".btn").click(function () {
            alert("전송 완료!")
            self.close();
        })
		
        

    </script>
    
</body>

</html>