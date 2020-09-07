<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 상단부 -->
<nav id="main">
    <table class="table table-default" id="mainMenu">
        <tr id="menuTop">
            <td colspan="3"></td>
            <td rowspan="2" id="rogo" style="width: 1px">
                <img src="/soccer/images/rogo_2.png" alt="" id="mainrogo" />
            </td>
            <td colspan="4">
                <!-- 로그인 전 -->
                <c:if test="${empty id}">
                    <span>
                        <span class="glyphicon glyphicon-ok toppackage"></span>
                        <a href="/soccer/member/login.do" class="toppackage" style="margin-right: 20px">로그인</a>
                    </span>
                    <span>
                        <span class="glyphicon glyphicon-user toppackage"></span>
                        <a href="/soccer/member/signUp.do" class="toppackage" style="">회원가입</a>
                    </span>
                </c:if>

                <!-- 로그인 후 -->
                <c:if test="${not empty id}">
                    <span></span>
                    <span>
                        <span class="toppackage" style="border-bottom: 1px solid silver; margin-right: 20px"
                            >${name} 님</span
                        >
                        <span class="glyphicon glyphicon-ok toppackage"></span>
                        <a href="/soccer/member/logout.do" class="toppackage" style="margin-right: 20px">로그아웃</a>
                    </span>
                    <span>
                        <span class="glyphicon glyphicon-user toppackage"></span>
                        <a href="/soccer/mypage/mypage.do" class="toppackage" style="">마이페이지</a>
                    </span>
                </c:if>
            </td>
        </tr>
        <tr id="menuTr">
            <td class="menu menu1"><span class="menuLabel">정규리그일정</span></td>
            <td class="menu menu2"><span class="menuLabel">구단현황</span></td>
            <td class="menu menu3"><span class="menuLabel">선수현황</span></td>
            <td class="menu menu4"><span class="menuLabel">전력분석</span></td>
            <td class="menu menu5"><span class="menuLabel">문자중계</span></td>
            <td class="menu menu6"><span class="menuLabel">게시판</span></td>
            <td class="menu menu7"><span class="menuLabel">공지사항</span></td>
        </tr>
    </table>
</nav>
<!-- 상단부 끝-->
