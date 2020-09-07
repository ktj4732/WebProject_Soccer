// 메뉴에 숫자 넣기
var menus = document.getElementsByClassName("menu");
console.log(menus[0]);
for (var i = 0; i < menus.length; i++) {
    // console.log(menus[i]);
    menus[i].className += " menu" + (i + 1);
}

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
// 경기결과(리그)
$("#menuTr")
.children(".menu1")
.click(function () {
    location.href = "result_league.html";
});

// 경기결과(친선)
$("#menuTr")
.children(".menu2")
.click(function () {
    location.href = "result_league.html";
});

// 공지사항
$("#menuTr")
.children(".menu3")
.click(function () {
    location.href = "Notice.html";
});

// 블랙리스트
$("#menuTr")
.children(".menu4")
.click(function () {
    location.href = "blackList.html";
});

// 경기장 관리
$("#menuTr")
.children(".menu5")
.click(function () {
    location.href = "ground_list.html";
});

// 정규리그 일정
$("#menuTr")
.children(".menu6")
.click(function () {
    location.href = "result_league.html";
});

// 구단관리
$("#menuTr")
.children(".menu7")
.click(function () {
    location.href = "result_league.html";
});

// 선수검색
$("#menuTr")
.children(".menu8")
.click(function () {
    location.href = "result_league.html";
});

// 로고누르면 메인으로이동
$("#mainrogo")
    .hover(function () {
        $(this).css("cursor", "pointer");
    })
    .click(function () {
        location.href = "main.html";
    });





// 서브메뉴 이동 (클릭이벤트)
// 경기결과(리그)
$(".subMenu")
.children(".submenu1")
.click(function () {
    location.href = "result_league.html";
});

// 경기결과(친선)
$(".subMenu")
.children(".submenu2")
.click(function () {
    location.href = "result_match.html";
});

// 공지사항
$(".subMenu")
.children(".submenu3")
.click(function () {
    location.href = "Notice.html";
});

// 블랙리스트
$(".subMenu")
.children(".submenu4")
.click(function () {
    location.href = "blackList.html";
});

// 경기장 관리
$(".subMenu")
.children(".submenu5")
.click(function () {
    location.href = "ground_list.html";
});

// 경기결과(리그)
$(".subMenu")
.children(".submenu6")
.click(function () {
    location.href = "result_league.html";
});

// 경기결과(리그)
$(".subMenu")
.children(".submenu7")
.click(function () {
    location.href = "result_league.html";
});
