<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>BookKing</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="seunghwang.bms.login.domain.User"%>

<style>/*hotpink*/
.container-fluid {
	width: 1580px;
	max-width: none !important;
	background-color: hotpink;
}

.table {
	max-width: none !important;
	max-height: none !important;
}

.table-responsive {
	min-height: none !important;
	overflow-x: 0
}

body {
	position: relative;
}

#freeBoard_title {
	margin-left: 350px;
	filter: drop-shadow(1px 1px 1px rgba(0, 0, 0, .3));
	width: 150px;
	height: 30px;
	padding-left: 40px;
	padding-top: 5px;
	color: white;
	background-color: hotpink;
	border-top-left-radius: 1em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: 1em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: 1em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: 1em; /*오른쪽 하단 코너를 부드럽게*/
	font-size: 18px;
	font-weight: bold;
}

#userInfoSection {
	height: 600px;
	color: black;
	background-color: white;
}

#user_info_body {
	border: 1px solid #eee;
	margin-left: 350px;
	margin-top: 25px;
	width: 600px;
	padding: 50px;
	padding-left: 30px;
	border-top: 2px solid #eee;
	border-bottom: 2px solid #eee;
}

.button-address {
	margin-left: 10px;
}

.user-modify {
	margin-left: 290px;
	margin-top: 20px;
	width: 150px;
}

#input-addressPos {
	margin-left: 10px;
}

#addr_size {
	width: 300px;
}

.form-group input[type=text] {
	border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
	border: 1px solid #ccc;
	padding-left: 15px;
	height: 27px;
}

.left_subCategory {
	float: left;
}

.left_subCategory_list {
	height: 790px;
	width: 250px;
	margin-top: 10px;
	margin-left: 20px;
}

.panel-default {
	border-color: #fff;
}

.panel-default>.panel-heading {
	background-color: hotpink;
	color: white;
	filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));
	border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
}

.category_accordion_button {
	background-color: hotpink;
	border-color: hotpink;
	font-size: 16px;
	font-weight: bold;
}

a.list-group-item:focus, a.list-group-item:hover, button.list-group-item:focus,
	button.list-group-item:hover {
	color: white;
	text-decoration: none;
	background-color: hotpink;
	font-size: 16px;
	font-weight: bold;
}

a.item-green-hover:hover, a.item-green-hover:focus {
	background-color: #EAEAEA;
}
</style>
</head>
<body>
	<div id="userInfoSection" class="container-fluid">
		<h3 id="freeBoard_title">회원정보</h3>
		<div class="left_subCategory">
			<div class="left_subCategory_list">
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="list-group-item category_accordion_button"
									data-toggle="collapse" data-parent="#accordion" href="#c1">회원</a>
							</h4>
						</div>
						<div id="c1" class="panel-collapse collapse">
							<div class="panel-body list-group">
								<a href="login_info.jsp" class="list-group-item item-green-hover">내
									정보</a> <a href="login_password.jsp"
									class="list-group-item item-green-hover">비밀번호 변경</a> <a
									href="login_drop.jsp" class="list-group-item item-green-hover">회원탈퇴</a>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="list-group-item category_accordion_button"
									data-toggle="collapse" data-parent="#accordion" href="#c2">주문</a>
							</h4>
						</div>
						<div id="c2" class="panel-collapse collapse">
							<div class="panel-body list-group">
								<a href="/seunghwang.bms/order/orderHistory.do"
									class="list-group-item item-green-hover">구매내역</a> <a
									href="/seunghwang.bms/order/listCart.ct"
									class="list-group-item item-green-hover">장바구니</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




		<c:set var="user" value="${sessionScope.authUser}" />

		<div id="user_info_body">
			<table class="table table-boardered">
				<tbody>
					<tr>
						<td width="165px"><strong>이름</strong></td>
						<td>${user.getUserName()}</td>
					</tr>
					<tr>
						<td><strong>ID</strong></td>
						<td>${user.getUserId()}</td>
					</tr>
					<tr>
						<td><strong>이메일</strong></td>
						<td>${user.getUserEmail()}</td>
					</tr>
					<tr>
						<td rowspan="2"><strong>주소</strong></td>
						<td>수정</td>
					</tr>
					<tr>
						<td>${user.getUserAddress()}</td>
					</tr>
					<tr>
						<td><strong>이메일 광고 수신여부</strong></td>
						<td>수신</td>
					</tr>
				</tbody>
			</table>
		</div>
		<button type="button" class="btn btn-default user-modify"
			onclick="location.href='login_modify.jsp'">수정</button>

		<button class="btn btn-default user-modify"
			onclick="window.location.href('/seunghwang/index.jsp')">메인으로</button>
	</div>
</body>
</html>