<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>	
<%@ page import="seunghwang.bms.book.domain.Book" %>
<%
 HttpSession sess = request.getSession();
 int book_len = (int)sess.getAttribute("book_length");
 
 for(int i=0; i<book_len; i++){
   Book book = (Book)sess.getAttribute("book_send["+i+"]"); 
   sess.setAttribute("book_send["+i+"]", book);
 }
 request.setCharacterEncoding("UTF-8");
%>
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
	margin-left: 500px;
	margin-top: 20px;
	width: 150px;
}

.user-button {
	width: 150px;
	margin-top: 20px;
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

.tab_bgcolor {
	background-color: hotpink;
}

#table_size {
	margin-left: 80px;
	width: 380px;
	color: black;
	font-size: 15px;
}

#table_title {
	font-weight: bold;
}
</style>
<script type="text/javascript">
	function payMent() {
		document.frm.action = "./addOrder.do";
		document.frm.submit();
	}

	function cancel() {
		alert("결제가 취소되었습니다.");
		history.back(-1);
	}
</script>
</head>
<body>
	<form name="frm" method="post">
<input type="hidden" name="userId" value="<%=request.getParameter("userId")%>"> 
<input type="hidden" name="subject_name" value="<%=request.getParameter("subject_name")%>"> 
<input type="hidden" name="subject_address" value="<%=request.getParameter("subject_address")%>"> 
<input type="hidden" name="subject_phone" value="<%=request.getParameter("subject_phone")%>"> 
<input type="hidden" name="subject_memo" value="<%=request.getParameter("subject_memo")%>"> 
<input type="hidden" name="paymentChoice" value="<%=request.getParameter("paymentChoice")%>"> 
		<div id="userInfoSection" class="container-fluid">
			<h3 id="freeBoard_title">주문결제</h3>
			<div id="user_info_body">
				<table class="table table-hover" id="table_size">
					<tbody>
						<tr align="center">
							<td colspan="2" id="table_title">주문하신 상품을 결제하시겠습니까?</td>
						</tr>
						<tr align="center">
							<td>결제방식</td>
							<td><%=request.getParameter("paymentChoice")%></td>
						</tr>
						<tr align="center">
							<td>결제금액</td>
							<td><%=request.getParameter("book_sum")%>원</td>
						</tr>
					</tbody>
				</table>
			</div>
			<button type="button" class="btn btn-default user-modify"
				onclick="payMent();">결제</button>
			<button type="button" class="btn btn-default user-button"
				onclick="cancel();">취소</button>
		</div>
	</form>
</body>
</html>
