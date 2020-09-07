// 메뉴 클릭시 발생하는 이벤트
// $(".menu")
//     .click(function () {
//         // 어떤 메뉴를 눌렀는지 알려준다.

//         var menu = $(this).children().text();
//         console.log(menu);
//     })
//     .mouseover(function () {
//         // 호버. CSS 효과 줌
//         $(this).children().css({
//             // "text-shadow": "1px 1px 2px",
//             // color: "#F6BE0D",
//             // transform: "scale(1, 1)",
//             "background-color": "#0077C8",
//         });
//     })
//     .mouseout(function () {
//         // 토글
//         $(this).children().css({
//             "text-shadow": "",
//             color: "",
//             transform: "",
//             "background-color": "#25282A",
//         });
//     });

//breadcrumb는 예약어, 이름 변경
var breadCrumb = document.getElementsByClassName("breadcrumb")[0];
breadCrumb.className = "breadCrumb";

var crumbOuter = document.createElement("div");
crumbOuter.id = "crumbOuter";

var subMenuBox = document.getElementsByClassName("subMenuBox")[0];

$(".menuTitleBox")[0].insertBefore(crumbOuter, subMenuBox);
