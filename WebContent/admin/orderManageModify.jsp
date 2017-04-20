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
textarea{resize: none; width: 550px; height: 100px;}
.table-pay{width: 600px; margin-left: 500px;}
.alert-color{background: white;}
.alert-warning {
    color: black;
}
.number_button{width: 50px;}
table{font-size: 13px;}
td{border: 1px solid #ddd;}
#pageBoard{margin-left: 350px;}
.selectSearch{height: 25px;}
select{height: 25px; width: 150px;}
.p_bg{background-color: hotpink; color: white; height: 30px; padding-top: 5px;}
.btn-pos{margin-left: 300px;}
#text_size{width: 400px;}
#count_btn{width: 50px;}
#pay_btn{width: 100px;}
  </style>  
<script>
  function update(){
      document.frm.action="./updateOrder.ag";
      document.frm.submit();
      alert("수정하였습니다.");
  }

  function del(){
      document.frm.action="./deleteOrder.ag";
      document.frm.submit();
      alert("삭제하였습니다.");
  }

</script>
</head>
<body>
<form name="frm" method="post">
<input type="hidden" name="orderId"  value="${order.orderId}">
<div id="bookInfoSection" class="container-fluid">
	<h3 id="freeBoard_title">주문 정보 관리</h3>
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
			<table class="table table-boardered">
			<tbody>
				<tr>
					<td>주문번호</td>
					<td>${order.orderId}</td>
					<td>회원 ID</td>
					<td>${order.userId}</td>
					<td>결제수단</td>
					<td>
						<label><input type="radio" name="paymentChoice" value="무통장" 
						<c:if test="${order.paymentChoice=='무통장'}">
						checked
						</c:if>
						>무통장</label>
						<label><input type="radio" name="paymentChoice" value="카드"
					    <c:if test="${order.paymentChoice=='카드'}">
					    checked
						</c:if>
						>카드</label>
					</td>
				</tr>
				<tr>
					<td>배송지</td>
					<td colspan="3"><input type="text" id="text_size" name="orderAddress" value="${order.orderAddress}"/></td>
					<td>받는사람</td>
					<td><input type="text" id="pay_btn" name="orderName" value="${order.orderName}"/></td>
				</tr>
				<tr>
					<td colspan="6" align="center">세부 주문 정보</td>
				</tr>
				<tr>
					<td>책 고유번호</td>
					<td>책 제목</td>
					<td>수량</td>
					<td>가격</td>
					<td>배송상태</td>
					<td>주문 삭제</td>
				</tr><%int i=1 ,sum=0;%>
				<c:if test="${!empty adminorder}">
				<c:forEach  var="adminorder" items="${adminorder}" >
				<tr> 
					<td><input type="text" name="bookId" value="${adminorder.bookId}"/></td>
					<td><input type="text" name="bookName" value="${adminorder.bookName}"/></td>
					<td><input type="text" name="bookAmount" id="count_btn" value="${adminorder.bookAmount}"/></td>
					<td><input type="text" name="bookPrice" id="pay_btn" value="${adminorder.bookPrice}"/></td>
					<td>
						<label><input type="radio" name="orderStatus<%=sum %>" value="배송중" checked
					    <c:if test="${adminorder.orderStatus=='배송중'}">
					    checked
						</c:if>
						>배송중</label>
						<label><input type="radio" name="orderStatus<%=sum %>" value="완료"
						<c:if test="${adminorder.orderStatus=='완료'}">
					    checked
						</c:if>					
						>완료</label>
					</td>
					<td><button type="button" class="btn btn-default" onclick="location.href='./delOrder.ag?orderId=${adminorder.orderId}&bookId=${adminorder.bookId}'">삭제</button></td>
				</tr><%sum=i++; %> 
				</c:forEach>
				</c:if>
				<c:if test="${empty adminorder}">
			  	  <tr> 
					<td colspan=5>내용이 없습니다.</td>
				  </tr>	
				</c:if>

			</tbody>
		</table>
		<button type="button" class="btn btn-default btn-pos" onclick="update();">수정완료</button>
		<button type="button" class="btn btn-default" onclick="del();">삭제하기</button>
		<button type="button" class="btn btn-default" onclick="location.href='./listOrder.ag'">목록보기</button>
	</div>
</div>
</form>
</body>
</html>