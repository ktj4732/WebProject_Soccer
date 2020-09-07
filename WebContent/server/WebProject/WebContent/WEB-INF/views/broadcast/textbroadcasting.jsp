<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/views/inc/asset.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/soccer/css/gamedetailinfo.css">
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <link rel="">
    <style>

    </style>
</head>

<%@include file="/WEB-INF/views/inc/header.jsp" %>

<div id="topBoard">
</div>

<div id="scoreBoard">
    <div id="subOuter">
        <div class="menuTitleBox">
            <div class="menuTitle">커뮤니티</div>
            <div class="breadcrumb">
                <span>HOME</span>
                <span>></span>
                <span>전력분석</span>
                <span>></span>
                <span>선수분석</span>
            </div>
            <div class="subMenuBox">
                <nav class="subMenu">
                    <ul>
                        <li class="subMenuItem"><a href="teamAnalysis.html">팀분석</a></li>
                        <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a
                                href="playerAnalysis.html">선수분석</a></li>
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
        <img src="/soccer/images/rogowithoutletter.png" class="contentTitleImg" /><span class="contentTitle">문자중계</span>
    </div>
    <div style="clear: both;"></div>
    <div class="centerInner">
        <!-- 어두운 파란색 배경 -->
        <div class="outerWraper">
            <!-- 선으로 되어 팀 이름과 로고 들어가는 박스 -->
            <div class="outerbox">
                <div class="teamOuter" id="teamOuterA">
                    <div>
                        <div class="teamName" id="teamNameA">${playerInfo1[0].teamname }FC</div>
                        <img src="/soccer/images/${playerInfo1[0].teamlogo}" />
                        <div class="underLine"></div>
                    </div>
                </div>
                <div class="score">
                    <div class="insidescore">
                        <span class="teamScore" id="teamA">0</span>
                        -
                        <span class="teamScore" id="teamB">0</span>
                    </div>
                </div>
                <div class="teamOuter" id="teamOuterB">
                    <div>
                        <div class="teamName" id="teamNameB">${playerInfo2[0].teamname }FC</div>
                        <img src="/soccer/images/${playerInfo2[0].teamlogo}" />
                        <div class="underLine"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="middle">
        <!-- 골넣은 결과 작성하는 곳 도움은 타이틀로 보이도록 함 -->
        <div class="gameSummary">
            <div id="teamSum">

            </div>
        </div>
    </div>
    <div class="middle2">
        <!-- 팀 엔트리 및 문자중계 -->
        <div class="entryOuter">
            <div class="entry" id="teamAEntry">
                <div class="player teamAPlayer playerHeader" id="teamAPlayer1">
                    <span class="backNum">번호</span>
                    <span class="playerName">이름</span>
                    <span class="position">포지션</span>
                </div>
                <c:forEach items="${playerInfo1 }" var="playerInfo" varStatus="status" >
                    <div class="player teamAPlayer" data-playerteam="${playerInfo.teamname}" id="teamAPlayer${status.index}" data-entryseq="${playerInfo.playerentry_seq}">
                        <span class="backNum">${playerInfo.backnumber }</span>
                        <span class="playerName">${playerInfo.playername }</span>
                        <span class="position">${playerInfo.position }</span>
                    </div>
                </c:forEach>
            </div>
            <div id="bsBoard">
                <div id="timer">00분00초</div>
                <div class="textBroadcast">
                    <span class="menuTitle2">문자 생중계</span>
                    <ul>
                        <%-- <c:forEach items="${textBroadCast}" var="textBroadCast">
                            <li>
                                <span class="evtTeam">[${textBroadCast.teamname }FC ]</span>
                                <span class="evtTime">[${textBroadCast.time }분]</span>
                                <span class="evtBacknumber">${textBroadCast.backnumber }번</span>
                                <span class="evtPlayerName">${textBroadCast.playername }선수</span>
                                <span class="evtEvent">${textBroadCast.event }</span>
                            </li>
                        </c:forEach> --%>
                    </ul>
                </div>
                <div id="contentBox"></div>
                <div id="action">
                    <h4>경기내용 단축키 입력</h4>
                    <table class="table table-bordered">
                        <tbody>
                            <c:forEach var="i" begin="0" end="${bcList.size()}" step="5">
                                <tr>
                                   		<td class="bcEvent" data-seq="${bcList[i].seq }"><kbd>${bcList[i].event}</kbd></td>
                                    <c:if test="${bcList.size()>=i+1}">
                                        <td class="bcEvent" data-seq="${bcList[i+1].seq }"><kbd>${bcList[i+1].event}</kbd></td>
                                    </c:if>
                                    
                                    <c:if test="${bcList.size()>=i+1}">
                                        <td class="bcEvent" data-seq="${bcList[i+2].seq }"><kbd>${bcList[i+2].event}</kbd></td>
                                    </c:if>
                                    
                                    <c:if test="${bcList.size()>=i+1}">
                                        <td class="bcEvent" data-seq="${bcList[i+3].seq }"><kbd>${bcList[i+3].event}</kbd></td>
                                    </c:if>
                                    
                                    <c:if test="${bcList.size()>=i+1}">
                                    	<td class="bcEvent" data-seq="${bcList[i+4].seq }"><kbd>${bcList[i+4].event}</kbd></td>
                                    </c:if>

                                </tr>
                            </c:forEach>
                            <tr>
                            	<td colspan="4"><button type="button" style="width:350px; margin-left:25px; font-size:1.2em;" id="gamebtn" class="btn btn-info">경기시작</button></td>
                            	<td><button type="button" style="font-size:1.2em;" id="tbbtn" class="btn btn-info">중계시작</button></td>
                            	
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="entry" id="teamBEntry">
                <div class="player teamBPlayer playerHeader" id="teamAPlayer1">
                    <span class="backNum">번호</span>
                    <span class="playerName">이름</span>
                    <span class="position">포지션</span>
                </div>
                <c:forEach items="${playerInfo2 }" var="playerInfo" varStatus="status">
                    <div class="player teamBPlayer" data-playerteam="${playerInfo.teamname}" id="teamBPlayer${status.index}" data-entryseq="${playerInfo.playerentry_seq}">
                        <span class="backNum">${playerInfo.backnumber }</span>
                        <span class="playerName" >${playerInfo.playername }</span>
                        <span class="position">${playerInfo.position }</span>
                    </div>
                </c:forEach>
            </div>

        </div>
    </div>
</div>
<!-- 내용 끝 -->





<!-- 하단부  -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>


<!-- 스크립트------------------------------------------------------------- -->
<!-- <script src="/js/gamedetailinfo.js"></script> -->

<script> //스크립트1
    //키코드 이벤트들
    //var which = "";

    var broadcastact_seq="";
    var playerEntry_seq="";
    var tT=""; // ajax로넘어갈 시간
    var i=0; //반복하면서 id=evt 넘버링
    var teamAgoal=0;
    var teamBgoal=0;
    
    var url="ws://localhost:8090/soccer/board/textbroadcastserver";
	var ws;
	
	$("#tbbtn").click(function(){
		if($(this).text()=="중계시작"){
			ws=new WebSocket(url); // 연결이 여기임
			
			//소켓 이벤트 매핑
			ws.onopen=function(){
				print("중계를 시작합니다.");
			};
			
			ws.onclose=function(){
				print("중계를 종료합니다.")
			};
			
			ws.onerror=function(evt){
				console.log(evt.data);
			};
			
			ws.onmessage=function(evt){
				//서버가 클라이언트에게 전달한 메시지
				//홍길동 + 안녕하세요
				console.log(evt.data);
				
				var txt= evt.data;
				print(txt);
				$(".textBroadcast").scrollTop(0);
			};
			$("#tbbtn").removeClass("btn-info");
	    	$("#tbbtn").addClass("btn-success");
			$("#tbbtn").text("중계중");
		}else if($(this).text()=="중계중") {//한번 더 누르면 소켓 종료
			ws.close();// 소켓 연결 끊기
			$("#tbbtn").removeClass("btn-success");
	    	$("#tbbtn").addClass("btn-warning");
			$("#tbbtn").text("연결끊김")
			$(this).attr({"disabled":true});
		}
	})
    $(document).bind('keypress', function (event) {
     	//  which += event.which + "";// 단축키를 쌓는다
     	//입력란 내용 삭제
        if (event.which == 26) {// ctrl + z
            $("#contentBox").css({ "border": "2px solid RGB(238,238,238)", "box-shadow": "" });
            $("#contentInfo").remove();
            $(".contentInfo2").remove();
            $(".contentInfo3").remove();
        }
     	
     	//데이터 전송 및 WS
        if (event.which == 10) { // 전송으로 사용
       		let backnumber="";
       		let playername="";
       		let goaltime="";
       		
        	//전광판에 점수와 득점선수 입력
        	if(broadcastact_seq==1){
        		if($("#contentInfo").attr("data-name")==1){//A팀
        		teamAgoal++;
    			$(".teamScore#teamA").text(teamAgoal);
        			let temp="<div id=\"evtA"+i++;
        			temp+="class=\"evts\">"
	        				+ "<div class=\"teamA\">"
	        				+ 	"<span class=\"evtBackNum\"></span>번<span>    </span>"
	        				+ 	"<span class=\"evtplayer\"></span>선수"
	        				+ "</div>"
	        				+ "<div class=\"time\"><span class=\"evtMinute\"></span><span class=\"bun\">분</span></div>"
	        				+ "<div class=\"teamB\">"
	        				+ "</div>"
	        				+ "</div>";
        			backnumber=$("#contentInfo .bn").text();
        			playername=$("#contentInfo .pn").text();
         			goaltime=$("#contentInfo .t").text().substring(1,3);
         			
         			$("#teamSum").append(temp);
         			$(".teamA .evtBackNum").text(backnumber);
         			$(".teamA .evtplayer").text(playername);
					$(".time .evtMinute").text(goaltime);
        		}else if($("#contentInfo").attr("data-name")==2){//B팀
        			teamBgoal++;
        			$(".teamScore#teamB").text(teamBgoal);
        			let temp="<div id=\"evtA"+i++;
        			temp+="class=\"evts\">"
	        				+ "<div class=\"teamA\">"
	        				+ "</div>"
	        				+ "<div class=\"time\"><span class=\"evtMinute\"></span><span class=\"bun\">분</span></div>"
	        				+ "<div class=\"teamB\">"
	        				+	"<span class=\"evtBackNum\"></span><span>    </span>번"
	        				+ 	"<span class=\"evtplayer\"></span>선수"
	        				+ "</div>"
	        				+ "</div>";
        			backnumber=$("#contentInfo .bn").text();
        			playername=$("#contentInfo .pn").text();
        			goaltime=$("#contentInfo .t").text().substring(1,3);
         			$("#teamSum").append(temp);
         			$(".teamB .evtBackNum").text(backnumber+"");
         			$(".teamB .evtplayer").text(playername+"");
					$(".time .evtMinute").text(goaltime+"");
        		}
        	}else{
       			backnumber=$("#contentInfo .bn").text();
       			playername=$("#contentInfo .pn").text();
       			goaltime=$("#contentInfo .t").text().substring(1,3);
        		}
        	//ws 사용
        	
      			ws.send(${leaguegame_seq}+"#" // 리그번호
      					+playerEntry_seq+"#" // 선수엔트리번호
      					+broadcastact_seq+"#"//액션번호
      					+tT+"#"				// 시간
      					+backnumber+"#"		// 등번호
      					+playername+"#"		// 선수이름
      					+$(".contentInfo2 .kbd").text()+"#" // 액션
      					+$(".contentInfo .tn").text());	//팀이름
      					
      			broadcastact_seq="";
  				playerEntry_seq="";
  				
  				tT="";
  				$("#contentBox").css({ "border": "2px solid RGB(238,238,238)", "box-shadow": "" });
  	            $("#contentInfo").remove();
  	            $(".contentInfo2").remove();
  	            $(".contentInfo3").remove(); 
       	
        }//ctrl + enter

    });

    //더블클릭을 통해 선수 정보를 입력창에 입력
	$(".player").dblclick(function () {

        var backnumber = $(this).find("span").eq(0).text();
        var playername = $(this).find("span").eq(1).text();
        var playerentry_seq= $(this).attr("data-entryseq");
        var playerteam=$(this).attr("data-playerteam");
        
        var time = $("#timer").text().substring(0, 3);
		tT=time.substring(0,2);
		if(flag){
	        if ($(this).hasClass("teamAPlayer")) {
	            var temp = "<div id='contentInfo' class='contentInfo info1' data-name='1' style='position: absolute; left:10%'>";
	            temp += "<span class='t'>[";
	            temp += time;
	            temp += "]</span>";
	            temp +="<span class='tn'>";
	            temp +=playerteam;
	            temp +="</span>"
	            temp += "<span class='bn'>";
	            temp += backnumber;
	            temp += "</span>번";
	            temp += "[<span class='pn'>";
	            temp += playername;
	            temp += "</span>]선수";
	            temp += "</div>";
	            $("#contentBox").css({ "border": " 2px solid RGB(134,0,0)", "box-shadow": "2px 2px 5px RGB(134,0,0), -2px -2px 5px RGB(134,0,0)" })
	        } else {//if
	            var temp = "<div id='contentInfo' class='contentInfo info2' data-name='2' style='position: absolute; left:10%'>";
	            temp += "<span class='t'>[";
	            temp += time;
	            temp += "]</span>";
	            temp +="<span class='tn'>";
	            temp +=playerteam;
	            temp +="</span>"
	            temp += "<span class='bn'>";
	            temp += backnumber;
	            temp += "번</span>";
	            temp += "[<span class='pn'>";
	            temp += playername;
	            temp += "</span>]선수";
	            temp += "</div>";
	            $("#contentBox").css({ "border": " 2px solid RGB(0,80,147)", "box-shadow": "2px 2px 5px RGB(0,80,147), -2px -2px 5px RGB(0,80,147)" })
	        }
			playerEntry_seq=$(this).attr("data-entryseq");
	        $("#contentBox").html(temp);
	      	//console.log($("#contentInfo").hasClass("info1"));
	        //console.log($("#contentInfo").attr("data-name"));
	        
	        
		}
    });//player -> dblclick
    
    //더블클릭을 통해 이벤트를 채운다.
	    $(".bcEvent").dblclick(function(){
	    	var temp="<div class='contentInfo2' value='no' style='width:100px; font-size:1.1em; position: absolute; left:45%; top:0%'>";
	    	temp+="<span class='kbd'>";
	    	temp+=$(this).find("kbd").text();
	    	temp+="</span></div>";
	    	
	    	broadcastact_seq=$(this).attr("data-seq");
	    	
	    	var ok="<div class='contentInfo3' value='no' style='width:100px;font-weight:bold; font-size:1.2em; position: absolute; left:70%; top:0%'>";
	    	ok+="<span class='kbd'>";
	    	ok+="Ctrl + Enter";
	    	ok+="</span></div>";
	    	
	    	if($("#contentInfo").length? true:false){
	    		$(".contentInfo2").remove();
	    		$(".contentInfo3").remove();
	   			$("#contentBox").append(temp);		
	   			$("#contentBox").append(ok);		
	    	}
	    })

</script>
<script type="text/javascript">
var time = 0;
var min = "";
var sec = "";
var flag=false;
var wsFlag=false;
var x="";
	$("#gamebtn").click(function(){
		if($(this).text()=="경기시작"){
	    	$("#gamebtn").removeClass("btn-info");
	    	$("#gamebtn").addClass("btn-success");
	    	$("#gamebtn").text("경기종료");
	    	timer();
		}else if($(this).text()=="경기종료"){
			$("#gamebtn").removeClass("btn-success");
	    	$("#gamebtn").addClass("btn-danger");
	    	$("#gamebtn").text("문자중계종료");
	    	timerclose();
		}
	})
    
	function timer(){
		flag=true;
    x = setInterval(function () {
        min = parseInt(time / 60);
        sec = time % 60;
        if (min < 10) {
            min = "0" + min;
        }
        if (sec < 10) {
            sec = "0" + sec;
        }
        $("#timer").html(min + '<span>분</span>' + sec + '<span>초</span>');

        time++;

        if (time > 5700) {
            clearInterval(x);
            $("timer").html("경기 종료");
        }
    }, 1000);
	}
	function timerclose(){
		flag=false;
		clearInterval(x);
	}
	
	function print(txt) {
		var temp = "";
		temp += "<li>";
		temp += txt;
		temp += "</li>"
		$(".textBroadcast ul").prepend(temp);
		}

</script>
</body>

</html>