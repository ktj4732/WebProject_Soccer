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
    
    #rankteamname a{
    	color: white;
    }
    
    
    #main {
            /* border: 1px solid red; */
            width: 100%;
            z-index: 1;
            float: left;
        }

        #menuTr {
            height: 1px;
        }

        #mainrogo {
        width: 100px;
        border: 3px solid white;
        }

        .menu span {
            color: white;
            text-align: center;
            font-size: 1.3em;
            display: block;
        }

        .menu {
            background-color: rgb(37, 40, 42);
            opacity: .7;
            cursor: pointer;
            font-weight: bold;
            
        }

        #menuTop {
            height: 20px;
            background-color: rgb(23, 25, 26);
        }

        #menuTop td:nth-child(3) {
            text-align: right;
        }

        #menuTop .btn{
            font-weight: bold;
        }

        .gamedate span{
            padding-top: 20px;
        }

        #scoreBoard {
            width: 1903px;
            background-color: #0C1B23;
            height: 350px;
            margin: 0px auto;
            background-image: url("/soccer/images/stadium.jpg");
            background-repeat: no-repeat;
            background-size: 100%;
            background-position-x: center;
            background-position-y: 90%;
            /* margin-left: 400px; */
        }


        #contents {
            width: 1280px;
            /* border: 1px solid red; */
            height: 1500px;
            margin: 0px auto;
            /* font-family: '맑은고딕'; */
        }

        #contents>div {
            width: 800px;
            float: left;
            /* text-align: center; */
            border: 3px solid black;
            margin-left: 30px;
            margin-top: 50px;
        }

        #contents>div:nth-child(2) {
            width: 400px;
            background-color: rgb(37, 65, 80);
        }

        #contents>div:nth-child(3) {
            width: 96%;
            background-color: rgb(37, 65, 80);
        }


        #topBoard {
            width: 100%;
            background-color: #0C1B23;
            height: 117px;
        }

        #rankList tr:nth-child(2n+1) {
            background-color: rgb(12, 27, 35);
            ;
        }

        #rankList tr {
            color: rgb(146, 218, 236);
            font-weight: bold;
            font-size: 17px;
            /* font-family: '맑은고딕'; */

        }

        #rankList tr:nth-child(1) {
            color: white;
        }

        #rankList tr td {
            text-align: left;
        }

        #rankList tr td:nth-child(n+3) {
            color: rgb(254, 249, 206);
        }

        #more {
            width: 80%;
            /* border: 1px solid white; */
            margin-top: -20px;
        }

        h3 {
            color: rgb(254, 249, 206);
            text-align: center;
            font-weight: bold;
            
        }
        

        .rankInfo div {
            width: 90px;
            float: left;
            /* border: 1px solid white; */
            color: white;
            text-align: center;
        }
        
        .rankInfo a {
        	color: white;
        }

        .rankInfo div:nth-child(1) {
            width: 70px;
            float: left;
        }

        .rankform {
            border: 1px solid white;
            width: 272px;
            height: 275px;
            background-color: rgb(12, 27, 35);
            float: left;
            margin-left: 100px;
            margin-bottom: 30px;
            margin-top: 30px;
        }

        .photo {
            width: 290px;
            height: 129px;
        }

        .photo img {
            margin-left: 70px;
            background-color: white;
            width: 128px;
            height: 129px
        }

        #categoryRank {
            width: 1000px;
        }

        .category {
            color: rgb(254, 249, 206);
        }

        .rankInfo div:nth-child(2),
        .rankInfo div:nth-child(3) {
            color: rgb(254, 249, 206);
        }

        .rankInfo div:nth-child(1),
        .rankInfo div:nth-child(4) {
            color: rgb(146, 218, 236);
        }

        /* --------------------------------------------------------------- */

        .infoBox {
            border: 3px solid rgb(25, 21, 39);
            width: 300px;
            height: 230px;
            border-collapse: collapse;
            position: relative;
            /* left: 300px; */
            float: left;
            margin: 0px 25px;
            background-color: rgb(37, 65, 80);
            color: white;
            margin-top: 20px;
            padding: 0px 10px;
        }


        .infoOuter:last-child::after {
            content: "";
            display: block;
            clear: left;
        }

        .infoBox .teamName {
            text-align: center;
        }

        .gameinfo {
            border-collapse: collapse;
        }

        .teamInfo {
            display: inline-block;
        }

        .vs {
            position: absolute;
            top: 50%;
            left: 47%;
        }

        .infoLeft {
        
            text-align: center;
            padding-top: 10px;
        }

        .infoRight {
            display: inline-block;
            position: absolute;
            top: 3px;
            right: 0;
            font-size: 1em;
        }

        .gamedate span {
            color: rgb(254, 249, 206);
            /* font-family: '맑은고딕'; */
        }


        .teamLogo {
            width: 100px;
            height: 70px;
            border: 1px solid black;
        }

        .infoOuter {
            width: 2800px;
            /* border: 1px solid black; */
            /* position: relative;
            left: 100px; */
        }

        .outerWraper {
            overflow: hidden;
            width: 1380px;
            position: relative;
            left: 210px;
        }

        #mainMenu {
            z-index: 2;
        }

        #arrow div {
            border: 1px solid white;
            color: white;
            font-size: 30px;
            margin-right: 0px;
        }

        #arrow div:nth-child(1) {
            margin-left: 1450px;
            margin-top: 10px;
        }

        #arrow div:nth-child(2) {
            margin-left: 20px;
        }

        /* ---------------------------------------------------- */
        * {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        a {
            text-decoration: none;
            color: #666;
        }

        a:hover {
            color: #1bc1a3;
        }

        body,
        hmtl {
            background: #ecf0f1;
            /* font-family: 'Anton', sans-serif; */
        }


        #wrapper {
            width: 600px;
            margin: 50px auto;
            height: 400px;
            position: relative;
            color: #fff;
            text-shadow: rgba(0, 0, 0, 0.1) 2px 2px 0px;
        }

        #slider-wrap {
            width: 600px;
            height: 400px;
            position: relative;
            overflow: hidden;
        }

        #slider-wrap ul#slider {
            width: 100%;
            height: 100%;

            position: absolute;
            top: 0;
            left: 0;
        }

        #slider-wrap ul#slider li {
            float: left;
            position: relative;
            width: 600px;
            height: 400px;
        }

        #slider-wrap ul#slider li>div {
            position: absolute;
            top: 10px;
            left: 35px;
        }

        #slider-wrap ul#slider li>div h3 {
            font-size: 20px;
            text-transform: uppercase;
        }

        #slider-wrap ul#slider li>div span {
            /* font-family: Neucha, Arial, sans serif; */
            font-size: 21px;
        }

        #slider-wrap ul#slider li img {
            display: block;
            width: 100%;
            height: 100%;
        }


        /*btns*/
        .btns {
            position: absolute;
            width: 50px;
            height: 60px;
            top: 50%;
            margin-top: -25px;
            line-height: 57px;
            text-align: center;
            cursor: pointer;
            background: rgba(0, 0, 0, 0.1);
            z-index: 100;


            -webkit-user-select: none;
            -moz-user-select: none;
            -khtml-user-select: none;
            -ms-user-select: none;

            -webkit-transition: all 0.1s ease;
            -moz-transition: all 0.1s ease;
            -o-transition: all 0.1s ease;
            -ms-transition: all 0.1s ease;
            transition: all 0.1s ease;
        }

        .btns:hover {
            background: rgba(0, 0, 0, 0.3);
        }

        #next {
            right: -50px;
            border-radius: 7px 0px 0px 7px;
        }

        #previous {
            left: -50px;
            border-radius: 0px 7px 7px 7px;
        }

        #counter {
            top: 30px;
            right: 35px;
            width: auto;
            position: absolute;
            color: black;
        }

        #slider-wrap.active #next {
            right: 0px;
        }

        #slider-wrap.active #previous {
            left: 0px;
        }


        /*bar*/
        #pagination-wrap {
            min-width: 20px;
            margin-top: 350px;
            margin-left: auto;
            margin-right: auto;
            height: 15px;
            position: relative;
            text-align: center;
        }

        #pagination-wrap ul {
            width: 100%;
        }

        #pagination-wrap ul li {
            margin: 0 4px;
            display: inline-block;
            width: 5px;
            height: 5px;
            border-radius: 50%;
            background: #fff;
            opacity: 0.5;
            position: relative;
            top: 0;


        }

        #pagination-wrap ul li.active {
            width: 12px;
            height: 12px;
            top: 3px;
            opacity: 1;
            box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
        }




        /*Header*/
        h1,
        h2 {
            text-shadow: none;
            text-align: center;
        }

        h1 {
            color: #666;
            text-transform: uppercase;
            font-size: 36px;
        }

        h2 {
            color: #7f8c8d;
            /* font-family: Neucha, Arial, sans serif; */
            font-size: 18px;
            margin-bottom: 30px;
        }




        /*ANIMATION*/
        #slider-wrap ul,
        #pagination-wrap ul li {
            -webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
            -moz-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
            -o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
            -ms-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
            transition: all 0.3s cubic-bezier(1, .01, .32, 1);
        }

        /* ----------------------------------------------------------------- */
        .footer {

            border-top: 1px solid cornflowerblue;
            border-bottom: 1px solid cornflowerblue;
            min-width: 1300px;
            height: 50px;
        }

        .footerBox {
            width: 1300px;
            height: 50px;
            margin: 0px auto;

        }

        .footerBox2,
        .footerBox3 {
            width: 1300px;
            height: 60px;
            margin: 0px auto;
        }

        .footerBox>div {
            text-align: center;
            width: 150px;
            float: left;
            margin-top: 15px;

        }

        .footerBox2>div {
            float: left;
            padding-top: 4px;
            padding-left: 42px;
        }

        .footerBox3>div {
            padding-top: 4px;
            padding-left: 47px;

        }

        .footerInfo>.info,
        .footerInfo>.infoItem {
            display: inline;
            margin: 5px;
            padding-right: 20px;
            font-size: 12px;
            color: steelblue;
            border-right: 1px solid steelblue;
        }

        .footerInfo {
            margin-right: -30px;
        }

        .footerInfo>.info:last-child {
            border: 0px;
        }

        .footerBox>div>a:link {
            text-decoration: none;

        }

        .footerBox>div>a:hover {
            text-decoration: none;
            color: #013e5f;
        }

        .footerBox3 {
            color: steelblue;
            font-size: 12px;
        }

        .sitemap {
            width: 100%;
            height: 250px;
            margin: 0px auto;
            background-color: #254150;
            color: #92DAEC;


        }


        .sitemap .siteList {
            float: left;
            list-style-type: none;
            /* margin-left: 90px; */
            width: 180px;
            padding: 10px;
            position: relative;
            left: 340px;
        }



        .sitemap .siteList:first-child {

            /* margin-left: 340px; */

        }

        .listName {
            margin-top: 30px;
            font-size: 24px;
            text-align: left;
        }

        .siteList>li>a {
            text-decoration: none;
            color: #92DAEC;
        }

        .listName>a {
            color: #92DAEC;
            text-decoration: none;
        }
    </style>
</head>

	<%@include file="/WEB-INF/views/inc/header.jsp" %>

   	 

    <div id="topBoard"></div>


    <div id="scoreBoard">
        <div class="outerWraper">
            <div class="infoOuter">
                <!-- 1 -->
                <c:forEach items="${scheduleList}" var="scheduleList" varStatus="status" begin="0" end="7">
                <div class="infoBox" id="infoBox1">
                    <!-- 리그 일정 정 보 -->
                    <div class="gamedate" style="padding-top: 10px;">
                        <span class="infoLeft" style="text-align: center;"><b>${scheduleList.league}</b></span>
                        <span class="impact" style="display: inline-block;">${scheduleList.gamedate}<br>17:00 </span>
                        <span style="display: inline-block; float: left; position: absolute; right: 0px; padding-right: 10px">${scheduleList.ground}</span>
                        
                    </div>

                    <div class="leagueInfo"></div>

                    <div class="teamInfo" style="float: left;">
                        <img src="/soccer/images/${scheduleList.homelogo}" id="teamA" class="teamLogo" />
                        <div class="teamName">${scheduleList.hometeam}FC</div>
                    </div>

                    <div class="teamInfo" style="float: right;">
                        <img src="/soccer/images/${scheduleList.awaylogo}" id="teamB" class="teamLogo" />
                        <div class="teamName">${scheduleList.awayteam}FC</div>
                    </div>
                    <div style="clear: both;"></div>

                    <div class="vs" style="font-size: 1.5em">vs</div>
                </div>
                </c:forEach>
            </div>


        </div>

        <div id="arrow">
            <div class="glyphicon glyphicon-triangle-left" id="left"></div>
            <div class="glyphicon glyphicon-triangle-right" id="right"></div>
        </div>

    </div>
    <!-- 상단부 끝 -->



	<!-- 내용 시작 -->
	<div id="contents">
        <!-- 갤러리폼 -->
        <div id="gallery" class="contentsTop">
            <h3 style="color: black; margin-bottom: -20px">갤러리</h3>
            <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
            <link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
            <link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>

            <div id="wrapper">
                <div id="slider-wrap">
                    <ul id="slider">
                        <li>
                            <div style="position: relative; top: -10px">
                                <h3 style="color:rgb(12, 27, 35) "><b>경기중 득점으로 연결된 멋진 코너킥</b></h3>
                            </div>
                            <img src="/soccer/images/mainimage2.jpg">
                        </li>

                        <li>
                            <div style="position: relative; top: -10px">
                                <h3 style="color:rgb(12, 27, 35) "><b>드리블 훈련중에 한장!</b></h3>
                            </div>
                            <img src="/soccer/images/mainimage1.jpg">
                        </li>

                        <li>
                            <div style="position: relative; top: -10px">
                                <h3 style="color:rgb(12, 27, 35) "><b>야간축구후에 찍어봤습니다!</b></h3>
                            </div>
                            <img src="/soccer/images/mainimage3.jpg">
                        </li>

                        <li>
                            <div style="position: relative; top: -10px">
                                <h3 style="color:rgb(12, 27, 35) "><b>외국인 용병과 함께 경기한 날</b></h3>
                            </div>
                            <img src="/soccer/images/mainimage4.jpg">
                        </li>

                        <li>
                            <div style="position: relative; top: -10px">
                                <h3 style="color:rgb(12, 27, 35) "><b>들찬FC 창단일 기념사진</b></h3>
                            </div>
                            <img src="/soccer/images/mainimage5.jpg">
                        </li>


                    </ul>

                    <!--controls-->
                    <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
                    <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
                    <div id="counter"></div>

                    <div id="pagination-wrap">
                        <ul>
                        </ul>
                    </div>
                    <!--controls-->

                </div>

            </div>
        </div>
        <!-- 팀순위 폼 -->
        <div id="rank" class="contentsTop">
            <h3 style="color: rgb(254, 249, 206);">팀순위</h3>
            <table class="table table-striped" id="rankList">
                <tr>
                    <th>순위</th>
                    <th>팀명</th>
                    <th>승점</th>
                    <th>경기</th>
                </tr>
               	<c:forEach items="${list}" var="dto" varStatus="status" begin="0" end="10">
                <tr>
                    <td>${status.count}</td>
                    <td id="rankteamname"><a href="/soccer/team/teaminformation.do?teamname=${dto.teamName}">${dto.teamName}FC</a></td>
                    <td>&nbsp;${dto.points}</td>
                    <td>&nbsp;&nbsp;30</td>
                </tr>
                </c:forEach>
            </table>
            <div id="more"></div>
        </div>

        <!-- 개인순위 폼 -->
        <div id="categoryRank">
            <h3 style="font-variant: small-caps;">개인순위</h3>
            <div class="rankform">
                <div class="category">득점순위</div>
                <div class="photo"><img src="images/player_05.jpg" alt=""></div>
                <br>
                <c:forEach items="${goalRank}" var="dto" varStatus="status">
                <div class="rankInfo">
                    <div>${status.count}</div>
                    <div><a href="/soccer/player/playerDetails.do?seq=${dto.mseq}">${dto.memberName}</a></div>
                    <div>${dto.goal}</div>
                </div>
                </c:forEach>
            </div>

            <div class="rankform">
                <div class="category">도움순위</div>
                <div class="photo"><img src="images/player_02.jpg" alt=""></div>
                <br>
                <c:forEach items="${assistRank}" var="dto2" varStatus="status">
                <div class="rankInfo">
                    <div>${status.count}</div>
                    <div><a href="/soccer/player/playerDetails.do?seq=${dto2.mseq}">${dto2.memberName}</a></div>
                    <div>${dto2.assist}</div>
                </div>
                </c:forEach>
            </div>

            <div class="rankform">
                <div class="category">태클성공순위</div>
                <div class="photo"><img src="images/player_03.jpg" alt=""></div>
                <br>
               <c:forEach items="${tackleRank}" var="dto3" varStatus="status">
                <div class="rankInfo">
                    <div>${status.count}</div>
                    <div><a href="/soccer/player/playerDetails.do?seq=${dto3.mseq}">${dto3.memberName}</a></div>
                    <div>${dto3.tackle}</div>
                </div>
                </c:forEach>
            </div>

            <div class="rankform">
                <div class="category">선방순위</div>
                <div class="photo"><img src="images/player_01.jpg" alt=""></div>
                <br>
                <c:forEach items="${saveRank}" var="dto4" varStatus="status">
                <div class="rankInfo">
                    <div>${status.count}</div>
                    <div><a href="/soccer/player/playerDetails.do?seq=${dto4.mseq}">${dto4.memberName}</a></div>
                    <div>${dto4.save}</div>
                </div>
                </c:forEach>
            </div>

            <div class="rankform">
                <div class="category">경고누적</div>
                <div class="photo"><img src="images/player_04.jpg" alt=""></div>
                <br>
                <c:forEach items="${yellowRank}" var="dto5" varStatus="status">
                <div class="rankInfo">
                    <div>${status.count}</div>
                    <div><a href="/soccer/player/playerDetails.do?seq=${dto5.mseq}">${dto5.memberName}</a></div>
                    <div>${dto5.yellowCard}</div>
                </div>
                </c:forEach>
            </div>

            <div class="rankform">
                <div class="category">파울누적</div>
                <div class="photo"><img src="images/player_06.jpg" alt=""></div>
                <br>
                <c:forEach items="${foulRank}" var="dto6" varStatus="status">
                <div class="rankInfo">
                    <div>${status.count}</div>
                    <div><a href="/soccer/player/playerDetails.do?seq=${dto6.mseq}">${dto6.memberName}</a></div>
                    <div>${dto6.foul}</div>
                </div>
                </c:forEach>
            </div>

        </div>

    </div>
	
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

 // 경기일정 오른쪽 화살표
    $("#right").hover(function () {
        $(this).css("cursor","pointer")
    }).click(function () {

        /* $(".infoOuter").css("position","relative").css("left","-1550px").css("transitionDuration","1s"); */
        
        $(".infoBox").animate({
            left : "-1400px",
        },1000)

    });
    // 경기일정 왼쪽 화살표
    $("#left").hover(function () {
        $(this).css("cursor","pointer")
    }).click(function () {

        /*  $(".infoBox").css("position","relative").css("left","0px").css("transitionDuration","1s"); */
        $(".infoBox").animate({
            left : "0px",
        },1000)
    });

    //상단바 로그인,마이페이지 화면이동
    $(".btn1").click(function () {
        location.href="login.html"
    })
    $("#join").click(function () {
        location.href="../member/signUp.jsp"
    })
    $(".btn3").click(function () {
        location.href="mypage.html"
    })


    // ----------------------------------------------------------

    //current position
    var pos = 0;
    //number of slides
    var totalSlides = $('#slider-wrap ul li').length;
    //get the slide width
    var sliderWidth = $('#slider-wrap').width();


    $(document).ready(function () {


        /*****************
         BUILD THE SLIDER
        *****************/
        //set width to be 'x' times the number of slides
        $('#slider-wrap ul#slider').width(sliderWidth * totalSlides);

        //next slide    
        $('#next').click(function () {
            slideRight();
        });

        //previous slide
        $('#previous').click(function () {
            slideLeft();
        });



        /*************************
         //*> OPTIONAL SETTINGS
        ************************/
        //automatic slider
        var autoSlider = setInterval(slideRight, 3000);

        //for each slide 
        $.each($('#slider-wrap ul li'), function () {

            //create a pagination
            var li = document.createElement('li');
            $('#pagination-wrap ul').append(li);
        });

        //counter
        countSlides();

        //pagination
        pagination();

        //hide/show controls/btns when hover
        //pause automatic slide when hover
        $('#slider-wrap').hover(
            function () { $(this).addClass('active'); clearInterval(autoSlider); },
            function () { $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
        );



    });//DOCUMENT READY



    /***********
     SLIDE LEFT
    ************/
    function slideLeft() {
        pos--;
        if (pos == -1) { pos = totalSlides - 1; }
        $('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

        //*> optional
        countSlides();
        pagination();
    }


    /************
     SLIDE RIGHT
    *************/
    function slideRight() {
        pos++;
        if (pos == totalSlides) { pos = 0; }
        $('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

        //*> optional 
        countSlides();
        pagination();
    }




    /************************
     //*> OPTIONAL SETTINGS
    ************************/
    function countSlides() {
        $('#counter').html(pos + 1 + ' / ' + totalSlides);
    }

    function pagination() {
        $('#pagination-wrap ul li').removeClass('active');
        $('#pagination-wrap ul li:eq(' + pos + ')').addClass('active');
    }

        
    </script>
    
    
</body>

</html>