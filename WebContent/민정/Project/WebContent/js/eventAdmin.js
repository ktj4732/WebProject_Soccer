// 메뉴 이동 (클릭이벤트)
// 정규리그 일정
// $("#menuTr")
//     .children(".menu1")
//     .click(function () {
//         location.href = ;
//     });

$(".menu1")
    .click(function(){
        location.href="result_league.html";
    });

$(".menu2")
    .click(function(){
        location.href="result_match.html";
    });

    $(".menu3")
    .click(function(){
        location.href="${pageContext.request.contextPath}/notice.do";
    });

    $(".menu4")
    .click(function(){
        location.href="blackList.html";
    });

    $(".menu5")
    .click(function(){
        location.href="ground_list.html";
    });


    //혜림씨 경로
    $(".menu6")
    .click(function(){
        location.href="ground_list.html";
    });

    $(".menu7")
    .click(function(){
        location.href="ground_list.html";
    });

    $(".menu8")
    .click(function(){
        location.href="ground_list.html";
    });
    
    
    
    
    
    $("#btnAdd_ground")
    .click(function(){
        location.href="ground_new.html";
    });
    
    //공지사항 추가 버튼
//    $("#btnAdd_notice")
//    .click(function(){
//        location.href="notice_new.jsp";
//    });

    $("#btnAdd_league")
    .click(function(){
        location.href="result_league_new.html";
    })