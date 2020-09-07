// 메뉴에 숫자 넣기
var menus = document.getElementsByClassName("menu");
console.log(menus[0]);
for (var i = 0; i < menus.length; i++) {
    // console.log(menus[i]);
    menus[i].className += " menu" + (i + 1);
}

// 메뉴에 숫자 넣기
// var btns = document.getElementsByClassName("btn-default");
// for (var i = 0; i < btns.length; i++) {
//     // console.log(menus[i]);
//     btns[i].id += " btn" + (i + 1);
//     console.log(btns[i]);
// }

// 메뉴 호버
$("#menuTr")
    .children()
    .mouseover(function () {
        $(this).css("opacity", "1").css("background-color", "#005093");
    })
    .mouseout(function () {
        $(this).css("background-color", "rgb(37, 40, 42)").css("opacity", ".7");
    });

// 메뉴 이동 (클릭이벤트)
// 정규리그 일정
$("#menuTr")
    .children(".menu1")
    .click(function () {
        location.href = "leagueschedule.html";
    });
// 구단현황
$("#menuTr")
    .children(".menu2")
    .click(function () {
        location.href = "teamlist.html";
    });
// 선수현황
$("#menuTr")
    .children(".menu3")
    .click(function () {
        location.href = "playerStatus.html";
    });
// 전력분석
$("#menuTr")
    .children(".menu4")
    .click(function () {
        location.href = "teamAnalysis.html";
    });
// 문자중계
$("#menuTr")
    .children(".menu5")
    .click(function () {
        location.href = "textbroadcastingschedule.html";
    });
// 게시판
$("#menuTr")
    .children(".menu6")
    .click(function () {
        location.href = "community.html";
    });
// 공지사항
$("#menuTr")
    .children(".menu7")
    .click(function () {
        location.href = "noticeBoard.html";
    });

// 로고누르면 메인으로이동
$("#mainrogo")
    .hover(function () {
        $(this).css("cursor", "pointer");
    })
    .click(function () {
        location.href = "main.html";
    });

// 서브메뉴 이벤트
// $("li").mouseover(function (params) {

//     $(this).css("background-color", "rgb(15, 13, 13);");

// }).mouseout(function (params) {

//     $(this).css("background-color", "#25282a");

// });

// 상단 로그인 이벤트
// $("#btn1").click(function () {
//     location.href="login.html"
//     console.log(1)
// })
// $("#btn3").click(function () {
//     alert();
//     location.href="mypage.html"
// })

$(".btn").click(function () {
    if ($(this).text() == "로그인") {
        location.href = "login.html";
    } else if ($(this).text() == "마이페이지") {
        location.href = "mypage.html";
    }
});

// 서브 메뉴 클릭이벤트
$(".subMenuItem").click(function () {
    var menu = $(this).text();
    console.log(menu);
    // 구단현황
    if (menu == "구단정보") {
        location.href = "teamlist.html";
    } else if (menu == "구단선수정보") {
        location.href = "teamplayerinfomation.html";
    } else if (menu == "구단경기정보") {
        location.href = "teamrecord.html";
    }
    // 정규리그일정
    else if (menu == "정규리그일정") {
        location.href = "leagueschedule.html";
    } else if (menu == "경기결과조회") {
        location.href = "leagueresult.html";
    }
});
