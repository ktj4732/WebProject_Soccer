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
	<link rel="stylesheet" href="css/community.css">
    
    <style>
    
    	#centerMainBox{
            /* border: 1px solid black; */
            width: 1300px;
            /* height: 2000px; */
            display: inline-block;
            font-size: 1.1em;
        }

        #box1, #box2, #box3 {

            /* border: 1px solid red; */
            width: 1300px;
            /* margin-top: 50px; */

        }

        #box1L, #box2L, #box3L {
            border: 1px solid black;
            width: 600px;
            float: left;      
            margin-left: 30px;      
            margin-top: 50px;
            margin-bottom: 15px;
        }

        #box1R, #box2R, #box3R {
            border: 1px solid black;
            width: 600px;
            float: left;      
            margin-left: 30px;      
            margin-top: 50px;
            margin-bottom: 15px;
        }

        #boxTitle {
            display: inline-block;
        }

        table tr {
            height: 38px;            
        }

        table, table td, table th {
            /* border: 1px solid black; */
            border-collapse: collapse;
        }

        .boxTitle {
            /* border: 1px solid blue; */
            margin-bottom: 15px;
            font-weight: bold;
            margin-left: 15px;
            padding-top: 10px;
        }

        table th:nth-child(1), table th:nth-child(5) {
            width: 65px;
            text-align: center;
        }

        table th:nth-child(3) {
            width: 80px;
            text-align: center;
        }

        table th:nth-child(2) {
            width: 300px;
            text-align: left;
        }

        table {
            text-align: center;
        }

        table td:nth-child(2), table td:nth-child(2) a {
            text-align: left;
            color: black;
        }

        #chart {
            width: 600px;
            height: 230px;
        }
    
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
                            <li class="subMenuItem"><a href="communityQuestionBulletinBoard.html">질문게시판</a></li>
                            <li class="subMenuItem"><a href="communityGalleryBulletinBoard.html">갤러리</a></li>
                            <li class="subMenuItem"><a href="communityFreeBulletinBoard.html">자유게시판</a></li>
                            <li class="subMenuItem"><a href="communityLectureBulletinBoard.html">강의게시판</a></li>
                            <li class="subMenuItem"><a href="friendlymatchrecruit.html">친선경기모집</a></li>
                            <li class="subMenuItem"><a href="mercenaryrecruit.html">용병모집</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->

	<!-- 내용 시작 -->
	
	   <div class="center">
        <div class="pageContentTitle"><img src="images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">자유게시판</span></div>

                <div id="centerMainBox">
                   
                    <div id="box1"> 
                        <div id=box1L>
                            <div class="boxTitle">자유게시판</div>
                            <table class="table table-striped">
                                <tr>
                                    <th>순번</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>일시</th>
                                    <th>조회수</th>
                                </tr>   
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>                             
                            </table>                            
                        </div>
                        <div id=box1R>
                            <div class="boxTitle">질문게시판</div>
                            <table class="table table-border">
                                <tr>
                                    <th>순번</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>일시</th>
                                    <th>조회수</th>
                                </tr>   
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>               
                            </table>                               
                        </div>
                    </div>                    
                    <div id="box2"> 
                        <div id=box2L>
                            <div class="boxTitle">갤러리</div>
                            <table class="table table-border">
                                <tr>
                                    <th>순번</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>일시</th>
                                    <th>조회수</th>
                                </tr>   
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>                      
                            </table>                 
                        </div>
                        <div id=box2R>
                            <div class="boxTitle">강의게시판</div>
                            <table class="table table-border">
                                <tr>
                                    <th>순번</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>일시</th>
                                    <th>조회수</th>
                                </tr>   
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>                          
                            </table>                 
                        </div>
                    </div>
                    <div id="box3"> 
                        <div id=box3L>
                            <div class="boxTitle">친선경기모집</div>
                            <table class="table table-border">
                                <tr>
                                    <th>순번</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>일시</th>
                                    <th>조회수</th>
                                </tr>   
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>              
                                <tr>
                                    <td>1</td>
                                    <td><a>테스트 입니다</a></td>
                                    <td>테스트</td>
                                    <td>2020.02.02</td>
                                    <td>22</td>
                                </tr>                          
                            </table>                 
                        </div>
                        <div id=box3R>
                            <h1>몸무게 변환 <small>2019</small></h1>
                            <div id="chart"></div>               
                        </div>
                    </div>
                    
                </div>

    </div>
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script type="text/javascript">

        Highcharts.chart('chart', {

            title: {
                //메인 타이틀
                text: '몸무게 변화 기록'
            },

            subtitle: {
                //서브 타이틀
                text: '오전 9시 측정'
            },

            yAxis: {
                //y축 타이틀

                title: {
                    text: '몸무게'                
                },

                // labels: {
                //         // enabled: true,
                //         formatter: function() {
                //          return parseInt((this.value));
                //         }
                //     }

                // allowDecimals: false,
                // reversed: true,
                // startOnTick: false,
                // endOnTick: false,
            
            },

            xAxis: {
                //x축 타이틀
                accessibility: {
                    rangeDescription: 'Range: 2010 to 2017'
                }
            },

            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle'
            },

            plotOptions: {
                series: {
                    label: {
                        connectorAllowed: false
                    },
                    pointStart: 1
                }
            },

            series: [
            {
                name: '홍길동',
                data: [70, 69, 71, 73, 75, 78, 82, 78, 75, 73, 70, 68]
            },
            {
                name: '아무개',
                data: [78, 83, 85, 90, 95, 100, 92, 87, 82, 75, 70, 64]
            }
            ],

            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 500
                    },
                    chartOptions: {
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom'
                        }
                    }
                }]
            }

        });
    </script>
    
    
</body>

</html>