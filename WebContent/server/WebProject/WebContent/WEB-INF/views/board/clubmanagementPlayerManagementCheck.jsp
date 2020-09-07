<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/soccer/css/jquery-ui.css">
    <link rel="stylesheet" href="/soccer/css/bootstrap.css">    
    <link rel="stylesheet" href="css/clubmanagementPlayerManagementCheck.css">
    <script src="/soccer/js/jquery-1.12.4.js"></script>
    <script src="/soccer/js/bootstrap.js"></script>
    <script src="/soccer/js/jquery-ui.js"></script>
    <style>
	
		 /* 모달 */
        .modal-body {
            text-align: center;
            font-size: 1.1em;

        }

        .modal {
            text-align: center;
        }

        @media screen and (min-width: 768px) {
            .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
            }
        }

        .modal-dialog {
            display: inline-block;
            text-align: left;
            vertical-align: middle;
        }
	
    </style>
</head>

<body>

   
    <div id="mainBox">
        
        <div id="box1">
            
            <div id="box1L">
                <img src="" alt="">
            </div>
            <div id="box1R">
                <table class="table">
                    <tr>
                        <td>이름</td>
                        <td>오희준</td>                        
                    </tr>
                    <tr>
                        <td>나이</td>
                        <td>26</td>                        
                    </tr>
                    <tr>
                        <td>포지션</td>
                        <td>MF</td>                        
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td>010-2222-2222</td>                        
                    </tr>
                    <tr>
                        <td>입단일시</td>
                        <td>2020.07.21</td>                        
                    </tr>
                </table>
            </div>
        </div>        
        <div style="clear: both;"></div>

        <div id="box2">
            <table>
                <thead class="table">
                    <tr>
                        <th><input type="checkbox" name="" id=""></th>
                        <th>멘트</th>
                        <th>일자</th>
                    </tr>
                </thead>
                <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>집에 가고 싶다</td>
                    <td>2020.07.21</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
        <div id="box3">
            <span>
                <input type="button" value="삭제" class="btn btn-primary" id="del">
            </span>
            <span>
                <input type="button" value="수정" class="btn btn-primary" id="update">
            </span>
            <span>
                <input type="button" value="추가" class="btn btn-primary" id="add">
            </span>
        </div>

    </div>
    
     <!-- 삭제하기 Modal-->
        <div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document" style="width: 400px;">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #25282A;">
                    <div class="modal-title" id="exampleModalLabel" style="color: #92DAEC; display: inline;" >수정 완료</div>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" style="color: white; font-size: 0.9em;">X</span>
                    </button>
                </div>
                <div class="modal-body">삭제 하시겠습니까?</div>
                <div class="modal-footer">
                    <!-- 예/아니오 선택 버튼 -->
                    <a class="btn btn-primary" id="modalY" href="#" data-dismiss="modal">예</a>
                    <button class="btn btn-primary" type="button" data-dismiss="modal">아니요</button>
                </div>
            </div>
        </div>
        </div>
    
    
    
    <style>

       

    </style>

    <script>

    	$("#box3 input" ).mouseover(function() {

        // alert($(this).text());
        $(this).css("background-color", "red").css("color", "black");

        })

        $("#box3 input").mouseout(function() {

        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");

        })
        
        // 삭제하기 모달
        $("#del").click(function (e) {
            e.preventDefault();
            $("#delModal").modal("show");
        });

    </script>

</body>

</html>