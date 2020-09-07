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
    <link rel="stylesheet" href="/soccer/css/submain_1.css">
    <link rel="stylesheet" href="/soccer/css/submain_2.css">
    <script src="/soccer/js/jquery-1.12.4.js"></script>
    <script src="/soccer/js/bootstrap.js"></script>
</head>
<style>
    a:link {
        color: #8f8f8f;
        text-decoration: none;
    }

    a:visited {
        color: #8f8f8f;
        text-decoration: none;
    }

    a:link {
        color: #8f8f8f;
        text-decoration: none;
    }

    body {
        background-color: #f2f4f7
    }

    .loginBox {
        padding: 35px;
        width: 500px;
        height: 800px;
        margin: 100px auto;

    }

    .loginBox>div>img {
        width: 150px;
        height: 150px;
        float: left;

        margin: 35px 130px;
    }

    /* 
    .loginBox>div:first-child {
        width: 300px;
        height: 170px;
        padding: 20px;
        border: 1px solid #000; */
    /* margin: 30px 120px; */
    /* } */

    .loginInput>.id,
    .loginInput>.pw,
    .loginInput>.loginBtn {
        width: 400px;
        height: 50px;
        margin: 10px;
    }

    .loginInput>.loginBtn {
        background-color: #0077C8;
        color: white;
        font-size: 1.5em;
        line-height: 35px;

    }

    .loginInfo {
        margin-top: 40px;
        font-size: 0.9em;
        padding-left: 18px;
    }

    .loginInfo>a {
        margin: 10px;
    }

    .signIn>a {
        position: relative;
        top: 20px;
        width: 200px;
        float: left;

    }

    #copy {
        color: #8f8f8f;
        position: relative;
        top: 170px;
        left: 100px;
        font-size: 0.8em;

    }
</style>

<body>

	<form method="POST" action="/soccer/member/loginok.do">
     <div class="loginBox">
        <div><img src="/soccer/images/rogo_3.png" id="rogo"></div>
        <div class="loginInput">
            <input type="text" class="id required form-control" id="id" name="id" title="아이디" placeholder="아이디" value="qtakadtu2">
            <input type="password" class="pw required form-control" id="pw" name="pw" title="비밀번호"  placeholder="비밀번호" value="lcxH2awiembie">
            <button type="submit" class="loginBtn btn" id="loginBtn">로그인</button>

        </div>
        <div class="loginInfo">
            <a href="#">이용약관</a>
            <a href="#">개인정보 취급방침</a>
            <a href="#">제휴문의</a>
            <a href="#">관리자페이지</a>
        </div>
        <hr>
        <div id="copy">Copyrightⓒ ssangyongsoft All Rights reserved.</div>
    </div>
    </form>
    
</body>
    <script>
        $("#rogo").hover(function () {
            $(this).css("cursor","pointer")
        }).click(function () {
            location.href="/soccer/main.do";
        });
    </script>
    <script src="/soccer/js/event.js"></script>
    <script src="/soccer/js/submain.js"></script>

</html>