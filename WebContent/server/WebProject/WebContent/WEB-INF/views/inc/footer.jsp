<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 하단부  -->

    <nav class="sitemap">
        <ul class="siteList">
            <h2 class="listName"><a href="#">경기정보조회</a></h2>
            <li><a href="#">2020 정규리그 일정조회</a></li>
            <li><a href="#">정규리그 결과 조회</a></li>
            <li><a href="#">지난 정규리그 조회</a></li>
            <li><a href="#">친선경기 결과 조회</a></li>
        </ul>
        <ul class="siteList">
            <h2 class="listName"><a href="#">구단현황</a></h2>
            <li><a href="#">구단 정보</a></li>
            <li><a href="#">구단 선수 정보 조회</a></li>
            <li><a href="#">구단 경기 전적</a></li>
        </ul>
        <ul class="siteList">
            <h2 class="listName"><a href="#">선수현황</a></h2>
            <li><a href="#">선수 검색</a></li>
            <li><a href="#">선수 정보</a></li>
            <li><a href="#">선수 응원댓글</a></li>
            <li><a href="#">선수 DM</a></li>
        </ul>
        <ul class="siteList">
            <h2 class="listName"><a href="#">전력분석</a></h2>
            <li><a href="#">팀분석</a></li>
            <li><a href="#">선수분석</a></li>
            <li><a href="#">시뮬레이션</a></li>
        </ul>
        <ul class="siteList">
            <h2 class="listName"><a href="#">게시판</a></h2>
            <li><a href="#">질문게시판</a></li>
            <li><a href="#">갤러리</a></li>
            <li><a href="#">자유게시판</a></li>
            <li><a href="#">강의게시판</a></li>
            <li><a href="#">친선경기모집</a></li>
            <li><a href="#">용병모집</a></li>
        </ul>
        <ul class="siteList">
            <h2 class="listName"><a href="#">공지사항</a></h2>
        </ul>
        <ul class="siteList">
            <h2 class="listName"><a href="#">문자중계</a></h2>
        </ul>

    </nav>


    <div class="footer">
        <div class="footerBox">
            <div><a href="#">협회소개</a></div>
            <div><a href="#">이용약관</a></div>
            <div><a href="#">개인정보 취급방침</a></div>
            <div><a href="#">제휴문의</a></div>
            <c:if test="${empty id}">
            <div><a href="/soccer/admin_login.do">관리자 로그인</a></div>
            <div><a href="/soccer/member/login.do">구단주 로그인</a></div>
            </c:if>
            <c:if test="${!empty id}">
            <div><a href="/soccer/board/clubmanagementFriendlyMatchRecruitManagement.do">구단주 페이지</a></div>
            </c:if>
        </div>
    </div>
    <div class="footerBox2">
        <div class="footerInfo">
            <div class="infoItem">리그운영 및 총괄 / 대관 문의</div>
            <div class="info">정성원(010-3151-5582)</div>
        </div>
        <div class="footerInfo">
            <div class="infoItem">리그운영 및 사무업무</div>
            <div class="info">김준형(010-2370-2061)</div>
        </div>
        <div class="footerInfo">
            <div class="infoItem">선수등록 및 기록문의</div>
            <div class="info">정미선(010-9066-9495)</div>
        </div>
        <div class="footerInfo">
            <div class="infoItem">리그일정 조정</div>
            <div class="info">정성원(010-3151-5582)</div>
        </div>
        <div class="footerInfo">
            <div class="infoItem">시스템개발문의</div>
            <div class="info">(주)쌍용소프트(070-4322-2918)</div>
        </div>
        <div class="footerInfo">
            <div class="infoItem">한독빌딩</div>
            <div class="info">서울시 강남구 테헤란로 132 한독빌딩 8층</div>
        </div>
        <div class="footerInfo">
            <div class="infoItem">TEL</div>
            <div class="info">070)4322-2918</div>
        </div>
        <div class="footerInfo">
            <div class="infoItem">FAX</div>
            <div class="info" style="clear: both;">070)4322-2919</div>
        </div>
    </div>
    <div class="footerBox3">
        <div>본 사이트는 IT기업 (주)쌍용소프트가 시흥축구협회리그 선수들을 위해 운영하는 공식사이트입니다.</div>
        <div>Copyrightⓒ ssangyongsoft All Rights reserved.</div>
    </div>


    <!-- 하단부  끝 -->
    
    <script src="/soccer/js/event.js"></script>
    <script src="/soccer/js/submain.js"></script>