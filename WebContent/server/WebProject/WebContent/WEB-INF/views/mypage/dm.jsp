<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/soccer/css/dm.css">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<style>
</style>
</head>

<%@include file="/WEB-INF/views/inc/header.jsp"%>

<div id="topBoard"></div>
<div id="scoreBoard">
	<div id="subOuter">
		<div class="menuTitleBox">
			<div class="menuTitle">마이페이지</div>
			<div class="breadcrumb">
				<span>HOME</span> <span>></span> <span>마이페이지</span> <span>></span> <span>DM</span>
			</div>
			<div class="subMenuBox">
				<nav class="subMenu">
					<ul>
						<li class="subMenuItem"><a href="/soccer/mypage/mypage.do">
								마이페이지</a></li>
						<li class="subMenuItem"><a
							href="/soccer/mypage/clubsummary.do">구단정보관리</a></li>
						<li class="subMenuItem"><a href="/soccer/mypage/friends.do">친구관리</a></li>
						<li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a
							href="/soccer/mypage/dm.do">DM</a></li>
					</ul>
				</nav>
			</div>

		</div>
	</div>

</div>
<!-- 상단부 끝 -->

<!-- 내용 시작 -->
<div class="center">

	<div class="pageContentTitle">
		<img src="/soccer/images/rogowithoutletter.png" class="contentTitleImg"><span
			class="contentTitle">DM</span>
	</div>

	<div class="wrapper">
		<div class="container">
			<div class="left">
				<div class="top">
					<input type="text" placeholder="Search" /> <a href="javascript:;"
						class="search"></a>
				</div>
				<ul class="people">
					<c:forEach items="${friends}" var="dto">
						<li class="person" data-chat="person${dto.seq}"><img
							src="/soccer/images/${dto.followingImage}" alt="" /> <span
							class="name" name="followingname">${dto.followingName}</span> <span
							class="time">2:09 PM</span> <span class="preview">I was
								wondering...</span></li>
					</c:forEach>

				</ul>
			</div>
			<div class="right">

				<div class="top">

					<span>To: <span class="name"></span></span>

				</div>
				<%-- 				<c:forEach items="${dm}" var="dto"> --%>
				<div class="chat" data-chat="person${dto.seq}">
					<div class="conversation-start">
						<span>${dto.regdate}</span>
					</div>
					<div class="bubble you">${dto.content}</div>
				</div>
				<%-- 				</c:forEach> --%>
				<div class="write">
					<a href="javascript:;" class="write-link attach"></a> <input
						type="text" /> <a href="javascript:;" class="write-link smiley"></a>
					<a href="javascript:;" class="write-link send"></a>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- 내용 끝 -->





<!-- 하단부  -->
<%@include file="/WEB-INF/views/inc/footer.jsp"%>


<!-- 스크립트------------------------------------------------------------- -->
<script>
document.querySelector('.chat[data-chat=person]').classList.add('active-chat')
document.querySelector('.person[data-chat=person]').classList.add('active')

let friends = {
    list: document.querySelector('ul.people'),
    all: document.querySelectorAll('.left .person'),
    name: ''
},
    chat = {
        container: document.querySelector('.container .right'),
        current: null,
        person: null,
        name: document.querySelector('.container .right .top .name')
    }

friends.all.forEach(f => {
    f.addEventListener('mousedown', () => {
        f.classList.contains('active') || setAciveChat(f)
    })
});

function setAciveChat(f) {
    friends.list.querySelector('.active').classList.remove('active')
    f.classList.add('active')
    chat.current = chat.container.querySelector('.active-chat')
    chat.person = f.getAttribute('data-chat')
    chat.current.classList.remove('active-chat')
    chat.container.querySelector('[data-chat="' + chat.person + '"]').classList.add('active-chat')
    friends.name = f.querySelector('.name').innerText
    chat.name.innerHTML = friends.name
}


$(".person").click(function(){
	//검색어 -> 서버 전송 -> DB 작업 -> 목록 반환 
	 // -> <select> 출력
	$.ajax({
		type:"GET",
		url:"/soccer/mypage/dm.do",
		data: "",
		dataType:"json",
		success:function(result){
			//목록 수신 + 처리 
			//result -> 객체배열
			//alert();
			$(result).each(function(){
				$(dto.regdate)
			});
			
		}
		
	});
	
	
});



</script>


</body>

</html>