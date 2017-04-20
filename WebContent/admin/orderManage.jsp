<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%!
	String orderId,userId;
%>
<%
	String searchTitle = request.getParameter("searchTitle");
	if(searchTitle != null && searchTitle.equals("orderId")){
		orderId="selected";
	}else if(searchTitle != null && searchTitle.equals("userId")){
		userId="selected";
	}	
%>
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
.btn-pos{margin-left: 870px;}
.td-size{width: 500px;}
.btn-default{height: 30px;}
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    background-color: hotpink;
    border-color: hotpink;
    color: white;
}
  </style>
<script>
	function list(){
		document.frm.action="./listOrder.ag";
		document.frm.submit();
	}
	
</script>  
</head>
<body>
<form name="frm" method="post">
<input type="hidden" name="orderId">
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
		<div>
			검색정보: 
			<select name="searchTitle" class="selectSearch">
				<option value="orderId" <%=orderId %>>주문번호</option>
				<option value="userId" <%=userId %> >ID</option>
			</select>
			<input type="text" name="searchContent"/>
			<button type="button" class="btn btn-default" onclick="list();">조회</button>
		</div>
			<table class="table table-hover">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>회원ID</th>
					<th class="td-size">배송지</th>
					<th>배송상태</th>
					<th>받는사람</th>
					<th>구매일</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${!empty adminorder}">
			<c:forEach var="order" items="${adminorder}">
				<tr onclick="location.href='./getOrder.ag?orderId=${order.orderId}'">
				 	<td>${order.orderId}</td>
					<td>${order.userId}</td>
					<td>${order.orderAddress}</td>
					<td>${order.orderStatus}</td>
					<td>${order.orderName}</td>
					<td>${order.orderDate}</td> 
				</tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty adminorder}">
			  	  <tr> 
					<td colspan="6" align="center">내용이 없습니다.</td>
				  </tr>	
			</c:if>    
			</tbody>
		</table>
		<div id="pageBoard">
		<ul class="pagination pagination-sm">
		<c:if test="${count > 0}">
		    <c:set var="pageCount" 
		           value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
		    <c:set var="startPage" value="${currentPage - (currentPage % 10) + 1}" />
		    <c:set var="endPage" value="${startPage + 10}" />
		    <c:if test="${endPage > pageCount}">
		        <c:set var="endPage" value="${pageCount}" />
		    </c:if>
		    
		    <center>
		    <c:if test="${startPage > 10}">
		        <a href="listOrder.ag?num=${startPage - 10}">[이전]</a>
		    </c:if>
		    
		    <c:forEach var="i" begin="${startPage}" end="${endPage}">
		        <a href="listOrder.ag?num=${i}">[${i}]</a>
		    </c:forEach>
		    
		    <c:if test="${endPage < pageCount}">
		        <a href="listOrder.ag?num=${startPage + 10}">[다음]</a>
		    </c:if>
		    </center>
		</c:if>   
		</ul>
	    </div>
	</div>
</div>
</form>
</body>
</html>