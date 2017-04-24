<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>BookKing</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>/*hotpink*/
  	.container-fluid{width: 1580px;	max-width: none !important;	background-color: hotpink;}
  	.table {max-width: none !important; max-height: none !important; margin-top: 20px; color: black;}
	.table-responsive {min-height: none !important;	overflow-x: 0}
    body {position: relative;}
    #freeBoard_title{margin-left: 380px; filter: drop-shadow(1px 1px 1px rgba(0, 0, 0, .3)); width: 150px; height: 30px; padding-top: 5px; text-align: center;
	color: white;
	background-color: hotpink;
	border-top-left-radius: 1em; /*ì¼ìª½ ìë¨ ì½ëë¥¼ ë¶ëë½ê² */
	border-bottom-left-radius: 1em; /*ì¼ìª½ íë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	border-top-right-radius: 1em; /*ì¤ë¥¸ì¡± ìë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	border-bottom-right-radius: 1em; /*ì¤ë¥¸ìª½ íë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	font-size: 18px;
	font-weight: bold;
	}
    #bookInfoSection {height: 600px; color: black; background-color: white;}
	#book_info_body{border: 1px solid #eee; margin-left: 350px; margin-top: 20px; width: 1100px; padding: 50px; padding-top: 30px; padding-left: 50px; border-top: 2px solid #eee;}
	#book_info_body_goods{height: border: 1px solid #eee; margin-left: 350px; margin-top: 20px; width: 900px; padding: 50px; padding-top: 30px; padding-left: 50px; border-top: 2px solid black; border-bottom: 2px solid black; height: 400px;}
	.buy_button{margin-left: 650px; width: 150px; height: 60px;}
	img{border: 1px solid #ddd;}
	.form-group input[type=text]{
	border-top-left-radius: .5em; /*ì¼ìª½ ìë¨ ì½ëë¥¼ ë¶ëë½ê² */
	border-bottom-left-radius: .5em; /*ì¼ìª½ íë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	border-top-right-radius: .5em; /*ì¤ë¥¸ì¡± ìë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	border-bottom-right-radius: .5em; /*ì¤ë¥¸ìª½ íë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	border: 1px solid #ccc;
	padding-left: 15px;
	height: 27px;
}
td{width: 300px; border: 1px solid #ddd;}
.left_subCategory{float: left;}
.left_subCategory_list{height: 790px; width: 250px; margin-top: 10px; margin-left: 20px;}
.panel-default{border-color: #fff;}
.panel-default>.panel-heading {
    background-color: hotpink;
    color: white;
    filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));
    border-top-left-radius: .5em; /*ì¼ìª½ ìë¨ ì½ëë¥¼ ë¶ëë½ê² */
	border-bottom-left-radius: .5em; /*ì¼ìª½ íë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	border-top-right-radius: .5em; /*ì¤ë¥¸ì¡± ìë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	border-bottom-right-radius: .5em; /*ì¤ë¥¸ìª½ íë¨ ì½ëë¥¼ ë¶ëë½ê²*/
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
textarea{resize: none; width: 550px; height: 100px;}
.table-pay{width: 600px; margin-left: 500px;}
.alert-color{background: white;}
.alert-warning {
    color: black;
}
.number_button{width: 50px;}
table{font-size: 14px;}
#pageBoard{margin-left: 350px;}
.selectSearch{height: 25px;}
select{height: 25px; width: 150px;}
.p_bg{background-color: hotpink; color: white; height: 30px; padding-top: 5px;}
.btn-pos{margin-left: 300px;}
#text_size{width: 500px;}
  </style>
</head>
<body>
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
        	<a href="/seunghwang.bms/admin/AdminUserListAction.admin" class="list-group-item item-green-hover">회원 정보 관리</a>
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
		<form method="post">
			<table class="table table-boardered">
			<tbody>
				<tr>
					<td>회원이름</td>
					<td><input type="text" name="userName" placeholder="${User.getUserName()}"/></td>
					<td>ID <input type="hidden" name="userId" value="${User.getUserId()}"/></td>
					<td>${User.getUserId()}</td>
					<td>이메일</td>
					<td><input type="text" name="userEmail" placeholder="${User.getUserEmail()}" /></td>
				</tr>
				<tr>
					<td>가입일</td>
					<td>${User.getRegDate()}</td>
					<td>탈퇴상태</td>
					<td>
						<c:choose>
							<c:when test="${User.getUserState()>=3}"> 메일 인증 된 회원</c:when>
							<c:when test="${User.getUserState()<=0}">탈퇴 중인 회원</c:when>
							<c:when test="${User.getUserState()==1}">메일 인증 안된 회원"</c:when>
						</c:choose> <br>
						<select name="userState"> 
							<option>--</option>
							<option>메일인증</option>
							<option>메일인증미완</option>
						</select>
					</td>
					<td>광고수신여부</td>
					<td>
						<label><input type="checkbox" checked>email</label>
						<label><input type="checkbox">MMS</label>
					</td>
				</tr>
				<tr>
				<td>우편번호</td>
				<td><input type="text" name="userPost" placeholder="${User.getUserPost()}"/></td>					
					<td>회원주소</td>
					<td colspan="3"><input type="text" id="text_size" placeholder="${User.getUserAddress()}" /></td>
				</tr>
				<tr>
				<td>전화번호</td>
				<td><input type="text" name="userPhone" placeholder="${User.getUserPhone()}"/></td>
				<td>비밀번호</td>
				<td><input type="text"  name="userPw" placeholder="${User.getUserPw()}"/></td>
				</tr>
			</tbody>
		</table>

		<button type="submit" formaction="/seunghwang.bms/admin/AdminUserModifyAction.admin" class="btn btn-default btn-pos">수정</button>
		<button type="submit" formaction="/seunghwang.bms/admin/AdminUserDelAction.admin" class="btn btn-default">삭제하기</button>
		<button type="submit" formaction="/seunghwang.bms/admin/AdminUserListAction.admin" class="btn btn-default" onclick="location.href='user_manage.html'">목록</button>
		</form>
	</div>
</div>
</body>
</html>