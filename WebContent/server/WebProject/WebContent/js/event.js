var flag = false;
$(document).scroll(function () {

    if ($(document).scrollTop() > $
        ("#main").position().top) {

        if (!flag) {
            $("#main").css({
                position: "fixed",
                top: -$("#main").outerHeight(),
                bottom: ""
            });

            $("#main").animate({
                top: "0px"
            }, 1000, function () {
                //alert();
                flag = true;
            });
        }

    }

});


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
// 정규리그 일정
$("#menuTr")
    .children(".menu1")
    .click(function () {
        location.href = "/soccer/schedule/leagueschedule.do";
    });
// 구단현황
$("#menuTr")
    .children(".menu2")
    .click(function () {
        location.href = "/soccer/team/teamlist.do";
    });
// 선수현황
$("#menuTr")
    .children(".menu3")
    .click(function () {
        location.href = "/soccer/player/playerStatus.do";
    });
// 전력분석
$("#menuTr")
    .children(".menu4")
    .click(function () {
        location.href = "/soccer/analysis/teamAnalysis.do";
    });
// 문자중계
$("#menuTr")
    .children(".menu5")
    .click(function () {
        location.href = "/soccer/broadcast/textbroadcastingschedule.do";
    });
// 게시판
$("#menuTr")
    .children(".menu6")
    .click(function () {
        location.href = "/soccer/board/communityQuestionBulletinBoard.do";
    });
// 공지사항
$("#menuTr")
    .children(".menu7")
    .click(function () {
        location.href = "/soccer/notice/noticeBoard.do";
    });

// 로고누르면 메인으로이동
$("#mainrogo")
    .hover(function () {
        $(this).css("cursor", "pointer");
    })
    .click(function () {
        location.href = "/soccer/main.do";
    });



$(".btn").click(function(){
    
    if($(this).text()=="로그인"){
        location.href="login.html"
    } else if($(this).text()=="마이페이지"){
        location.href="mypage.html"
    }
})

// 서브 메뉴 클릭이벤트
$(".subMenuItem")
.css({cursor:"pointer"})
.click(function () {
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




// if (location.href.indexOf("communityFreeBulletinBoard") > -1) {
//     $(".subMenuItem").eq(2).css("background-color", "yellow");
// } 
