<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="seunghwang.bms.login.domain.User" %> 
<%@ page import="seunghwang.bms.book.domain.Book" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
	String len0 = request.getParameter("length0");
	String len1 = request.getParameter("length1"); 
	String len2 = request.getParameter("length2");
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
  	.table {max-width: none !important; max-height: none !important; margin-top: 20px;}
	.table-responsive {min-height: none !important;	overflow-x: 0}
    body {position: relative;}
    #freeBoard_title{margin-left: 380px; filter: drop-shadow(1px 1px 1px rgba(0, 0, 0, .3));	width: 150px; height: 30px; padding-left: 55px; padding-top: 5px;
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
	#book_info_body{border: 1px solid #F6F6F6; margin-left: 350px; margin-top: 20px; width: 900px; padding: 50px; padding-top: 20px; padding-left: 50px; border-top: 2px solid #F6F6F6; border-bottom: 2px solid #F6F6F6; height: 260px;}
	#book_info_body_goods{border: 1px solid #F6F6F6; margin-left: 350px; margin-top: 20px; width: 900px; padding: 50px; padding-top: 15px; padding-left: 50px; border-top: 2px solid #F6F6F6; border-bottom: 2px solid #F6F6F6; height: 300px;}
	#bookInfoSection button{margin-left: 950px; margin-top: -90px; width: 150px; height: 40px;}
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
a.item-green-hover:hover, a.item-green-hover:focus{ background-color: #F6F6F6;}
.book_info{margin-left: 250px; margin-top: -200px;}
.book_info p{filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-weight: bold; font-size: 18px;}
.book_money{margin-left: 330px; margin-top: 80px; color: red;}
.strong_position{margin-left: 10px; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-size: 18px;}
.td_bgcolor{background-color: #F6F6F6; font-weight: bold;}
textarea{resize: none; width: 500px; height: 55px;}
.table-pay{width: 750px; margin-left: 400px;}
.tbody_border{border-bottom: 1px solid #ddd;}
  </style>
 <script>
    function send(){
    	
    	if(document.frm.subject_name.value == ""){
    		alert("구매자 이름을 입력하세요!!");
    		document.frm.subject_name.focus();
    		return false;
    	}else if(document.frm.subject_address.value == ""){
    		alert("구매자 주소를 입력하세요!!");
    		document.frm.subject_address.focus();
    		return false;
    	}else if(document.frm.subject_phone.value == ""){
    		alert("구매자 전화번호를 입력하세요");
    		document.frm.subject_phone.focus();
    		return false;
    	}else if(document.frm.subject_memo.value == ""){
    		alert("구매자 메모를 입력하세요");
    		document.frm.subject_memo.focus();
    		return false;
    	}else{    	
	    	document.frm.action="./orderPayment.do";
	    	document.frm.submit();
    	}
    }
 </script> 
</head>
<body>
<form name="frm" method="post">
<input type="hidden" name="userId" value="${user.userId}"> 

<div id="bookInfoSection" class="container-fluid">
	<h3 id="freeBoard_title">주문</h3>
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
        	<a href="../user/user_info.html" class="list-group-item item-green-hover">내 정보</a>
        	<a href="../user/user_password.html" class="list-group-item item-green-hover">비밀번호 변경</a>
        	<a href="../user/user_drop.html" class="list-group-item item-green-hover">회원탈퇴</a>
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
        	<a href="orderHistory.jsp" class="list-group-item item-green-hover">구매내역</a>
        	<a href="orderBasket.jsp" class="list-group-item item-green-hover" target="content">장바구니</a>
        </div>
      </div>
    </div>
  </div>
	</div>
	</div>
		<div id="book_info_body">
		<table class="table table-hover">
			<tbody>
				<tr><strong class="strong_position">구매자 정보</strong>
					<td class="td_bgcolor" align="right" width="150px"><strong>아이디</strong></td>
					<td>${user.userId}</td>
				</tr>
				<tr>
					<td class="td_bgcolor" align="right"><strong>이메일주소</strong></td>
					<td>${user.userEmail}</td>
				</tr>
				<tr>
					<td class="td_bgcolor" align="right"><strong>이름</strong></td>
					<td>${user.userName}</td>
				</tr>
				<tr>
					<td class="td_bgcolor" align="right"><strong>휴대폰 번호</strong></td>
					<td>${user.userPhone}</td>
				</tr>
			</tbody>
		</table>
		</div>
		<div id="book_info_body">
		<table class="table table-hover">
			<tbody>
				<tr><strong class="strong_position">받는사람 정보</strong>
					<td class="td_bgcolor" align="right" width="150px"><strong>이름</strong></td>
					<td><input type="text" name="subject_name"></td>
				</tr>
				<tr>
					<td class="td_bgcolor" align="right"><strong>배송주소</strong></td>
					<td><input type="text" name="subject_address"></td>
				</tr>
				<tr>
					<td class="td_bgcolor" align="right"><strong>연락처</strong></td>
					<td><input type="number" name="subject_phone"></td>
				</tr>
				<tr>
					<td class="td_bgcolor" align="right"><strong>배송요청사항</strong></td>
					<td><textarea name="subject_memo"></textarea></td>
				</tr>
			</tbody>
		</table>
		</div>
	   <% int book_len = (Integer)request.getAttribute("book_len");
		  String[] bookAmount=  new String[book_len];
		  String[] bookPrice= new String[book_len];
		  bookAmount = request.getParameterValues("bookAmount");		 
	  	  bookPrice	 = request.getParameterValues("bookPrice");
          String[] amounts = new String[book_len];
          String[] price = new String[book_len];
          boolean bool1=true;
          boolean bool2=true;
          boolean bool3=true;
		 for(int i=0; i<book_len; i++){
			 
			 if(bool1 && !len0.equals("")){
				amounts[i] = bookAmount[0];
			    price[i]  = bookPrice[0];
			    bool1 =false;
			 }else if(bool2 && !len1.equals("")){
				 amounts[i] = bookAmount[1];
				 price[i]  = bookPrice[1];	
				 bool2 =false;
			 }else if(bool3 && !len2.equals("")){
				 amounts[i] = bookAmount[2];
				 price[i]  = bookPrice[2];	
				 bool3 =false;
			 }		
System.out.println( amounts[i] +"//"+ price[i]);			 
		 }
		  int amount=0, book_sum = 0;		 
		  
       for(int i=0; i<book_len; i++ ){   	   
           Book book = (Book)request.getAttribute("books["+i+"]"); //배열 북정보 가져오기 
           book_sum += Integer.parseInt(price[i]); //가격 합계
           amount += Integer.parseInt(amounts[i]);
           
           Book book_send= new Book(); // 서블릿에 보낼 정보
           book_send.setBookId(book.getBookId());
           book_send.setBookName(book.getBookName());
           book_send.setBookPrice(Integer.parseInt(price[i]));
           book_send.setBookImage(book.getBookImage());
           book_send.setBookAmount(Integer.parseInt(amounts[i]));
           
           HttpSession sess = request.getSession();
 		   sess.setAttribute("book_send["+i+"]", book_send);
 		   sess.setAttribute("book_length", book_len);
   	   
       %>

		<div id="book_info_body_goods">
			<table class="table table-boardered">
			<tbody>
				<tr>
					<th><p>상품 정보</p></th>
					<th><p>판매가</p></th>
					<th><p>수량</p></th>
					<th><p>할인</p></th>
					<th><p>비고</p></th>
				</tr>
	
	   			<tr><strong class="strong_position">상품 정보</strong>
					<td rowspan="3"><img src="<%=book.getBookImage() %>" width="120px" height="150px"></td>
					<td><%=book.getBookPrice() %>원</td>
					<td><%=amounts[i] %></td>
					<td>0원</td>
					<td>재고 있음.</td>
				</tr>
				
				<tr>
					<td colspan="2">총 합계</td>
					<td><%=price[i] %>원</td>
					<td></td>
				</tr>
		
			</tbody>
		</table>
		</div>
    	<% } %>	
		<table class="table table-hover table-pay">
			<tbody class="tbody_border">
				<tr>
					<td><strong>총 주문금액</strong></td>
					<td><%=book_sum %>원</td>
					<td>총 주문상품</td>
					<td><%=amount%>개</td>
				</tr>
				<tr>
					<td><strong>할인</strong></td>
					<td>0원</td>
					<td><strong>결제방법</strong></td>
					<td>
						<input type="radio" name="paymentChoice" value="무통장" checked>무통장
						<input type="radio" name="paymentChoice" value="카드">카드
					</td>
				</tr>
				<tr>
					<td><strong>총 결제금액</strong></td>
					<td><%=book_sum %>원</td>
				</tr>
			</tbody>
		</table>
	<button type="button" class="btn btn-danger" onclick="send();">결제하기</button>
</div>
<input type="hidden" name="book_sum" value="<%=book_sum %>">
</form>
</body>
</html>