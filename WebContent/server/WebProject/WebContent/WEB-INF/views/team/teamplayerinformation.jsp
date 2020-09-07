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
    <link rel="stylesheet" href="/soccer/css/teamplayerinformation.css">
    <style>
    
    </style>
</head>

   	<%@include file="/WEB-INF/views/inc/header.jsp" %>

    <div id="topBoard">
    </div>

    <div id="scoreBoard">
        <div id="subOuter">
            <div class="menuTitleBox">
                <div class="menuTitle">구단현황</div>
                <div class="breadcrumb">
                    <span>HOME</span>
                    <span>></span>
                    <span>구단현황</span>
                    <span>></span>
                    <span>구단선수정보</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem"><a href="teamAnalysis.html">팀분석</a></li>
                            <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a href="playerAnalysis.html">선수분석</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->

        <div class="center" style="overflow: hidden;">
            <div class="pageContentTitle">
                <img src="images/rogowithoutletter.png" class="contentTitleImg" /><span class="contentTitle"
                    >구단선수정보</span
                >
            </div>
            <div class="leftSideBox">
                <div class="entryOuter">
                    <div class="teamName"><span>홍길동FC</span></div>
                    <div class="entry" id="teamAEntry">
                         <div class="player" id="playerHeader">
                            <span class="backNum">등번호</span>
                            <span class="playerName">이름</span>
                            <span class="position">포지션</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                        <div class="player" id="">
                            <span class="backNum">7</span>
                            <span class="playerName">이찬찬</span>
                            <span class="position">ST</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightSideBox" style="position: relative;">
                <div style="position: relative; width: 100%; margin-top: 0px;">
                    <img
                        src="images/man_03.png"
                        alt=""
                        width="25%"
                        style="
                            position: relative;
                            top: -150px;
                            display: inline-block;
                            margin-right: 50px;
                            border: 3px solid black;
                        "
                    />
                    <div style="position: relative; right: 0; display: inline-block; width: 580px;">
                        <table class="table table-striped table-bordered" style="width: 100%;">
                            <tr>
                                <th>선수이름</th>
                                <td>홍길동</td>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <td>1995-04-15</td>
                            </tr>
                            <tr>
                                <th>소속팀</th>
                                <td>쌍용FC</td>
                            </tr>
                            <tr>
                                <th>등번호</th>
                                <td>9</td>
                            </tr>
                            <tr>
                                <th>포지션</th>
                                <td>FW</td>
                            </tr>
                            <tr>
                                <th>신장</th>
                                <td>177</td>
                            </tr>
                            <tr>
                                <th>체중</th>
                                <td>70kg</td>
                            </tr>
                        </table>
                    </div>
                    <div style="clear: left;"></div>
                </div>
                <div>
                    <input
                        id="comment"
                        type="button"
                        class="btn btn-primary"
                        value="응원댓글보기/쓰기"
                        style="margin-left: 50px;"
                    />
                    <!-- <br> -->
                    <input id="message" type="button" class="btn btn-success" value="선수에게 메시지" />
                    <!-- <br> -->
                    <input id="friend" type="button" class="btn btn-info" value="친구신청" />
                </div>

                <div class="title glyphicon glyphicon-list">전체경기정보(친선포함)</div>
                <div style="margin-left: 0px;">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th>경기수</th>
                            <th>득점</th>
                            <th>도움</th>
                            <th>유효슈팅</th>
                            <th>파울</th>
                            <th>경고</th>
                            <th>퇴장</th>
                        </tr>
                        <tr>
                            <td>25</td>
                            <td>20</td>
                            <td>2</td>
                            <td>35</td>
                            <td>5</td>
                            <td>3</td>
                            <td>0</td>
                        </tr>
                    </table>
                </div>
                <div class="title glyphicon glyphicon-list">리그 성적</div>
                <div style="margin-left: 0px;">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th>경기수</th>
                            <th>득점</th>
                            <th>도움</th>
                            <th>유효슈팅</th>
                            <th>파울</th>
                            <th>경고</th>
                            <th>퇴장</th>
                        </tr>
                        <tr>
                            <td>25</td>
                            <td>20</td>
                            <td>2</td>
                            <td>35</td>
                            <td>5</td>
                            <td>3</td>
                            <td>0</td>
                        </tr>
                    </table>
                </div>
                <div class="title glyphicon glyphicon-list">댓글목록</div>
                <div style="margin-left: 0px;">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th>번호</th>
                            <th>작성자</th>
                            <th>작성일자</th>
                            <th>내용</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>축구왕</td>
                            <td>2020-07-20</td>
                            <td>저번경기 잘 봤습니다.</td>
                        </tr>
                    </table>
                </div>
                <!-- 오른쪽 사이드박스 -->
            </div>
        </div>
         <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

        

        
    </script>
    
    
</body>

</html>