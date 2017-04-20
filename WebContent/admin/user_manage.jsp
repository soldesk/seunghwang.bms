<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>BookKing</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
 
  <style>/*hotpink*/
  	.container-fluid{width: 1580px;	max-width: none !important;	background-color: hotpink;}
  	.table {max-width: none !important; max-height: none !important; margin-top: 20px; color: black;}
	.table-responsive {min-height: none !important;	overflow-x: 0}
    body {position: relative;}
    #freeBoard_title{margin-left: 380px; filter: drop-shadow(1px 1px 1px rgba(0, 0, 0, .3)); width: 150px; height: 30px; padding-top: 5px; text-align: center;
	color: white;
	background-color: hotpink;
	border-top-left-radius: 1em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: 1em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: 1em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: 1em; /*오른쪽 하단 코너를 부드럽게*/
	font-size: 18px;
	font-weight: bold;
	}
    #bookInfoSection {height: 600px; color: black; background-color: white;}
	#book_info_body{border: 1px solid #eee; margin-left: 350px; margin-top: 20px; width: 1100px; padding: 50px; padding-top: 30px; padding-left: 50px; border-top: 2px solid #eee;}
	#book_info_body_goods{height: border: 1px solid #eee; margin-left: 350px; margin-top: 20px; width: 900px; padding: 50px; padding-top: 30px; padding-left: 50px; border-top: 2px solid black; border-bottom: 2px solid black; height: 400px;}
	.buy_button{margin-left: 650px; width: 150px; height: 60px;}
	img{border: 1px solid #ddd;}
	.form-group input[type=text]{
	border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
	border: 1px solid #ccc;
	padding-left: 15px;
	height: 27px;
}
td{width: 300px;}
.left_subCategory{float: left;}
.left_subCategory_list{height: 790px; width: 250px; margin-top: 10px; margin-left: 20px;}
.panel-default{border-color: #fff;}
.panel-default>.panel-heading {
    background-color: hotpink;
    color: white;
    filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));
    border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
}
.category_accordion_button{background-color: hotpink; border-color: hotpink; font-size: 16px; font-weight: bold;}
a.list-group-item:focus, a.list-group-item:hover, button.list-group-item:focus, button.list-group-item:hover {
    color: white;
    text-decoration: none;
    background-color: hotpink;
    font-size: 16px;
    font-weight: bold;
}
a.item-green-hover:hover, a.item-green-hover:focus{ background-color: #EAEAEA;}
.book_info{margin-left: 250px; margin-top: -200px;}
.book_info p{filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-weight: bold; font-size: 18px;}
.book_money{margin-left: 330px; margin-top: 80px; color: red;}
.strong_position{margin-left: 10px; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-size: 18px;}
.td_bgcolor{background-color: #eee; font-weight: bold;}
textarea{resize: none; width: 500px; height: 60px;}
.table-pay{width: 600px; margin-left: 500px;}
.alert-color{background: white;}
.alert-warning {
    color: black;
}
.number_button{width: 50px;}
tr{cursor: pointer;}
table{font-size: 14px;}
#pageBoard{margin-left: 350px;}
.selectSearch{height: 25px;}
.btn-pos{margin-left: 900px;}
.btn-default{height: 30px;}
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    background-color: hotpink;
    border-color: hotpink;
    color: white;
}
  </style>
</head>
<body>
<%@ include file="../login/alert.jsp" %> 
<div id="bookInfoSection" class="container-fluid">
	<h3 id="freeBoard_title">회원 정보 관리</h3>
	<div class="left_subCategory">
		<div class="left_subCategory_list">
			<div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c1" onfocus="#c1">관리자 메뉴</a>
        </h4>
      </div>
      <div id="c1" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="user_manage.jsp" class="list-group-item item-green-hover">회원 정보 관리</a>
        	<a href="../book/bookManage.jsp" class="list-group-item item-green-hover">책 정보 관리</a>
        	<a href="/seunghwang.bms/admin/listOrder.ag" class="list-group-item item-green-hover">주문 정보 관리</a>
        	<a href="banner_manage.html" class="list-group-item item-green-hover">배너관리</a>
        </div>
      </div>
    </div>
  	</div>
	</div>
	</div>
		<div id="book_info_body">
		<div>
			검색정보: 
			<select class="selectSearch">
				<option>전체</option>
				<option>책이름</option>
				<option>출판사</option>
				<option>작가</option>
				<option>출판일 기준</option>
			</select>
			<input type="text"/>
			<button type="button" class="btn btn-default">조회</button>
		</div>
			<table class="table table-hover">
			<thead>
				<tr>
					<th>IDX</th>
					<th>ID</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>가입일</th>
					<th>탈퇴 여부</th>
				</tr>
			</thead>
			<tbody>
				<tr onclick="location.href='user_manage_modify.jsp'">
					<td>1</td>
					<td>comictuna</td>
					<td>오세준</td>
					<td>rkdalsrbs0@naver.com</td>
					<td>010-0000-0000</td>
					<td>2017-01-01</td>
					<td></td>
				</tr>
				<tr onclick="location.href='#'">
					<td>2</td>
					<td>comictuna</td>
					<td>오세준</td>
					<td>rkdalsrbs0@naver.com</td>
					<td>010-0000-0000</td>
					<td>2017-01-01</td>
					<td>탈퇴</td>
				</tr><tr onclick="location.href='#'">
					<td>3</td>
					<td>comictuna</td>
					<td>오세준</td>
					<td>rkdalsrbs0@naver.com</td>
					<td>010-0000-0000</td>
					<td>2017-01-01</td>
					<td></td>
				</tr><tr onclick="location.href='#'">
					<td>4</td>
					<td>comictuna</td>
					<td>오세준</td>
					<td>rkdalsrbs0@naver.com</td>
					<td>010-0000-0000</td>
					<td>2017-01-01</td>
					<td>탈퇴</td>
				</tr><tr onclick="location.href='#'">
					<td>5</td>
					<td>comictuna</td>
					<td>오세준</td>
					<td>rkdalsrbs0@naver.com</td>
					<td>010-0000-0000</td>
					<td>2017-01-01</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		
		<button type="button" class="btn btn-default btn-pos" id="addUserButton" data-toggle="modal" data-target="#userJoin" >회원 추가</button>
		<div class="modal fade" id="userJoin" >
    				<div class="modal-dialog">    
      				<div class="modal-content">
        			<div class="modal-header">
          				<button type="button" class="close" data-dismiss="modal">×</button>
          				<h4 class="modal-title">회원가입</h4>
        			</div>
        			<div class="modal-body">
        			<form action="adminUserAdddAction.admin" method="post">
		    		<div class="form-group">
		      			<input type="text" id="idSize" name="userId" placeholder="아이디" tabindex=1 required>
		      			<input type="submit" formaction="FindSameIdServlet" value="중복확인" required />
		    		</div>
		    		<div class="form-group">
		      			<input type="password" class="form-control" name="userPw" required placeholder="비밀번호" tabindex=2>
		      			<input type="password" class="form-control" name="userPw2" required placeholder="비밀번호 확인" tabindex=3>
		    		</div>
		    		<div class="form-group">
		    		<input type="text" id="sample6_postcode" name="userPost" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" required><br>
						<input type="text" id="sample6_address" name="userAddress1" placeholder="주소" required>
						<input type="text" id="sample6_address2" name="userAddress2"  placeholder="상세주소" required>
		    		
		    		
		      		<!-- 	<input type="text" class="form-control" name="userEmail" placeholder="이메일주소" tabindex=4><br>
		      			<input type="text" id="sample2_postcode" name="userPost" placeholder="우편번호">
						<input type="button" class="btn btn-default"onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample2_address" placeholder="한글주소">
						<input type="text" id="sample2_addressEnglish" placeholder="영문주소"> -->
		    		</div>
		    		<div class="form-group">
		      			<input type="text" class="form-control" name="userName" placeholder="이름" tabindex=5 required>
		      			<input type="text" class="form-control" name="userEmail" placeholder="이메일주소" tabindex=6 required>
		      			<input type="text" class="form-control" placeholder="출생년도" tabindex=7 required>
		      			<input type="text" class="form-control" name="userPhone" placeholder="핸드폰번호" tabindex=8 required>
		      			
		    		</div>
		    		<div class="form-group">
		    		<table class="table table-hover">
						<tbody>
							<tr>
								<td><strong>성별</strong></td>
								<td>
									<label>남 <input type="radio" name="gender" value="male" checked></label>
									<label>여 <input type="radio" name="gender" value="female"></label>
								</td>
							</tr>
							<tr>
								<td><strong>문자 광고수신 여부</strong></td>
								<td>
									<label>수신 <input type="radio" name="messageAd" value="messageAgree" checked></label>
									<label>미수신 <input type="radio" name="messageAd" value="messageDiss"></label>
								</td>
							</tr>
							<tr>
								<td><strong>이메일 광고수신 여부</strong></td>
								<td>
									<label>수신 <input type="radio" name="emailAd" value="emailAgree" checked></label>
									<label>미수신 <input type="radio" name="emailAd" value="emailDiss"></label>
								</td>
							</tr>
					
						</tbody>
					</table>
		    		</div>
					<div class="btn-group btn-group-lg loginGroup">
						<button type="submit"  class="btn btn-danger loginButt" tabindex=7>가입 완료</button>
					</div>
  					</form>
        		</div>
				<div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>      
		</div>
	</div>
</div>
		
		
		
		<div id="pageBoard">
		<ul class="pagination pagination-sm">
			<li><a href="#"></a></li>
			<li class="active"><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">>></a></li>
		</ul>
	</div>
	</div>

</body>
</html>