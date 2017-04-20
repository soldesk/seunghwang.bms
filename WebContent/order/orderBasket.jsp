<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	        String pageNum = request.getParameter("num");
	        if (pageNum == null || pageNum.equals("")) {
	            pageNum = "1";
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
    #freeBoard_title{margin-left: 380px; filter: drop-shadow(1px 1px 1px rgba(0, 0, 0, .3));	width: 150px; height: 30px; padding-left: 40px; padding-top: 5px;
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
	#book_info_body{border: 1px solid #eee; margin-left: 350px; margin-top: 20px; width: 900px; padding: 50px; padding-top: 30px; padding-left: 50px; border-top: 2px solid #eee;}
	#book_info_body_goods{height: border: 1px solid #eee; margin-left: 350px; margin-top: 20px; width: 900px; padding: 50px; padding-top: 30px; padding-left: 50px; border-top: 2px solid black; border-bottom: 2px solid black; height: 400px;}
	.buy_button{margin-top: 20px; margin-left: 590px; width: 100px; height: 40px;}
	.buy_button2{margin-top: 20px; width: 100px; height: 40px;}
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
.table-pos{margin-top: -20px; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-weight: bold; font-size: 18px; margin-left: 18px; color:#747474;}
  </style>
<script>
  function listCart(){
		 document.frm.action="./listCart.ct";
		 document.frm.submit();
  }
  
  function check(){
	    cbox = frm.bookId;
	    if(cbox.length) {  // 여러 개일 경우
	        for(var i = 0; i<cbox.length;i++) {
	            cbox[i].checked=frm.all.checked;
	        }
	    } else { // 한 개일 경우
	        cbox.checked=frm.all.checked;
	    }
  }
  
  function getOrder(){
	  cbox = frm.bookId;
	  var boolvar = false;
      for(var i = 0; i<cbox.length;i++) {
          if(cbox[i].checked){
        	  boolvar = true;
          }          
      }
        if(boolvar){
		   document.frm.action="./getOrder.do";
		   document.frm.submit();
        }else{
        	alert("체크를 안하셨습니다");
        	return false;
        }
  }
  
  function deleteCart(){
	  var con_test = confirm("전체 삭제 하시겠습니까?");
	  if(con_test == true){ 
		   document.frm.action="./deleteCart.ct";
		   document.frm.submit();
	  }
	  else if(con_test == false){
	      return false;
	  }  
  }

</script>  
</head>
<body>
<form name="frm" method="post">
<input type="hidden" name="num" value="<%=pageNum%>">
<div id="bookInfoSection" class="container-fluid">
	<h3 id="freeBoard_title">장바구니</h3>
	<div class="left_subCategory">
		<div class="left_subCategory_list">
			<div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c1">회원</a>
        </h4>
      </div>
      <div id="c1" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="/seunghwang.bms/login/login_info.jsp" class="list-group-item item-green-hover">내 정보</a>
        	<a href="/seunghwang.bms/login/login_password.jsp" class="list-group-item item-green-hover">비밀번호 변경</a>
        	<a href="/seunghwang.bms/login/login_drop.jsp" class="list-group-item item-green-hover">회원탈퇴</a>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c2">주문</a>
        </h4>
      </div>
      <div id="c2" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="/seunghwang.bms/order/orderHistory.do" class="list-group-item item-green-hover">구매내역</a>
        	<a href="/seunghwang.bms/order/listCart.ct" class="list-group-item item-green-hover" target="content">장바구니</a>
        </div>
      </div>
    </div>
  </div>
	</div>
	</div>
		<div id="book_info_body">
		<table class="table table-boardered table-pos">
			<tbody>
				<tr>
					<td><input type="checkbox" name="all" onclick="check();"/> 전체선택</td>
				</tr>
			</tbody>
		</table>
	<c:forEach var="cart" items="${carts}">
	  <input type="hidden" name="cartId" value="${cart.cartId}">
		<div class="alert alert-warning alert-color">
			<a href="javascript:location.href='./delCart.ct?cartId=${cart.cartId}&num=<%=pageNum%>';" class="close" data-dismiss="alert">&times;</a>
			<table class="table table-boardered">
			<thead>
				<tr>
					<th><p>상품 정보</p></th>
					<th><p>책이름</p></th>
					<th><p>수량</p></th>
					<th><p>할인</p></th>
					<th><p>판매가</p></th>
				</tr>
			</thead>
			<tbody>
				<tr><strong class="strong_position"><input type="checkbox" name="bookId" value="${cart.bookId}"/> 상품 정보</strong>
					<td rowspan="3"><img src="${cart.bookImage}" width="120px" height="150px"></td>
			        <td>${cart.bookName}</td>
					<td>${cart.bookAmount}</td>
					<td>0원</td>
					<td>${cart.bookPrice}원</td>
				</tr>
				<tr>
					<td colspan="3">총 합계</td>
					<td>${cart.bookPrice}원</td>
				</tr>
			</tbody>
		</table>
		</div>
	 </c:forEach>	

     <c:if test="${count == 0}">
     <div class="alert alert-warning alert-color">
			<a href="javascript:location.href='./delCart.ct?cartId=${cart.cartId}&num=<%=pageNum%>';" class="close" data-dismiss="alert">&times;</a>
			<table class="table table-boardered">
			<thead>
				<tr>
					<th><p>상품 정보</p></th>
					<th><p>책이름</p></th>
					<th><p>수량</p></th>
					<th><p>할인</p></th>
					<th><p>판매가</p></th>
				</tr>
			</thead>
			<tbody>
				<tr><strong class="strong_position"><input type="checkbox" name="bookId" value="${cart.bookId}"/> 상품 정보</strong>
					<td colspan="5" align="center">내용이 없습니다.</td>
				</tr>
			</tbody>
		</table>
		</div>
     </c:if>
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
        <a href="listCart.ct?num=${startPage - 10}">[이전]</a>
    </c:if>
    
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <a href="listCart.ct?num=${i}">[${i}]</a>
    </c:forEach>
    
    <c:if test="${endPage < pageCount}">
        <a href="listCart.ct?num=${startPage + 10}">[다음]</a>
    </c:if>
    </center>
</c:if>   
	 	
		<button type="button" class="btn btn-danger buy_button" onclick="deleteCart();">전체삭제</button>
		<button type="button" class="btn btn-danger buy_button2" onclick="getOrder();">결제하기</button>
		</div>
		
</div>
</form>
</body>
</html>