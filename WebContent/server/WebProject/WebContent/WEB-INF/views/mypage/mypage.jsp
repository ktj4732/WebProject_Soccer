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
<link rel="stylesheet" href="/soccer/css/mypage.css">
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
				<span>HOME</span> <span>></span> <span>마이페이지</span>
			</div>
			<div class="subMenuBox">
				<nav class="subMenu">
					<ul>
						<li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a
							href="/soccer/mypage/mypage.do"> 마이페이지</a></li>
						<li class="subMenuItem"><a href="/soccer/mypage/clubsummary.do">구단정보관리</a>
						</li>
						<li class="subMenuItem"><a href="/soccer/mypage/friends.do">친구관리</a></li>
						<li class="subMenuItem"><a href="/soccer/mypage/dm.do">DM</a></li>
					</ul>
				</nav>
			</div>

		</div>
	</div>

</div>
<!-- 상단부 끝 -->



<!-- 내용 시작 -->
<%-- <c:if test = "${not empty id}"> --%>
<div class="center">

	<div class="pageContentTitle">
		<img src="/soccer/images/rogowithoutletter.png"
			class="contentTitleImg"><span class="contentTitle">마이페이지</span>
	</div>
	<div class="mypageContents">

			<div class="myPageInfoBox">
				<div class="topTitle">
					<i class="glyphicon glyphicon-user"></i>회원정보
				</div>
		<c:forEach items="${list}" var="dto">
				<div id="memberpic">
					<img src="/soccer/images/${dto.image}">
				</div>
				<div id="membername">
					<div>${dto.name}</div>
					<c:choose>
						<c:when test="${not empty dto.team }">
							<div>${dto.team}FC</div>
						</c:when>
						<c:otherwise>
				 <div>팀이 없습니다.</div>
				</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${not empty dto.position}">
							<div>${dto.position}</div>
						</c:when>
						<c:otherwise>
				 <div>포지션이 없습니다.</div>
				</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${not empty dto.height}">
							<div>${dto.height}cm</div>
						</c:when>
						<c:otherwise>
				<div>--cm</div>
				</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${not empty dto.weight}">
							<div>${dto.weight}kg</div>
						</c:when>
						<c:otherwise>
				<div>--kg</div>
				</c:otherwise>
					</c:choose>
				</div>
				<div id="infoUpdate">
					<input type="button" class="btn" id="updateBtn" value="정보 수정하기"
						onclick="location.href='/soccer/mypage/mypageinfoupdate.do?seq=${dto.seq}';">
					<input type="button" class="btn" id="withdrawalbtn" value="탈퇴하기">
				</div>

		</c:forEach>
			</div>

		<div class="myPageInfoBox">
			<div class="topTitle">
				<i class="glyphicon glyphicon-send"></i>DM
			</div>
			<table class="DM table table-bordered table-striped "
				style="border: 0px;">
				<c:forEach items="${dmlist}" var="dto2">
					<tr>
						<td>
							<div id="dmImgBox">
								<img src="/soccer/images/${dto2.writer_image}">
							</div>
							<div class="dmInfo">
								<div>${dto2.writer_name}</div>
								<div >
									${dto2.content}<span style="width:100px;">${dto2.regdate}</span>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
<!-- 			<input type="button" class="btn" value="더보기" id="moreBtn"> -->
		</div>
		<div class="myPageInfoBox" >
			<div class="topTitle">
				<i class="glyphicon glyphicon-calendar"></i>경기일정
			</div>
			<div id="matchTableBox" style="overflow:scroll; height : 240px;">
			<table class="matchTable table table-bordered table-striped">
				<tr>
					<th>경기</th>
					<th>일시</th>
					<th>장소</th>
				</tr>
				
			<c:forEach items="${leaguelist}" var="dto3">
				<tr>
					<td>VS ${dto3.awayName}</td>
					<td>${dto3.gameDate} </td>
					<td>${dto3.ground}</td>
				</tr>
			</c:forEach>
			</table>
			</div>
			<input type="button" class=" btn" value="더보기" id="moreBtn2">

		</div>

		<div class="myPageInfoBox">
			<div class="topTitle">
				<i class="glyphicon glyphicon-king"></i>리그 개인 순위
			</div>
			<figure class="highcharts-figure">
				<div id="container"></div>
				<p class="highcharts-description">
			</figure>
		</div>
	</div>
</div>

<!-- 탈퇴신청 Modal-->

 <div class="modal fade" id="withdrawalModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #25282A;">
                    <h5 class="modal-title" id="exampleModalLabel" style="color: #92DAEC; display: inline;">탈퇴신청</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">X</span>
                    </button>
                </div>
                 	<form method="POST" action="/soccer/mypage/memberdeleteok.do">
                <div class="modal-body">
                    <div>비밀번호를 입력해주세요.</div>
<!--                    	비밀번호 비교 -->
                    <c:if test=""></c:if>
                    <input type="password" name="secession" id="secession" >
                </div>
                <div class="modal-footer">
                    <!-- 비밀번호를 입력하고 ok버튼 누르면 회원 비밀번호와 비교하여 일치했을시 다시 물어보기  -->
                  	<button type="submit" class="btn" id="modalY">ok</button>
<!--                     <a class="btn" id="modalY" href="#" >ok</a> -->
                    <button class="btn" type="button" data-dismiss="modal">cancle</button>
                </div>
                </form>
            </div>
        </div>
    </div>

<!-- 비밀번호확인요청 Modal-->

 <div class="modal fade" id="check" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #25282A;">
                    <h5 class="modal-title" id="exampleModalLabel" style="color: #92DAEC; display: inline;">탈퇴신청</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">X</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div>비밀번호를 확인해주세요</div>
                </div>
                <div class="modal-footer">
                    <button class="btn" type="button" data-dismiss="modal">cancle</button>
                </div>
            </div>
        </div>
    </div>


<%-- </c:if> --%>




<!-- 내용 끝 -->





<!-- 하단부  -->
<%@include file="/WEB-INF/views/inc/footer.jsp"%>


<!-- 스크립트------------------------------------------------------------- -->

<!-- 차트 -->
<script>

// $(document).ready(function(){
// 	$.ajax({
// 		type:"POST",
// 		url:"/soccer/mypage/mypageok.do",
// 		data : "seq=" + ${seq},
// 		success : function(result){
			
			
// 		},
// 		error : function(a,b,c){
// 			console.log(a,b,c);
// 		}
		
		
		
// 	})
	
	
	
		
// });

 
var rank1;
var rank2;
var rank3;

$(document).ready(function(){
	
// 	<c:forEach items="${ranklist}" var="ranklist">
// 		rank1 = parseInt(${ranklist.ranking1},10);
// 		rank2 = parseInt(${ranklist.ranking2},10);
// 		rank3 = parseInt(${ranklist.ranking3},10);
// 	</c:forEach>
	/* ${ranklist}.forEach(function (item, index, array) {
		console.log(item);
	}) */
	
	rank1 = parseInt(${dto.ranking1},10);
	rank2 = parseInt(${dto.ranking2},10);
	rank3 = parseInt(${dto.ranking3},10);
	
	console.log(rank1);	
	
	Highcharts.chart('container', {
		chart : {
		// backgroundColor: "#254150"
		},
		title : {
			text : '리그 개인 순위',

		},

		subtitle : {
		// text: 'Source: thesolarfoundation.com'
		},

		yAxis : {
			title : {
				text : '순위',

			},
			allowDecimals : false,
			reversed : true,
			// min: 0.5,
			startOnTick : false,
			endOnTick : false,
		// max: 3.5
		},

		xAxis : {
			accessibility : {
				rangeDescription : 'Range: 1 to 12'
			}
		},

		legend : {
			layout : 'vertical',
			align : 'right',
			verticalAlign : 'middle'
		},

		plotOptions : {
			series : {
				label : {
					connectorAllowed : false
				},
				pointStart : 1
			}
		},

		series : [  {
			color : '#00BF88',
			name : '리그 개인 순위',
			data : [ rank1, rank2, rank3]
		}, ],

		responsive : {
			rules : [ {
				condition : {
					maxWidth : 500
				},
				chartOptions : {
					legend : {
						layout : 'horizontal',
						align : 'center',
						verticalAlign : 'bottom'
					}
				}
			} ]
		}

	});
	
});



/* 
$(document).ready(function(){
	var seq = ${seq};
	$.ajax({
		type:"GET",
		url : "/soccer/mypage/mypage.do",
		data : "seq=" + seq,
		dataType: "text",
		success:function(result){
			options.series[0].data=result;
			Highcharts.chart('container', options);
		},
		error:function(a,b,c){
			console.log(a,b,c);
		}
	
	
	}); 	

}); */
 
// 	var options = {
// 		// backgroundColor: "#254150"
	
// 	title : {
// 		text : '리그 및 구단 개인 순위',

// 	},

// 	subtitle : {
// 	// text: 'Source: thesolarfoundation.com'
// 	},

// 	yAxis : {
// 		title : {
// 			text : '순위',

// 		},
// 		allowDecimals : false,
// 		reversed : true,
// 		// min: 0.5,
// 		startOnTick : false,
// 		endOnTick : false,
// 	// max: 3.5
// 	},

// 	xAxis : {
// 		accessibility : {
// 			rangeDescription : 'Range: 1 to 12'
// 		}
// 	},

// 	legend : {
// 		layout : 'vertical',
// 		align : 'right',
// 		verticalAlign : 'middle'
// 	},

// 	plotOptions : {
// 		series : {
// 			label : {
// 				connectorAllowed : false
// 			},
// 			pointStart : 1
// 		}
// 	},

// 	series : [ {
// 		color : '#0077C8',
// 		name : '리그 개인 순위',
// 		data : [
// // 			3,4,5
			
// 		]
// 	}, {
// 		color : '#00BF88',
// 		name : '팀 내 순위',
// 		data : [
			
// 		]
// 	}, ],

// 	responsive : {
// 		rules : [ {
// 			condition : {
// 				maxWidth : 500
// 			},
// 			chartOptions : {
// 				legend : {
// 					layout : 'horizontal',
// 					align : 'center',
// 					verticalAlign : 'bottom'
// 				}
// 			}
// 		} ]
// 	}
// // 	$("text").css("fill", "black");
// // 	$(".highcharts-credits").remove();
// 	};

	
	


	


</script>
<script src="/soccer/js/jquery-1.12.4.js"></script>
<script src="/soccer/js/bootstrap.js"></script>

<script>

	// 정보수정 버튼 클릭
	$("#updateBtn").click(function() {
		location.href = "/soccer/mypage/mypageinfoupdate.do";
	});

	 $("#withdrawalbtn").click(function (e) {
         e.preventDefault();
         $("#withdrawalModal").modal("show");
     });

     $("#modalY").click(function (e) {
//     	if(){
    		
//     	}else{
//     		e.preventDefault();
//     		$("#check").modal("show");
//     	}
    		
     });
	
	
	
</script>
<!-- dm페이지로 이동 -->
<script>
	$("#moreBtn").click(function() {
		location.href = "../webproject/dm.html";
	});
</script> 
<!-- 경기 일정 페이지로 이동 -->
<script>
	$("#moreBtn2").click(function() {
		location.href = "/soccer/";
	});
</script>


</body>

</html>