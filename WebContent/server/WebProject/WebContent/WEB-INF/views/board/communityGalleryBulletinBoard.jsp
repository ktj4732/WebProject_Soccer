<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="/WEB-INF/views/inc/asset.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>	
    <link rel="stylesheet" href="/soccer/css/communityGalleryBulletinBoard.css">
    
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
                    <span>커뮤니티</span>
                    <span>></span>
                    <span>자유게시판</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem"><a href="/soccer/board/communityQuestionBulletinBoard.do">질문게시판</a></li>
                            <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a href="/soccer/board/communityGalleryBulletinBoard.do">갤러리</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/communityFreeBulletinBoard.do">자유게시판</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/communityLectureBulletinBoard.do">강의게시판</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/friendlymatchrecruit.do">친선경기모집</a></li>
                            <li class="subMenuItem"><a href="/soccer/board/mercenaryrecruit.do">용병모집</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->

	<!-- 내용 시작 -->
	
	   <div class="center">
        <div class="pageContentTitle"><img src="/soccer/images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">갤러리</span></div>

                <div id="centerMainBox" >   
                    <!-- 글 목록 보는 방식, 10개씩 보기 박스 -->
                    <div id="centerBox1">
                        <!-- 글 목록 보는 방식 -->
                        <span id="sortform">
                            <a href="#" class="glyphicon glyphicon-list"></a>
                            <a href="#" class ="glyphicon glyphicon-list-alt"></a>
                            <a href="#" class="glyphicon glyphicon-th-large"></a>
                        </span>       
                        <!-- 10개씩 보기 -->
                        <select name="" id="selectrow">
                            <option value="">10개씩 보기</option>
                            <option value="">25개씩 보기</option>
                            <option value="">50개씩 보기</option>   
                        </select>        
                    </div>
                    <div style="clear: both;"></div>
                    <!-- 전체 글 목록 바스 -->
                    <div id="centerBox2">
                        <!-- 글 하나 -->
                        <div id="centerBox2List1" class="centerBox2List">
                            <!-- 이미지 -->
                            <div id="box2li1"></div>
                            <div>
                                <!-- 내용 -->
                                <div id="box2li2"> 
                                    <div>
                                        <span><a href="">새로산 축구화</a></span>
                                    </div>                                    
                                    <div>
                                        <span>오희준</span>                                    
                                        <span>2020.03.20</span>
                                        <span><a href="#" class="glyphicon glyphicon-eye-open"></a> 30</span>                                    
                                        <span><a href="#" class="glyphicon glyphicon-comment"></a> 30</span>   
                                        <span><a href="#" class="glyphicon glyphicon-thumbs-up"></a>
                                            30</span>   
                                    </div>  
                                </div>
                            </div>
                        </div>     
                        <div id="centerBox2List2" class="centerBox2List">
                            <div id="box2li1"></div>
                            <div>
                                <div id="box2li2"> 
                                    <div>
                                        <span><a href="">새로산 축구화</a></span>
                                    </div>                                    
                                    <div>
                                        <span>오희준</span>                                    
                                        <span>2020.03.20</span>
                                        <span><a href="#" class="glyphicon glyphicon-eye-open"></a> 30</span>                                    
                                        <span><a href="#" class="glyphicon glyphicon-comment"></a> 30</span>   
                                        <span><a href="#" class="glyphicon glyphicon-thumbs-up"></a>
                                            30</span>   
                                    </div>  
                                </div>
                            </div>
                        </div>   
                        <div id="centerBox2List3" class="centerBox2List">
                            <div id="box2li1"></div>
                            <div>
                                <div id="box2li2"> 
                                    <div>
                                        <span><a href="">새로산 축구화</a></span>
                                    </div>                                    
                                    <div>
                                        <span>오희준</span>                                    
                                        <span>2020.03.20</span>
                                        <span><a href="#" class="glyphicon glyphicon-eye-open"></a> 30</span>                                    
                                        <span><a href="#" class="glyphicon glyphicon-comment"></a> 30</span>   
                                        <span><a href="#" class="glyphicon glyphicon-thumbs-up"></a>
                                            30</span>   
                                    </div>  
                                </div>
                            </div>
                        </div>    
                        <div id="centerBox2List4" class="centerBox2List">
                            <div id="box2li1"></div>
                            <div>
                                <div id="box2li2"> 
                                    <div>
                                        <span><a href="">새로산 축구화</a></span>
                                    </div>                                    
                                    <div>
                                        <span>오희준</span>                                    
                                        <span>2020.03.20</span>
                                        <span><a href="#" class="glyphicon glyphicon-eye-open"></a> 30</span>                                    
                                        <span><a href="#" class="glyphicon glyphicon-comment"></a> 30</span>   
                                        <span><a href="#" class="glyphicon glyphicon-thumbs-up"></a>
                                            30</span>   
                                    </div>  
                                </div>
                            </div>
                        </div>    
                        <div id="centerBox2List5" class="centerBox2List">
                            <div id="box2li1"></div>
                            <div>
                                <div id="box2li2"> 
                                    <div>
                                        <span><a href="">새로산 축구화</a></span>
                                    </div>                                    
                                    <div>
                                        <span>오희준</span>                                    
                                        <span>2020.03.20</span>
                                        <span><a href="#" class="glyphicon glyphicon-eye-open"></a> 30</span>                                    
                                        <span><a href="#" class="glyphicon glyphicon-comment"></a> 30</span>   
                                        <span><a href="#" class="glyphicon glyphicon-thumbs-up"></a>
                                            30</span>   
                                    </div>  
                                </div>
                            </div>
                        </div>          
                        <div id="centerBox2List6" class="centerBox2List">
                            <div id="box2li1"></div>
                            <div>
                                <div id="box2li2"> 
                                    <div>
                                        <span><a href="">새로산 축구화</a></span>
                                    </div>                                    
                                    <div>
                                        <span>오희준</span>                                    
                                        <span>2020.03.20</span>
                                        <span><a href="#" class="glyphicon glyphicon-eye-open"></a> 30</span>                                    
                                        <span><a href="#" class="glyphicon glyphicon-comment"></a> 30</span>   
                                        <span><a href="#" class="glyphicon glyphicon-thumbs-up"></a>
                                            30</span>   
                                    </div>  
                                </div>
                            </div>
                        </div>    
                        <div id="centerBox2List7" class="centerBox2List">
                            <div id="box2li1"></div>
                            <div>
                                <div id="box2li2"> 
                                    <div>
                                        <span><a href="">새로산 축구화</a></span>
                                    </div>                                    
                                    <div>
                                        <span>오희준</span>                                    
                                        <span>2020.03.20</span>
                                        <span><a href="#" class="glyphicon glyphicon-eye-open"></a> 30</span>                                    
                                        <span><a href="#" class="glyphicon glyphicon-comment"></a> 30</span>   
                                        <span><a href="#" class="glyphicon glyphicon-thumbs-up"></a>
                                            30</span>   
                                    </div>  
                                </div>
                            </div>
                        </div>   
                        <div id="centerBox2List8" class="centerBox2List">
                            <div id="box2li1"></div>
                            <div>
                                <div id="box2li2"> 
                                    <div>
                                        <span><a href="">새로산 축구화</a></span>
                                    </div>                                    
                                    <div>
                                        <span>오희준</span>                                    
                                        <span>2020.03.20</span>
                                        <span><a href="#" class="glyphicon glyphicon-eye-open"></a> 30</span>                                    
                                        <span><a href="#" class="glyphicon glyphicon-comment"></a> 30</span>   
                                        <span><a href="#" class="glyphicon glyphicon-thumbs-up"></a>
                                            30</span>   
                                    </div>  
                                </div>
                            </div>
                        </div>  
                        <div id="centerBox2List9" class="centerBox2List">
                            <div id="box2li1"></div>
                            <div>
                                <div id="box2li2"> 
                                    <div>
                                        <span><a href="">새로산 축구화</a></span>
                                    </div>                                    
                                    <div>
                                        <span>오희준</span>                                    
                                        <span>2020.03.20</span>
                                        <span><a href="#" class="glyphicon glyphicon-eye-open"></a> 30</span>                                    
                                        <span><a href="#" class="glyphicon glyphicon-comment"></a> 30</span>   
                                        <span><a href="#" class="glyphicon glyphicon-thumbs-up"></a>
                                            30</span>   
                                    </div>  
                                </div>
                            </div>
                        </div>  
                        <div id="centerBox2List10" class="centerBox2List">
                            <div id="box2li1"></div>
                            <div>
                                <div id="box2li2"> 
                                    <div>
                                        <span><a href="">새로산 축구화</a></span>
                                    </div>                                    
                                    <div>
                                        <span>오희준</span>                                    
                                        <span>2020.03.20</span>
                                        <span><a href="#" class="glyphicon glyphicon-eye-open"></a> 30</span>                                    
                                        <span><a href="#" class="glyphicon glyphicon-comment"></a> 30</span>   
                                        <span><a href="#" class="glyphicon glyphicon-thumbs-up"></a>
                                            30</span>   
                                    </div>  
                                </div>
                            </div>
                        </div>  
                    </div>
                    <!-- 페이지 버튼 -->
                    <div id="centerBox3">
                        <ul id="pagination" class="pagination">
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li><a class="nowPage" href="#" name="page">1</a></li>
                            <li><a href="#" name="page">2</a></li>
                            <li><a href="#" name="page">3</a></li>
                            <li><a href="#" name="page">4</a></li>
                            <li><a href="#" name="page">5</a></li>
                            <li><a href="#" name="page">6</a></li>
                            <li><a href="#" name="page">7</a></li>
                            <li><a href="#" name="page">8</a></li>
                            <li><a href="#" name="page">9</a></li>         
                            <li><a href="#" name="page">10</a></li>
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div style="clear: both;"></div>
                    <!-- 제목, 검색창, 검색버튼, 글쓰기 버튼 -->
                    <div id="centerBox4">
                        <div>                
                            <select style=" height: 25px;">
                                <option value="">제목</option>
                                <option value="">내용</option>
                                <option value="">제목+내용</option>
                                <option value="">글쓴이</option>
                            </select>
                            <input id="searchkeyword" type="text" size="35" style="height: 25px;">
                            <a href=""><input id="searchbtn" type="button" value="검색" class="btn btn-primary" ></a>
                           <input id="writebtn" type="button" value="글쓰기" onclick="location.href='ex01.html'"; class="btn btn-primary"> 
                        </div>
                    </div>
                    <div style="clear: both;"></div>
                </div>
          
    </div>
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

    $("#pagination > li >a").click(function() {

        // alert($(this).text());            
        $("#pagination > li>a").removeClass("nowPage");    
        $(this).addClass("nowPage");            

        })  

        $("#searchbtn, #writebtn").mouseover(function() {

        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");

        })

        $("#searchbtn, #writebtn").mouseout(function() {

        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");

        })


    </script>
    
    
</body>

</html>