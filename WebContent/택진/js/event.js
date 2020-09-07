 // 메뉴 호버
 $("#menuTr").children().mouseover(function () {
    $(this).css("opacity","1").css("background-color","#005093");
}).mouseout(function () {
    $(this).css("background-color", "rgb(37, 40, 42)").css("opacity",".7");
});

// 메뉴 이동 (클릭이벤트)
// 정규리그 일정
$("#menuTr").children('.menu1').click(function () {
    location.href="leagueschedule.html";
})
// 구단현황
$("#menuTr").children('.menu2').click(function () {
    location.href="teamlist.html";
})
// 선수현황
$("#menuTr").children('.menu3').click(function () {
    location.href="playerStatus.html";
})
// 전력분석
$("#menuTr").children('.menu4').click(function () {
    location.href="teamAnalysis.html";
})
// 문자중계
$("#menuTr").children('.menu5').click(function () {
    location.href="textbroadcastingschedule.html";
})
// 게시판
$("#menuTr").children('.menu6').click(function () {
    location.href="community.html";
})
// 공지사항
$("#menuTr").children('.menu7').click(function () {
    location.href="noticeBoard.html";
})

// 로고누르면 메인으로이동
$("#mainrogo").hover(function () {
    $(this).css("cursor","pointer");
}).click(function () {
    location.href="main.html";
})

